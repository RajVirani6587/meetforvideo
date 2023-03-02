import 'package:flutter/material.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:meetforvideo/VIEW/First_time.dart';
import 'package:meetforvideo/VIEW/best/bestvideo_screen.dart';
import 'package:meetforvideo/VIEW/bottombar_screen.dart';
import 'package:meetforvideo/VIEW/demo_screen.dart';
import 'package:meetforvideo/VIEW/detail_screen.dart';
import 'package:meetforvideo/VIEW/getstarted_screen.dart';
import 'package:meetforvideo/VIEW/image_siderscreen.dart';
import 'package:meetforvideo/VIEW/intro_Screen.dart';
import 'package:meetforvideo/VIEW/permission_screen.dart';
import 'package:meetforvideo/VIEW/splash_screen.dart';
import 'package:meetforvideo/VIEW/videocall_screen/video_call_screen.dart';
import 'package:meetforvideo/VIEW/yourself_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Home_Provider>(create:(context)=>Home_Provider()),
      ],
      child:Sizer(
        builder: (context, orientation, deviceType){
          return   MaterialApp(
            debugShowCheckedModeBanner: false,
              initialRoute: 'bottom',
              routes: {
                '/':(contest)=>Splash_Screen(),
                'ftime':(context)=>First_Time_Screen(),
                'sider':(context)=>ImageSider_Screen(),
                'intor':(context)=>Intor_Screen(),
                'detail':(context)=>Detail_Screen(),
                'yourself':(context)=>Yourself_Screen(),
                'permission':(context)=>Permission_Screen(),
                'get':(context)=>GETSTARTED_Screen(),
                'bottom':(context)=>Bottom_Bar_Screen(),
                'video':(context)=>Videocall_Screen(),
                'best':(context)=>Best_screen(),
              },
          );
        },
      ),
    ),
  );
}