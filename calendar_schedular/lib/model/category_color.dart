import 'package:drift/drift.dart';

class CategoryColor extends Table{
  //PRIMARY_KEY
  IntColumn get id => integer().autoIncrement()();

  //색상코드
  TextColumn get textCode=> text()();
}