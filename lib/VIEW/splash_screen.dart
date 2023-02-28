import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(alignment: Alignment.centerLeft,child: Lottie.asset("assets/lottie/70490-working-on-desk.json",fit: BoxFit.fill,height: 25.h,width: 80.w)),
          Lottie.asset("assets/lottie/98432-loading.json",height: 20.h,width: 20.h,fit: BoxFit.fill),
        ],
      ) ,
    );
  }
  void isLogin()async{
      Timer(Duration(seconds: 7),
            ()=>Navigator.pushReplacementNamed(context,'terms'),
      );
   }
}
