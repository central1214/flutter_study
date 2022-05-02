import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_schedular/database/drift_database.dart';

const DEFAULT_COLORS = [
  //빨강
  'F44336',
  'FF9800',
  'FFEB3B',
  'FCAF50',
  '2196F3',
  '3F51B5',
  '9C27B0'
];

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // 초기화가 준비 됐는지 확인해라! - 원래 런앱하면 자동으로 실행되는 함수
  await initializeDateFormatting();

  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();

  if (colors.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await database.createCategoryColor(CategoryColorCompanion(
        textCode: Value(hexCode),
      ));
    }
  }


  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'NotoSans'),
    home: HomeScreen(),
  ));
}
