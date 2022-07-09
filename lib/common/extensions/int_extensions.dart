import 'package:dicer/widget/dice/five.dart';
import 'package:dicer/widget/dice/four.dart';
import 'package:dicer/widget/dice/one.dart';
import 'package:dicer/widget/dice/six.dart';
import 'package:dicer/widget/dice/three.dart';
import 'package:dicer/widget/dice/two.dart';
import 'package:flutter/material.dart';

extension IntToDiceWidget on int{
  Widget toDiceWidget(double diceSize){
    switch(this){
      case 1: return One(diceSize);
      case 2: return Two(diceSize);
      case 3: return Three(diceSize);
      case 4: return Four(diceSize);
      case 5: return Five(diceSize);
      default: return Six(diceSize);
    }
  }
}