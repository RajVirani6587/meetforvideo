import 'package:flutter/material.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';

class Home_Provider extends ChangeNotifier{
  dynamic i=0;

  void changsposition(dynamic index){
    i=index;
    notifyListeners();
  }

  List<slider>d1=[
    slider(image:"assets/image/i1.png"),
    slider(image:"assets/image/i2.png"),
    slider(image:"assets/image/i3.png"),
    slider(image:"assets/image/i4.png"),
    slider(image:"assets/image/i5.png"),
    slider(image:"assets/image/i6.png"),
  ];

}