
import 'package:flutter/material.dart';
import 'package:meetforvideo/VIEW/First_time.dart';
import 'package:meetforvideo/VIEW/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main(){
  runApp(
    Sizer(
      builder: (context, orientation, deviceType){
        return   MaterialApp(
          debugShowCheckedModeBanner: false,
            routes: {
              '/':(contest)=>Splash_Screen(),
              'ftime':(context)=>First_Time_Screen(),
            },
        );
      },
    ),
  );
}