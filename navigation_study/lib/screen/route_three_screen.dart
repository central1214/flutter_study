import 'package:flutter/material.dart';
import 'package:navigation_study/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(title: 'RouteThree', children: [
      Text(arguments.toString()),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'))
    ]);
  }
}
