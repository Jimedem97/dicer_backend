import 'package:flutter/material.dart';

class Heartbeat extends StatefulWidget {
  const Heartbeat(
      {required this.child,
      required this.durationMs,
      required this.animation,
      Key? key})
      : super(key: key);

  final Widget child;
  final int durationMs;
  final String animation;

  @override
  HeartbeatState createState() => HeartbeatState();
}

class HeartbeatState extends State<Heartbeat> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
  }

  void repeatOnce() async {
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.durationMs),
        vsync: this,
        value: 1,
        lowerBound: 0.8,
        upperBound: 1);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    if (widget.durationMs > 0) {
      if (widget.animation == "ANIMATION1") {
        await _controller.reverse();
        await _controller.forward();
      } else if (widget.animation == "ANIMATION2") {
        await _controller.forward();
        await _controller.reverse();
        await _controller.forward();
      } else {}
    }
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    repeatOnce();
    return ScaleTransition(
        scale: _animation, alignment: Alignment.center, child: widget.child);
  }
}
