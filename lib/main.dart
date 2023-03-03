import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:meetforvideo/VIEW/First_time.dart';
import 'package:meetforvideo/VIEW/best/bestimage_screen.dart';
import 'package:meetforvideo/VIEW/best/bestvideo_screen.dart';
import 'package:meetforvideo/VIEW/best/bvideo_screen.dart';
import 'package:meetforvideo/VIEW/bottombar_screen.dart';
import 'package:meetforvideo/VIEW/detail_screen.dart';
import 'package:meetforvideo/VIEW/getstarted_screen.dart';
import 'package:meetforvideo/VIEW/image_siderscreen.dart';
import 'package:meetforvideo/VIEW/intro_Screen.dart';
import 'package:meetforvideo/VIEW/permission_screen.dart';
import 'package:meetforvideo/VIEW/post/post_screen.dart';
import 'package:meetforvideo/VIEW/profile/profile_screen.dart';
import 'package:meetforvideo/VIEW/splash_screen.dart';
import 'package:meetforvideo/VIEW/videocall_screen/video_call_screen.dart';
import 'package:meetforvideo/VIEW/videocall_screen/videoplay_screen.dart';
import 'package:meetforvideo/VIEW/yourself_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await FaceCamera.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Home_Provider>(create:(context)=>Home_Provider()),
      ],
      child:Sizer(
        builder: (context, orientation, deviceType){
          return   MaterialApp(
            debugShowCheckedModeBanner: false,
              //initialRoute: 'bottom',
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
                'post':(context)=>Post_Screen(),
                'profile':(context)=>Profile_Screen(),
                'vplay':(context)=>VideoPlay_Screen(),
                'bimage':(context)=>Bestimage_Screen(),
                'bvideo':(context)=>BestVideo_Screen(),
              },
          );
        },
      ),
    ),
   ),
  );
}