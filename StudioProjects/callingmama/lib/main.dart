import 'dart:async';
import 'package:callingmama/ui/DiagonalPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                DiagonalPage() //병합 시 SecondScreen WelcomeScreen으로 변경하고 아래 47번 줄 class SecondScreen 아래로 다 지우기
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(208, 227, 235, 1),
        child: Image.asset('images/callingmamalogoreal.png', width: 100, height: 100,)

    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("페이지 전환 연습용")),
      body: Center(
          child:Text("시범 페이지",textScaleFactor: 2,)
      ),
    );
  }
}