import '../page_transitions/animations.dart';
import 'package:flutter/material.dart';

//TODO: Modify class to handle navigation with named routes

class Navigation{

///Navigates from a base screen to another screen with backward animation and with replacement
pushFrom(BuildContext context, Widget child){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> BackwardAnimation(child:child)));
}

///Navigates from a base screen to another screen with forward animation
pushTo(BuildContext context, Widget child){
  Navigator.push(context, MaterialPageRoute(builder: (_)=> ForwardAnimation(child:child)));
}

///Navigates from a base screen to another screen with forward animation and with replacement
pushToAndReplace(BuildContext context, Widget child){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> ForwardAnimation(child:child)));
}

///Navigates from a base screen to former screen with backward animation
///Exits application
pop(BuildContext context){

}



}
