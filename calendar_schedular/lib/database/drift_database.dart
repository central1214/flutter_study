//import는 private 값은 가져올수 없다
import 'dart:io';

import 'package:calendar_schedular/model/category_color.dart';
import 'package:calendar_schedular/model/schedule.dart';
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
