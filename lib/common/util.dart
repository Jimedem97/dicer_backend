import 'dart:math';

import 'package:flutter/material.dart';

double diceSize(MediaQueryData mediaQuery, double sizeMultiplier){
  return min(mediaQuery.size.height, mediaQuery.size.width) * sizeMultiplier;
}
