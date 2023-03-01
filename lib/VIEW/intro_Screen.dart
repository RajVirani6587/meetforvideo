import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';

class Intor_Screen extends StatefulWidget {
  const Intor_Screen({Key? key}) : super(key: key);

  @override
  State<Intor_Screen> createState() => _Intor_ScreenState();
}

class _Intor_ScreenState extends State<Intor_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.black,
            child: Image.asset("assets/image/g3.png",height: 100.h,width: 100.w,),
          ),
          Container(
            color: Colors.black,
            child: Image.asset("assets/image/g2.png",height: 100.h,width: 100.w,),
          ),
          Container(
            color: Colors.black,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/image/g1.png",height: 100.h,width: 100.w,),
                InkWell(
                  onTap: (){
                      Navigator.pushReplacementNamed(context,'detail');
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(bottom:5.h),
                    child:GlassmorphicContainer(
                      width: 90.w,
                      height:8.h,
                      borderRadius: 30.sp,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
