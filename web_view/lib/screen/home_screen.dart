import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final homeUrl = 'https://blog.codefactory.ai';
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,//제목 정렬
        actions: [
          IconButton(onPressed: (){
            // http://
            // https:// - 보안이 더 좋음 보통 http는 막아 둔다
            if(controller == null){
              return;
            }
            controller!.loadUrl(homeUrl);
          }, icon: Icon(
            Icons.home,
          ))
        ],
      ),
      body: WebView(//controller - widget들을 프로그래밍적으로 조정할 수 있게 해주는 것
        onWebViewCreated: (WebViewController controller){
          this.controller = controller;
        },//하나의 파라미터를 받는 함수
        //보통 on으로 시작하는 파라미터들은 어떤 행동이 시작했을 때~ 란 의미다.
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
