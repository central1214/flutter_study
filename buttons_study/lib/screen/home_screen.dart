import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                    }),
                    padding: MaterialStateProperty.resolveWith((states) {
                      if(states.contains(MaterialState.pressed)){
                        return EdgeInsets.all(50.0);
                      }
                      return EdgeInsets.all(20.0);
                    })),
                child: Text('ButtonStyle')),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.black,
                    shadowColor: Colors.green,
                    elevation: 10.0,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                    padding: EdgeInsets.all(20.0),
                    side: BorderSide(
                      color: Colors.black,
                      width: 4.0,
                    )),
                child: Text('ElevatedButton')),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  backgroundColor: Colors.yellow,
                ),
                child: Text('OutLinedButton')),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.brown,
                  backgroundColor: Colors.blue,
                ),
                child: Text('TextButton'))
          ],
        ),
      ),
    );
  }
}
