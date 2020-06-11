
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/app_theme/app_theme.dart';



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
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
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
          color: appThemeLight.primaryColorLight,
          child: Transform(
            transform: Matrix4.translationValues(animation.value*width, 0, 0),
            child: widget.child),
        );
      }
      );
  }
}
class ImageAnimation extends StatefulWidget {
  final Widget child;

  ImageAnimation({this.child});
  @override
  _ImageAnimationState createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  start(){
    animationController =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
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
          color: appThemeLight.primaryColorDark,
          child: Transform(
            transform: Matrix4.translationValues(0, animation.value*width, 0),
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
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
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
          color: appThemeLight.primaryColorLight,
          child: Transform(
            transform: Matrix4.translationValues(animation.value * width, 0, 0),
            child: widget.child
            ),
        );
      },
    );
  }
}