import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';


class Common{
  static void flushBarErrorMassage(String massage, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: massage,
          messageColor: Colors.red,
          backgroundColor: Colors.white,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 20,color: Colors.red,),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));

  }


  static void flushBarSuccessMassage(String massage, BuildContext context){
    showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: massage,
          messageColor: Colors.green,
          backgroundColor: Colors.white,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 20,color: Colors.green,),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));

  }
}