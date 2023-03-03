import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetforvideo/MODEL/ad_model.dart';
import 'package:meetforvideo/MODEL/ad_screen.dart';
import 'package:meetforvideo/const/conts.dart';
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
  // void isLogin()async{
  //
  //   if (isDeviceConnected == false) {
  //     showDialogBox();
  //   }
  //   else
  //   {
  //     Timer(Duration(seconds: 7),
  //             ()=>Navigator.pushReplacementNamed(context,'ftime')
  //     );
  //   }
  // }
  void isLogin()async{
      Timer(Duration(seconds: 7),
            ()=>Navigator.pushReplacementNamed(context,'ftime'),
      );
   }
  getAdid()async{
    Map<String, String> requestHeaders = {
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.30.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'authorization': 'admin',
    };
    String newslike = "http://3.108.31.187:8080/get-appkey/5";
    var newsString = await http.get(Uri.parse(newslike),headers:requestHeaders);

    print(newsString);
    newsjson = adModelFromJson(newsString.body);
    print('-----data----->${newsjson?.data[0].keyId}');
    openAds();
  }
}
