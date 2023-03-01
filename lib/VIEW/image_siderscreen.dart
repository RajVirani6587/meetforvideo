import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ImageSider_Screen extends StatefulWidget {
  const ImageSider_Screen({Key? key}) : super(key: key);

  @override
  State<ImageSider_Screen> createState() => _ImageSider_ScreenState();
}

class _ImageSider_ScreenState extends State<ImageSider_Screen> {
  Home_Provider? home_providert;
  Home_Provider? home_providerf;
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
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
                  child: Column(
                    children: [
                       SizedBox(height: 10.h,),
                      Text("Meet Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 23.sp,letterSpacing: 2),),
                      Text("SOCIAL APP",style: TextStyle(color: Colors.redAccent,fontSize: 10.sp,letterSpacing: 5),),
                      SizedBox(height: 3.h,),
                      Text("Discover romance.",style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 2),),
                      Text("Waiting for something special.",style: TextStyle(color: Colors.white,fontSize: 10.sp,letterSpacing: 2),),
                      SizedBox(height: 3.h,),
                      Container(
                        child: CarouselSlider.builder(
                          itemCount: home_providerf!.d1.length,
                          itemBuilder: (context ,index, _){
                            return Container(
                              child: Image.asset("${home_providerf!.d1[index].image}",height: 30.h,width:70.w,fit: BoxFit.fill,),
                            );
                          },
                          options:CarouselOptions(
                              height: 40.h,
                              autoPlay: true,
                              viewportFraction:0.6,
                              enlargeCenterPage: true,
                              autoPlayInterval: Duration(milliseconds: 1000),
                              onPageChanged: (index , _){
                                home_providerf!. changsposition(index);
                              }
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      DotsIndicator(
                        dotsCount: home_providert!.d1.length,
                        position: home_providert!.i.toDouble(),
                      ),
                      SizedBox(height: 1.h,),
                      Container(
                        height: 16.h,
                        color: Colors.white,
                      ),
                      SizedBox(height: 1.5.h,),
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context,'intor');
                        },
                        child: GlassmorphicContainer(
                            width: 80.w,
                            height:7.h,
                            borderRadius: 10,
                            blur: 8,
                            alignment: Alignment.bottomCenter,
                            border: 2,
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
                            child:Center(child: Text("START",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
