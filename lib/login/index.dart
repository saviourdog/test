import 'dart:async';

import 'package:animationtest/wave_text.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var focusNodeNum = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      FocusScope.of(context).requestFocus(focusNodeNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191A1A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WaveText(
              'can i have your number ?',
              delay: 700,
            ),
            TextField(
              focusNode: focusNodeNum,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  fillColor: Colors.black,
                  hintText: '请输入手机号码',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  )),
              textInputAction: TextInputAction.next,
            )
          ],
        ),
      ),
    );
  }
}
