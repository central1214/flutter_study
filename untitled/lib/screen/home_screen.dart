import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = <String>['1.png', '2.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.blue,
        child: ListView.builder(itemCount: images.length,itemBuilder: (context, i){
          return 
              Image.asset('asset/img/${images[i]}');
        }),
      ),
    );
  }
}
