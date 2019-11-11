import 'package:flutter/material.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

class WaveText extends StatelessWidget {
  final String text;
  final int delay;
  final String split;
  WaveText(this.text,{this.delay=0,this.split=''});
  @override
  Widget build(BuildContext context) {
    List<Widget> fonts = [];
    text.split(split).asMap().forEach((index, item) {
      fonts.add(AnimatorSet(
        animationType: AnimationType.once,
        child: Text(item,style: TextStyle(fontSize: 18,color: Colors.white),),
        animatorSet: [
          Delay(duration: index * 50+delay),
          Serial(duration: 200, serialList: [
            TY(from: 28, to: -14, curve: Curves.ease),
            O(from: 0, to: 0.6, curve: Curves.linear)
          ]),
          Serial(duration: 150, serialList: [
            TY(from: -14, to: 0, curve: Curves.ease),
            O(from: 0.6, to: 1, curve: Curves.linear)
          ]),
        ],
      ));
    });
    return Wrap(children: fonts);
  }
}
