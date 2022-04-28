import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const TodayBanner(
      {required this.selectedDay, required this.scheduleCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Container(
      color: PRIMARY_COLOR,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${selectedDay.year} ${selectedDay.month} ${selectedDay.day}',
            style: textStyle,
          ),
          Text(
            '$scheduleCount개',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
