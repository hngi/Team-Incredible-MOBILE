
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class ForwardAnimation extends StatefulWidget {
  final Widget child;

  ForwardAnimation({this.child});
  @override
  _ForwardAnimationState createState() => _ForwardAnimationState();
}

class _ForwardAnimationState extends State<ForwardAnimation> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  start(){
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeIn));

    animationController.forward();
  }
  

  @override
  void initState() { 
    super.initState();
    start();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Material(
          color: Colors.white,
          child: Transform(
            transform: Matrix4.translationValues(animation.value*width, 0, 0),
            child: widget.child),
        );
      }
      );
  }
}

class BackwardAnimation extends StatefulWidget {
  final Widget child;

  BackwardAnimation({this.child});
  @override
  _BackwardAnimationState createState() => _BackwardAnimationState();
}

class _BackwardAnimationState extends State<BackwardAnimation> with SingleTickerProviderStateMixin{

   Animation animation;
  AnimationController animationController;

  start(){
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeIn));

    animationController.forward();
  }
  

  @override
  void initState() { 
    super.initState();
    start();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child){
        return Material(
          color: Colors.white,
          child: Transform(
            transform: Matrix4.translationValues(animation.value * width, 0, 0),
            child: widget.child
            ),
        );
      },
    );
  }
}