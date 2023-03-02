
import 'package:cool_nav/cool_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:meetforvideo/VIEW/First_time.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class bottomber_Screen extends StatefulWidget {
  const bottomber_Screen({Key? key}) : super(key: key);

  @override
  State<bottomber_Screen> createState() => _bottomber_ScreenState();
}

class _bottomber_ScreenState extends State<bottomber_Screen> {
  List WidgetsList=[First_Time_Screen(),First_Time_Screen(),First_Time_Screen(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetsList[Provider.of<Home_Provider>(context,listen: true).i],

    );
  }
}