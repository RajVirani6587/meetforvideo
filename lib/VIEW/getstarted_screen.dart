import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';
import 'package:sizer/sizer.dart';

class GETSTARTED_Screen extends StatefulWidget {
  const GETSTARTED_Screen({Key? key}) : super(key: key);

  @override
  State<GETSTARTED_Screen> createState() => _GETSTARTED_ScreenState();
}

class _GETSTARTED_ScreenState extends State<GETSTARTED_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              "assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",
              fit: BoxFit.cover,
              height:100.h,
              width:100.w,
              scale: 1,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: GlassmorphicContainer(
                borderRadius: 10.sp,
                  width: 90.w,
                  height:30.h,
                  blur: 15,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                 ),
                 child: Column(
                   children: [
                     SizedBox(height: 3.h,),
                     Text("Meet Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 23.sp,letterSpacing: 2),),
                     Text("SOCIAL APP",style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 5),),
                     SizedBox(height: 4.h,),
                     Text("Discover romance.",style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 2),),
                     Text("Waiting for something special.",style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 2),),
                     SizedBox(height: 4.h,),
                     InkWell(onTap: (){
                       Navigator.pushReplacementNamed(context,'bottom');
                       showCustomDialog(context);
                     },child: Icon(Icons.arrow_forward,size:35.sp,color: Colors.white,)),
                   ],
                 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.sp)),
            child: SizedBox.expand(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:  EdgeInsets.all(6.sp),
                      child: Container(
                        height: 5.5.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            border: Border.all(color: Color(0xFFFF4D67),width: 3.sp)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 1.w,),
                            Icon(Icons.no_accounts,color: Color(0xFFFF4D67),size: 30.sp,),
                            SizedBox(width: 2.w,),
                            Text("ZERO TOLERANCE POLICY",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 10.sp,decoration: TextDecoration.none),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Image.asset("assets/image/Group 32 (2).png",height: 10.h,width: 10.h,fit: BoxFit.fill,),
                  SizedBox(height: 1.h,),
                  Text("Age Verification",style: TextStyle(fontSize: 20.sp,color: Colors.white,decoration: TextDecoration.none),),
                  SizedBox(height: 1.h,),
                  Text("You must be 18 years old or over to enter.",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.sp,color: Colors.white,decoration: TextDecoration.none),),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 7.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xF000000),
                        borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: Center(
                      child: Text("I am 18 or older-Enter",style: TextStyle(color: Colors.white,fontSize: 15.sp,decoration: TextDecoration.none),),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
