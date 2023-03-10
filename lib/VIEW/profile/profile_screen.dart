import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  Home_Provider ?home_providert;
  Home_Provider ?home_providerf;
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
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",
              fit: BoxFit.cover,
              height:100.h,
              width:100.w,
              scale: 1,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.h),
                  child: GlassmorphicContainer(
                      width: 90.w,
                      height:60.h,
                      borderRadius: 20.sp,
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          SizedBox(height: 15.h,),
                          Detail("Username","${home_providerf!.txtNamee}"),
                          Detail("Gender","${home_providerf!.txtGender}"),
                          Detail("Age","${home_providerf!.txtAge}"),
                          Detail("Country","${home_providerf!.txtCountry}"),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context,'privacy');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.logout,color: Colors.red,size: 30.sp,),
                                SizedBox(width: 1.w,),
                                Text("Logout",style: TextStyle(color: Colors.red,fontSize: 18.sp,),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.sp),
                  height: 21.h,
                  width: 21.h,
                  decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 3.sp,color: Colors.white)),
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(home_providerf!.txtImage)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height:18.h,
                  width: 100.w,
                  color: Colors.white,
               ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget Detail(String name,String detail){
    return Column(
     children: [
       Align(alignment: Alignment.centerLeft,child: Text("$name",style: TextStyle(color: Colors.white70),)),
       SizedBox(height: 0.7.h,),
       Align(alignment: Alignment.centerLeft,child: Text("$detail",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
       SizedBox(height: 0.5.h,),
       Divider(height: 0.1.h,color: Colors.white,),
       SizedBox(height: 2.h,),
     ],
    );
  }
}
