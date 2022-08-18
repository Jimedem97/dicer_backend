import 'package:dicer/common/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class Side extends StatelessWidget {
  const Side(
      {required this.number,
      required this.moveZ,
      required this.size,
      this.xRot = 0.0,
      this.yRot = 0.0,
      this.zRot = 0.0,
      Key? key})
      : super(key: key);

  final bool moveZ;
  final double xRot;
  final double yRot;
  final double zRot;
  final double size;
  final int number;

  @override
  Widget build(BuildContext context) {
    final matrix = Matrix4.identity()
      ..rotateX(xRot)
      ..rotateY(yRot)
      ..rotateZ(zRot)
      ..translate(0.0, 0.0, moveZ ? -size / 2 : size / 2);
    return Transform(
        alignment: Alignment.center,
        transform: matrix,
        child: Container(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints.expand(width: size, height: size),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: Colors.white),
                  borderRadius: BorderRadius.circular(32)),
              child: Center(child: number.toDiceWidget(size)),
            )));
  }
}
