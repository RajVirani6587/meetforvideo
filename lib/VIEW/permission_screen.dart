import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
              Navigator.pushReplacementNamed(context,'get');
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
            child: Container(
              height: 8.h,
              width: 85.w,
              decoration: BoxDecoration(
                  color:  Colors.pink,
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child: Center(child: Text(
                "ALLOW", style: TextStyle(color: Colors.white, fontSize: 25),)),
            ),
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
}
