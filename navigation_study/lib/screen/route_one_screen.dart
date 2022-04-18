import 'package:flutter/material.dart';
import 'package:navigation_study/layout/main_layout.dart';
import 'package:navigation_study/screen/home_screen.dart';
import 'package:navigation_study/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'RouteOne', children: [
      ElevatedButton(onPressed: (){
        Navigator.of(context).maybePop();
      }, child: Text('maybe pop')),
      Text(
        number.toString(),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                ),
              ),
            );
          },
          child: Text('toRoute Two'))
    ]);
  }
}
