import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  late StreamSubscription subscription;
  ValueNotifier<bool> isDeviceConnected = ValueNotifier(false);
  ValueNotifier<bool> isAlertSet = ValueNotifier(false);

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(alignment: Alignment.centerLeft,child: Lottie.asset("assets/lottie/70490-working-on-desk.json",fit: BoxFit.fill,height: 25.h,width: 80.w)),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              if (isDeviceConnected.value == false) {
                Dialog();
              } else {
                Navigator.pushReplacementNamed(context, "privacy");
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 5, bottom: 18),
              height: 7.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                    color:  Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
            ),
          ),
          //Lottie.asset("assets/lottie/98432-loading.json",height: 20.h,width: 20.h,fit: BoxFit.fill),
        ],
      ) ,
    );
  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) async {
        isDeviceConnected.value =
        (await InternetConnectionChecker().hasConnection);
        if (isDeviceConnected.value == false && isAlertSet.value == false) {
          Dialog();
          isAlertSet.value = true;
        } else {

        }
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Dialog() => Get.defaultDialog(
    barrierDismissible: false,
    backgroundColor: const Color(0xFFFD4E7B),
    titleStyle: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
    title: "No Internet",
    actions: [
      ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder()),
              backgroundColor:
              MaterialStateProperty.all(const Color(0XFFC38B00))),
          onPressed: () async {
            Get.back();
            isAlertSet.value = false;
            isDeviceConnected.value =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected.value) {
              Dialog();
              isAlertSet.value = true;
            }
          },
          child: const Text("Retry"))
    ],
    content: SizedBox(
      height: 20.h,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/image/wifi-network-disconnected-not-available-lost-internet-connection-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.webp',height: 8.h,width: 8.h,fit: BoxFit.fill,),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "Check Your Data Connection \n Connect Internet & Try Again...",
                    style: TextStyle(fontSize: 13.sp,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
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
