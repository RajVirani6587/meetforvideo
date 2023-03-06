import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({Key? key}) : super(key: key);

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {

  Home_Provider? home_providert;
  Home_Provider? home_providerf;
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",
                  fit: BoxFit.cover,
                  height:100.h,
                  width:100.w,
                  scale: 1,
                ),
                GlassmorphicContainer(
                  width: 100.w,
                  height:100.h,
                  borderRadius:0,
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
                      Color(0xff000000).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: GlassmorphicContainer(
                width: 85.w,
                height:85.h,
                borderRadius: 17.sp,
                blur: 4,
                alignment: Alignment.bottomCenter,
                border: 5,
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
                    Color(0xffffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: CarouselSlider.builder(
                  itemCount: home_providerf!.l1.length,
                  itemBuilder: (context ,index, _){
                    return Container(
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Center(child: ClipRRect(borderRadius: BorderRadius.circular(17.sp),
                              child: Image.asset("${home_providerf!.l1[index].Image}",height: 84.5.h,width:84.w,fit: BoxFit.fill,))),
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.h,left: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 4.h,
                                      width: 4.h,
                                      child: CircleAvatar(backgroundImage: AssetImage("${home_providerf!.l1[index].Image}")),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text("${home_providerf!.l1[index].Name}",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w700),),
                                  ],
                                ),
                                PopupMenuButton(
                                  initialValue: 3,
                                  icon: Icon(Icons.more_vert,color: Colors.white,size: 30.sp,),
                                  itemBuilder: (context){
                                   return [
                                      PopupMenuItem(
                                          child: InkWell(onTap: (){
                                            reportdilaog();
                                          },
                                              child: Text("Report"))),
                                      PopupMenuItem(
                                          child: InkWell(onTap: (){
                                            Blockdialog();
                                          },child: Text("Block",))),
                                    ];
                                  }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options:CarouselOptions(
                    scrollDirection: Axis.vertical,
                      height: 85.h,
                      autoPlay: true,
                      viewportFraction:1,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds:5),
                      onPageChanged: (index , _){
                        home_providerf!.changsposition(index);
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void reportdilaog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context:context,
        builder:(context){
          return Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), color: Colors.black.withOpacity(0.4),),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical:1.5.h),
                        child: Container(height:0.5.h,width: 18.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey,),),
                      ),
                    ),
                    Align(alignment: Alignment.center,child: Text("Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18.sp),)),
                    SizedBox(height: 1.h,),
                    Text("Why are you reporting this post?",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),),
                    SizedBox(height: 1.h,),
                    Text("Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",style: TextStyle(color: Colors.white60),),
                    DD("I just don't like it"),
                    DD("it's spam"),
                    DD("Nudity or sexual activity"),
                    DD("Hate speech or symbols"),
                    DD("Violence or dangerous organisations"),
                    DD("False information"),
                    DD("Bullying or harassment"),
                    DD("Scam or fraud"),
                    DD("Intellectual property violation"),
                    DD("Suicide or self-injury"),
                    DD("Sale of illegal or regulated goods"),
                    DD("Eating disorders"),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  void Blockdialog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context:context,
        builder:(context){
          return Container(
            height: 20.h,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), color: Colors.black.withOpacity(0.7),),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.h,),
                     Text("Block Image",style: TextStyle(color: Colors.red,fontSize: 18.sp),),
                     Text("Block Image  Please Enter Block.",style: TextStyle(color: Colors.red),),
                    SizedBox(height: 3.h,),

                    InkWell(onTap: (){
                       dialog();
                     },
                       child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.sp)),
                        child: Center(child: Text("Block",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                    ),
                     )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget DD(String txt) {
    return Column(
      children: [
        SizedBox(height: 1.h,),
        InkWell(onTap: (){dialog();},child: Text("$txt",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
      ],
    );
  }
  Future<bool> dialog() async {
    back();
    return await false;
  }

  void back(){
    Navigator.pushReplacementNamed(context, 'bottom');
  }

}
