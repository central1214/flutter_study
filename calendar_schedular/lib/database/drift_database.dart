//import는 private 값은 가져올수 없다
import 'dart:io';

import 'package:calendar_schedular/model/category_color.dart';
import 'package:calendar_schedular/model/schedule.dart';
import 'package:calendar_schedular/model/schedule_with_color.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// priavte값까지 다 불러 올 수 있다.
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
    CategoryColor,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> createCategoryColor(CategoryColorCompanion data) =>
      into(categoryColor).insert(data);

  Future<List<CategoryColorData>> getCategoryColors() =>
      select(categoryColor).get();

  Future<Schedule> getSheetData(int id) =>
      (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  Future<int> updateScheduleById(int id, SchedulesCompanion data) =>
      (update(schedules)..where((tbl) => tbl.id.equals(id))).write(data);

  Stream<List<ScheduleWithColor>> watchSchedules(DateTime date) {
    final query = select(schedules).join([
      innerJoin(categoryColor, categoryColor.id.equalsExp(schedules.colorId))
    ]);
    query.where(schedules.date.equals(date));
    query.orderBy([
      OrderingTerm.asc(schedules.startTime),
    ]);
    return query.watch().map(
          (rows) => rows
              .map(
                (row) => ScheduleWithColor(
                  schedule: row.readTable(schedules),
                  categoryColor: row.readTable(categoryColor),
                ),
              )
              .toList(),
        );
  }

  // final query = select(schedules);
  // query.where((tbl) => tbl.date.equals(date));
  // return query.watch();
  // int number = 3;
  // final resp = number.toString(); // resp = '3'
  // final resp2 = number..toString(); // resp2 = 3 ..은 함수가 실행된 대상이 불려옴

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
