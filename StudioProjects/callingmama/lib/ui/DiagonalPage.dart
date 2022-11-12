import 'package:callingmama/main.dart';
import 'package:flutter/material.dart';
import 'Widget/ButtonEachTwoRightTriangleWithDivider.dart';

class DiagonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[Positioned(
        child: ButtonEachTwoRightTriangleWithDivider(
          bottomLeftTriangleBackgroundColor: Color.fromRGBO(208, 227, 235, 1),
          dividerColor: Colors.blueAccent,
          height: double.infinity,
          width: double.infinity,
          topRightTriangleDecoration: BoxDecoration(
            color: Color.fromRGBO(249, 222, 202, 1),
          ),
          topRightTriangleOnTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          bottomLeftTriangleOnTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        ),
      ),
          GestureDetector(
            child: Image.asset('images/mom.png')),
    ]));
  }
}
