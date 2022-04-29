import 'package:drift/drift.dart';

class Schedules extends Table {
  //PRIMARY_KEY
  IntColumn get id => integer().autoIncrement()();

  //내용
  TextColumn get content => text()();

  //일정날짜
  DateTimeColumn get date => dateTime()();

  //시작시간
  IntColumn get startTime => integer()();

  //끝시간
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorId => integer()();

  // 생성날짜
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
