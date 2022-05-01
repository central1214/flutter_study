import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if(nextPage > 4){
        nextPage = 0;
      }

      controller.animateToPage(nextPage, duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    controller.dispose(); //controller들은 대부분 dispose때 꺼준다 메모리 문제~
    if(timer != null){
      timer!.cancel();
    }

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: controller,
          children: [1, 2, 3, 4, 5]
              .map((e) =>
                  Image.asset('assets/image/image_$e.jpg', fit: BoxFit.cover))
              .toList()),
    );
  }
}
