import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class Permission_Screen extends StatefulWidget {
  const Permission_Screen({Key? key}) : super(key: key);

  @override
  State<Permission_Screen> createState() => _Permission_ScreenState();
}

class _Permission_ScreenState extends State<Permission_Screen> {
  @override
  Widget build(BuildContext context) {
    txt n1 = ModalRoute.of(context)!.settings.arguments as txt;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 3.h,),
            Align(alignment: Alignment.center,
              child: Image.asset("assets/image/permission.png",
                height: 15.h,
                width: 15.h,
                fit: BoxFit.fill,),
            ),
            Text("Final Step", style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Align(alignment: Alignment.center,
                  child: Text(
                    "Enable Microphone and camera access to get the parth started.",
                    style: TextStyle(fontSize: 15,color: Colors.white),)),
            ),
            SizedBox(height: 3.h,),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.camera_alt, size: 30.sp, color: Colors.pink,),
                  title: Text(
                    "Camera", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  subtitle: Text("To start live video chat",style: TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: Icon(Icons.mic, size: 30.sp, color: Colors.pink,),
                  title: Text(
                    "Microphone", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  subtitle: Text("For voice calls",style: TextStyle(color: Colors.white70),),
                ),
                ListTile(
                  leading: Icon(
                    Icons.file_present, size: 30.sp, color: Colors.pink,),
                  title: Text(
                    "Storge", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  subtitle: Text("To start Image pike",style: TextStyle(color: Colors.white70)),
                ),
                SizedBox(height: 2.h,),
                Container(
                  height:18.h,
                  width: 100.w,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            InkWell(
              onTap: () async {
                Navigator.pushReplacementNamed(context,'get',arguments: n1);
                Map<Permission, PermissionStatus> map = await[Permission.microphone, Permission.camera , Permission.storage].request();
                if (await Permission.camera.isDenied) {
                  print("Camera Deny");
                }
                if (await Permission.storage.isDenied) {
                  print("location");
                }
                if(await Permission.microphone.isDenied) {
                  print("microphone");
                }
              },
              child: GlassmorphicContainer(
                  height: 8.h,
                  width: 85.w,
                borderRadius: 10.sp,
                blur: 25,
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
                child:Center(
                    child: Text(
                          "ALLOW", style: TextStyle(color: Colors.white, fontSize: 25),)),
              ),
              // Container(
              //   height: 8.h,
              //   width: 85.w,
              //   decoration: BoxDecoration(
              //       color:  Colors.pink,
              //       borderRadius: BorderRadius.circular(10.sp)
              //   ),
              //   child: Center(child: Text(
              //     "ALLOW", style: TextStyle(color: Colors.white, fontSize: 25),)),
              // ),
            ),
            SizedBox(height: 2.h,),
          ],
        ),
          ),
        ],
      ),
    );
  }
}
