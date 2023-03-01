import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({Key? key}) : super(key: key);

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  File f1 = File("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  f1.path.isEmpty?Image.asset("assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",height: 40.h,width: 100.w,fit: BoxFit.fill,):Image.file(f1,height: 40.h,width: 100.w,fit: BoxFit.fill,),
                  GlassmorphicContainer(
                    width: 100.w,
                    height:40.h,
                    borderRadius: 0,
                    blur: 0,
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red.withOpacity(0.3),
                          Colors.red.withOpacity(0.3),
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
                    child:Padding(
                      padding:  EdgeInsets.only(top: 5.h,left: 4.w),
                      child: Align(alignment: Alignment.topLeft,child: Text("Detail",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                    ),
                  ),
                ],
              ),
              Container(
                height: 60.h,
                width: 100.w,
                color: Colors.black,
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 20.h),
            child: InkWell(
              onTap: (){
                bottomsheetdilaog();
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    height: 22.h,
                    width: 22.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white30,
                    ),
                    child: f1.path.isEmpty?
                    Container(height: 22.h,width: 22.h,
                      decoration: BoxDecoration(shape: BoxShape.circle,),
                      child: ClipRRect(borderRadius: BorderRadius.circular(80.sp),
                          child: Image.asset("assets/image/9f64bbbb8235b9d97c1c8b816da36896.jpg",height: 22.h,width: 22.w,fit: BoxFit.fill,))):
                    CircleAvatar(backgroundImage: FileImage(f1),),
                  ),
                  Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red,),
                    child: Icon(Icons.camera_alt,color: Colors.white,size:25.sp),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void bottomsheetdilaog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context:context,
        builder:(context){
          return Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), color: Colors.white,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: ()async{
                  ImagePicker img = ImagePicker();
                  XFile? f2 =  await img.pickImage(source: ImageSource.camera);
                  setState((){
                    f1 = File(f2!.path);
                  });
                  Navigator.pop(context);

                },child: Text("Take Photo",style: TextStyle(fontSize: 20),)),
                InkWell(onTap: ()async{
                  ImagePicker img = ImagePicker();
                  XFile? f2 =  await img.pickImage(source: ImageSource.gallery);
                  setState((){
                    f1 = File(f2!.path);
                  });
                  Navigator.pop(context);
                },
                    child: Text("Choose From Library",style: TextStyle(fontSize: 20))),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },child: Text("Cancel",style: TextStyle(fontSize: 20))),
              ],
            ),
          );
        }
    );
  }
}
