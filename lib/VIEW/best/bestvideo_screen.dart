import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Best_screen extends StatefulWidget {
  const Best_screen({Key? key}) : super(key: key);

  @override
  State<Best_screen> createState() => _Best_screenState();
}

class _Best_screenState extends State<Best_screen> {
  Home_Provider?home_providerf;
  Home_Provider?home_providert;
  @override
  Widget build(BuildContext context) {
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    return Scaffold(
     body:Stack(
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
           child: Column(
             children: [
               SizedBox(height: 4.h,),
               Align(alignment: Alignment.centerLeft,child: Padding(
                 padding:  EdgeInsets.only(left: 3.w),
                 child: Text("Bpost",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
               )),
               Expanded(
                 child: GridView.builder(
                   itemCount: home_providerf!.l1.length,
                   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,mainAxisExtent: 18.h),
                   itemBuilder: (context,index){
                     return  Padding(
                       padding:  EdgeInsets.all(5.sp),
                       child: InkWell(
                         onTap: (){
                           home_providerf!.Datapickkk = Video(
                             TImage: home_providerf!.l1[index].TImage,
                             like: home_providerf!.l1[index].like,
                             Image2: home_providerf!.l1[index].Image2,
                             flag: home_providerf!.l1[index].flag,
                             centry:home_providerf!.l1[index].centry,
                             con:  home_providerf!.l1[index].con,
                             Image:home_providerf!.l1[index].Image,
                             km:   home_providerf!.l1[index].km,
                             Name: home_providerf!.l1[index].Name,
                             year: home_providerf!.l1[index].year,
                             video:home_providerf!.l1[index].video,
                           );
                           Navigator.pushNamed(context,'');
                         },
                         child: Column(
                           children: [
                             Container(
                               height:16.h,
                               width: 16.h,
                               decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.white,
                                       blurRadius: 3.sp,)
                                   ],
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10.sp)
                               ),
                               child: Stack(
                                 alignment: Alignment.bottomRight,
                                 children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(10.sp),
                                     child: Image.asset("${home_providerf!.l1[index].Image}",
                                       fit: BoxFit.fill,
                                       height:35.h,
                                       width: 48.w,
                                     ),
                                   ),
                                   Text("${home_providerf!.l1[index].Name}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 ),
               ),
               SizedBox(height: 1.h,),
               Align(alignment: Alignment.centerLeft,child: Padding(
                 padding:  EdgeInsets.only(left: 3.w),
                 child: Text("Bvideo",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
               )),
               Expanded(
                 child: GridView.builder(
                   itemCount: home_providerf!.l1.length,
                   gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,mainAxisExtent: 27.h),
                   itemBuilder: (context,index){
                     return  Padding(
                       padding:  EdgeInsets.all(5.sp),
                       child: InkWell(
                         onTap: (){
                           home_providerf!.Datapickkk = Video(
                             TImage: home_providerf!.l1[index].TImage,
                             like: home_providerf!.l1[index].like,
                             Image2: home_providerf!.l1[index].Image2,
                             flag: home_providerf!.l1[index].flag,
                             centry:home_providerf!.l1[index].centry,
                             con:  home_providerf!.l1[index].con,
                             Image:home_providerf!.l1[index].Image,
                             km:   home_providerf!.l1[index].km,
                             Name: home_providerf!.l1[index].Name,
                             year: home_providerf!.l1[index].year,
                             video:home_providerf!.l1[index].video,
                           );
                           Navigator.pushNamed(context,'');
                         },
                         child: Column(
                           children: [
                             Container(
                               height:25.h,
                               decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.white,
                                       blurRadius: 3.sp,)
                                   ],
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10.sp)
                               ),
                               child: Stack(
                                 alignment: Alignment.center,
                                 children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(10.sp),
                                     child: Image.asset("${home_providerf!.l1[index].Image2}",
                                       fit: BoxFit.fill,
                                       height:34.h,
                                       width: 48.w,
                                     ),
                                   ),
                                   Image.asset("assets/image/icon.png",height: 5.h,width: 5.h,fit: BoxFit.fill,),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
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
