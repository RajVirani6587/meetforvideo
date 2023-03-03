import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';
import 'package:meetforvideo/PROVIDER/provider_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Videocall_Screen extends StatefulWidget {
  const Videocall_Screen ({Key? key}) : super(key: key);

  @override
  State<Videocall_Screen > createState() => _Videocall_ScreenState();
}

class _Videocall_ScreenState extends State<Videocall_Screen > {
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
            child: GridView.builder(
              itemCount: home_providerf!.l1.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisExtent: 36.h),
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
                        Navigator.pushNamed(context,'vplay');
                    },
                    child: Column(
                      children: [
                        Container(
                          height:30.h,
                          width: 48.w,
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
                            children: [
                              ClipRRect(borderRadius: BorderRadius.circular(10.sp),
                                child: Image.asset("${home_providerf!.l1[index].Image}",
                                  fit: BoxFit.fill,
                                  height:35.h,
                                  width: 48.w,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.sp ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 3.h,
                                        width: 13.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.sp),
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        child: Center(child: Text("Live",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 10.sp),)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 3.5.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.sp),
                                            color: Colors.black.withOpacity(0.6),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.female,color: Color(0xFFFF4D67),size: 15.sp,),
                                              Text("${home_providerf!.l1[index].centry}",style: TextStyle(fontSize: 7.sp,color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                        Text("${home_providerf!.l1[index].flag}",style: TextStyle(fontSize: 15.sp),)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 0.4.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 4.h,
                              width: 4.h,
                              child: CircleAvatar(backgroundImage: AssetImage("${home_providerf!.l1[index].Image}")),
                            ),
                            Text("❤ ${home_providerf!.l1[index].like} k",style: TextStyle(color: Color(0xFFFF4D67)),)
                          ],
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
    );
  }
}
