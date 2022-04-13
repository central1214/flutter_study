import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ViewPart(maxNumber: maxNumber),
              _Slider_buttonPart(
                  onPressed: onSaved,
                  onSliderChanged: onSliderChanged,
                  maxNumber: maxNumber),
            ],
          ),
        ),
      ),
    );
  }

  void onSaved() {
    Navigator.of(context).pop(maxNumber.toInt());
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }
}

class _ViewPart extends StatelessWidget {
  final maxNumber;

  const _ViewPart({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber,)
    );
  }
}

class _Slider_buttonPart extends StatelessWidget {
  final double maxNumber;
  final VoidCallback onPressed;
  final ValueChanged<double>? onSliderChanged;

  const _Slider_buttonPart(
      {required this.onPressed,
      required this.onSliderChanged,
      required this.maxNumber,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 1000000,
            onChanged: onSliderChanged),
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            child: Text('저장!'))
      ],
    );
  }
}
