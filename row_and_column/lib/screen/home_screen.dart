import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {//stless라고 치고 enter치면 자동으로 위젯 클래스 완성
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,

            child: Row(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Expanded / Flexible - !!children에서만 쓸 수 있다.!!
                
                //Expanded - 최대한으로 사용
                
                Flexible(//Flexible - 비율대로 나누고 설정된 크기만큼이상 자리를 차지하면 버린다.
                  //flex - 나눠먹는 비율 defualt는 1
                  child: Container(
                    color: Colors.red,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),

              ],
            ),
          ),
        ),

    );
  }
}
