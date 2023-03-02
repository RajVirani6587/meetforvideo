import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class First_Time_Screen extends StatefulWidget {
  const First_Time_Screen({Key? key}) : super(key: key);

  @override
  State<First_Time_Screen> createState() => _First_Time_ScreenState();
}

class _First_Time_ScreenState extends State<First_Time_Screen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body:Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",
            fit: BoxFit.cover,
            height:100.h,
            width:100.w,
            scale: 1,
          ),
          Center(
            child: GlassmorphicContainer(
                width: 100.w,
                height:100.h,
                borderRadius: 0,
                blur: 8,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 35.h,),
                      Align(
                        alignment: Alignment.center,
                        child: Lottie.asset("assets/lottie/7596-like.json",height: 18.h,width: 18.h,fit: BoxFit.fill),
                      ),
                      Text("Meet Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 23.sp,letterSpacing: 2),),
                      Text("SOCIAL APP",style: TextStyle(color: Colors.red,fontSize: 10.sp,letterSpacing: 5),),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context,"sider");
                        },
                        child: GlassmorphicContainer(
                          width: 80.w,
                          height:7.h,
                          borderRadius: 10.sp,
                          blur: 8,
                          alignment: Alignment.bottomCenter,
                          border: 3,
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
                          child:Center(child: Text("GET STARTED",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    ),
    );
  }
}
