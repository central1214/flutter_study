import 'package:flutter/material.dart';
import 'package:navigation_study/layout/main_layout.dart';
import 'package:navigation_study/main.dart';
import 'package:navigation_study/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(title: 'RoutTwo', children: [
      Text(
        arguments.toString(),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text('Push Named')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HOME_ROUTE);
          },
          child: Text('Push Replacement')),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil('/three', (route) => route.settings.name == '/');
      }, child: Text('Push and Remove Until'))
    ]);
  }
}
