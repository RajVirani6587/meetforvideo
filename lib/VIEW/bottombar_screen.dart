import 'package:cool_nav/cool_nav.dart';
import 'package:flutter/material.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:meetforvideo/VIEW/First_time.dart';
import 'package:meetforvideo/VIEW/best/bestvideo_screen.dart';
import 'package:meetforvideo/VIEW/videocall_screen/video_call_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Bottom_Bar_Screen extends StatefulWidget {
  const Bottom_Bar_Screen({Key? key}) : super(key: key);

  @override
  State<Bottom_Bar_Screen> createState() => _Bottom_Bar_ScreenState();
}

class _Bottom_Bar_ScreenState extends State<Bottom_Bar_Screen> {
  List WidgetsList=[Videocall_Screen(),Best_screen(),Videocall_Screen(),First_Time_Screen(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: WidgetsList[Provider.of<Home_Provider>(context,listen: true).i],
      bottomNavigationBar:SpotlightBottomNavigationBar(
          iconSize: 25.sp,
          unselectedItemColor: Colors.white,
          items: [
            SpotlightBottomNavigationBarItem(icon: Icons.video_camera_front_rounded),
            SpotlightBottomNavigationBarItem(icon: Icons.video_collection),
            SpotlightBottomNavigationBarItem(icon: Icons.desktop_mac),
            SpotlightBottomNavigationBarItem(icon: Icons.person),
          ],
          currentIndex: Provider.of<Home_Provider>(context,listen:true).i,
          selectedItemColor: Colors.cyan,
          onTap: (value){
            Provider.of<Home_Provider>(context,listen:false).changeicon(value);
          }
      ),
    );
  }
}
