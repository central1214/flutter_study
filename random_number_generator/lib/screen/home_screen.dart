import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_scrren.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TopPart(onPressed: onSettingsPop),
              _MiddlePart(
                randomNumbers: randomNumbers,
              ),
              _BottomPart(onPressed: onRandomNumber)
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumber() {
    final rand = Random();

    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);
      if (number <= 100) {
        continue;
      }
      ;
      newNumbers.add(number);
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
  void onSettingsPop() async {
    final result = await Navigator.of(context)
        .push<int>(MaterialPageRoute(builder: (BuildContext context) {
      return SettingsScreen(maxNumber: maxNumber.toInt(),);
    }));
    if(result != null){
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onPressed;
  const _TopPart({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '랜덤 숫자 생성기',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ))
    ]);
  }
}

class _MiddlePart extends StatelessWidget {
  final List<int> randomNumbers;

  const _MiddlePart({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: randomNumbers
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: e.key == 2 ? 0.0 : 16.0),
              child: NumberRow(number: e.value.toDouble(),)
            ),
          )
          .toList(),
    ));
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({required this.onPressed, Key? key}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            onPressed: onPressed,
            child: Text('생성하기'),
          ),
        ),
      ],
    );
  }
}
