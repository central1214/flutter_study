import 'package:flutter/material.dart';
import 'package:navigation_study/layout/main_layout.dart';
import 'package:navigation_study/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MainLayout(title: 'HomScreen', children: [
        ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text('canpop')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text('pop')),
        ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                        number: 123,
                      )));
              print(result);
            },
            child: Text('Push')),
      ]),
    );
  }
}
