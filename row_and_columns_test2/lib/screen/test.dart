import 'package:flutter/material.dart';

class DoTest extends StatelessWidget {
  const DoTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.red,
                      
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.green,
                    ),
                    
                  ],
                ),
              ),
              Container(
                width: 50.0,
                height: 50.5,
                color: Colors.orange,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.red,
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 50.0,
                      height: 50.5,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Container(
                width: 50.0,
                height: 50.5,
                color: Colors.green,
              ),

            ],

          ),
        ),
      ),

    );
  }
}
