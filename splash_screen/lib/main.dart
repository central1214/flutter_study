import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

//모든 위젯은 클래스다
class HomeScreen extends StatelessWidget {
  //StatlessWidget의 모든 것들을 상속하면서 홈스크린 클래스를 위젯으로 변경
  @override
  Widget build(BuildContext context) {
    //Widget은 return 타입이다, --Hot reload는 build함수에 있는 코드만 재실행한다
    return Scaffold(
      backgroundColor: Color(0xFFF99231), //0x - 16진수다 FF - 투명도
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //주축에 정렬,
        children: [
          //대부분의 위젯은 child와 children 자식 위젯을 가진다.
          Image.asset(
            'asset/img/logo.png', //,를 찍으면 자동정렬시 enter와 같음 //named 컨스트럭터?
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
