import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final double delay;
  FadeIn({this.child, this.delay});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  int duration;
  @override
  void initState() {
    duration = 1000 * widget.delay.toInt();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds:  duration));
    _animation = Tween(begin: 0.0, end: 0.9).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
