import 'package:calendar_schedular/database/drift_database.dart';
import 'package:calendar_schedular/model/category_color.dart';

class ScheduleWithColor {
  final Schedule schedule;
  final CategoryColorData categoryColor;

  ScheduleWithColor({required this.schedule, required this.categoryColor});
}
