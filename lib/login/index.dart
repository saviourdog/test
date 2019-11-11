import 'dart:async';

import 'package:animationtest/wave_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var 
      textConNum = TextEditingController(),
      focusNodeNum = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      FocusScope.of(context).requestFocus(focusNodeNum);
    });
  }

  @override
  void dispose() {
    super.dispose();
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
              'Hi,',
              delay: 200,
              split: ' ',
            ),
            WaveText(
              'can i have your number ?',
              delay: 700,
            ),
            AnimatorSet(
              animationType: AnimationType.once,
              animatorSet: [
                Delay(duration: 2000),
                Serial(duration: 700, serialList: [
                  TY(from: 40, to: 0, curve: Curves.ease),
                  O(from: 0, to: 1, curve: Curves.ease)
                ]),
              ],
              child: TextField(
                controller: textConNum,
                focusNode: focusNodeNum,
                onChanged: (_) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
