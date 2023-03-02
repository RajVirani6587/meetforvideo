import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meetforvideo/MODEL/slider_imagescreen.dart';
import 'package:sizer/sizer.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({Key? key}) : super(key: key);

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  File f1 = File("");
  var txtkey = GlobalKey<FormState>();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgender = TextEditingController();
  TextEditingController txtage = TextEditingController();
  TextEditingController txtcountry = TextEditingController();

  List<String> gender = ["Male","Female","others"];

  String select = 'Male';

  List<String> contry =
  ['India','Pakistan','Bangladesh','Afghanistan','Angola',
    'Aruba','vietnam','egypt','saudi arabia','UAE','syria',
    'turkey','colombia','venezuela','Brazil','nigeria','madagascar','ukraine',
    'bahrain','taiwan','Belize','bosnia-and-herzegovina','canada','denmark',
    'finland','france','hong kong','iran','israel','jordan','japan','kuwait',
    'mexico','nepal','new zealand','norway','oman','portugal','qatar','russia','usa'];

  String selectContry = 'India';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 15.h,),
                        Container(height: 18.h,width: 100.w,color: Colors.white),
                        SizedBox(height: 2.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5.w),
                          child: TextFormField(
                            validator: (value){
                              return value!.length < 2?'Name must be greater than two characters':null;
                            },
                            style: TextStyle(color: Colors.white),
                            controller: txtname,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(Icons.person,color: Colors.white,),
                              label: Text("NickName",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5.w),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Gender";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                controller: txtgender,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white12,
                                  prefixIcon: Icon(Icons.call_split,color: Colors.white,),
                                  label: Text("Gender",style: TextStyle(color: Colors.white),),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2,color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: 5),
                                child: DropdownButton(
                                    value: select,
                                    items: [
                                      DropdownMenuItem(child: Text("Male",style: TextStyle(color: Color(0xFFFF4D67)),),value: "Male",),
                                      DropdownMenuItem(child: Text("Female",style: TextStyle(color: Color(0xFFFF4D67)),),value: "Female",),
                                      DropdownMenuItem(child: Text("others",style: TextStyle(color: Color(0xFFFF4D67)),),value: "others",),
                                    ],
                                    onChanged:(value){
                                      setState(() {
                                        txtgender.text=value! ;
                                        select = value;
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5.w),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Age";
                              }
                              else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.numberWithOptions(),
                            readOnly: true,
                            style: TextStyle(color: Colors.white),
                            controller: txtage,
                            onTap: (){
                              datepick();
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(Icons.calendar_month,color: Colors.white,),
                              label: Text("Age",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2,color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:5.w),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Country";
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                controller: txtcountry,
                                onTap: (){},
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white12,
                                  prefixIcon: Icon(Icons.location_on_outlined,color: Colors.white,),
                                  label: Text("Country",style: TextStyle(color: Colors.white),),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2,color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: 5),
                                child: DropdownButton(
                                    style: TextStyle(color: Color(0xFFFF4D67)),
                                    value: selectContry,
                                    items: [
                                      DropdownMenuItem(child: Text("India",),value: "India",),
                                      DropdownMenuItem(child: Text("Pakistan",),value: "Pakistan",),
                                      DropdownMenuItem(child: Text("Bangladesh",),value: "Bangladesh",),
                                      DropdownMenuItem(child: Text("Afghanistan",),value: "Afghanistan",),
                                      DropdownMenuItem(child: Text("Angola",),value: "Angola",),
                                      DropdownMenuItem(child: Text("Aruba",),value: "Aruba",),
                                      DropdownMenuItem(child: Text("vietnam",),value: "vietnam",),
                                      DropdownMenuItem(child: Text("egypt",),value: "egypt",),
                                      DropdownMenuItem(child: Text("saudi arabia",),value: "saudi arabia",),
                                      DropdownMenuItem(child: Text("UAE",),value: "UAE",),
                                      DropdownMenuItem(child: Text("syria",),value: "syria",),
                                      DropdownMenuItem(child: Text("turkey",),value: "turkey",),
                                      DropdownMenuItem(child: Text("colombia",),value: "colombia",),
                                      DropdownMenuItem(child: Text("venezuela",),value: "venezuela",),
                                      DropdownMenuItem(child: Text("Brazil",),value: "Brazil",),
                                      DropdownMenuItem(child: Text("nigeria",),value: "nigeria",),
                                      DropdownMenuItem(child: Text("madagascar",),value: "madagascar",),
                                      DropdownMenuItem(child: Text("ukraine",),value: "ukraine",),
                                      DropdownMenuItem(child: Text("bahrain",),value: "bahrain",),
                                      DropdownMenuItem(child: Text("taiwan",),value: "taiwan",),
                                      DropdownMenuItem(child: Text("Belize",),value: "Belize",),
                                      DropdownMenuItem(child: Text("bosnia-and-herzegovina",),value: "bosnia-and-herzegovina",),
                                      DropdownMenuItem(child: Text("canada",),value: "canada",),
                                      DropdownMenuItem(child: Text("denmark",),value: "denmark",),
                                      DropdownMenuItem(child: Text("finland",),value: "finland",),
                                      DropdownMenuItem(child: Text("france",),value: "france",),
                                      DropdownMenuItem(child: Text("hong kong",),value: "hong kong",),
                                      DropdownMenuItem(child: Text("iran",),value: "iran",),
                                      DropdownMenuItem(child: Text("israel",),value: "israel",),
                                      DropdownMenuItem(child: Text("jordan",),value: "jordan",),
                                      DropdownMenuItem(child: Text("japan",),value: "japan",),
                                      DropdownMenuItem(child: Text("kuwait",),value: "kuwait",),
                                      DropdownMenuItem(child: Text("mexico",),value: "mexico",),
                                      DropdownMenuItem(child: Text("nepal",),value: "nepal",),
                                      DropdownMenuItem(child: Text("new zealand",),value: "new zealand",),
                                      DropdownMenuItem(child: Text("norway",),value: "norway",),
                                      DropdownMenuItem(child: Text("oman",),value: "oman",),
                                      DropdownMenuItem(child: Text("portugal",),value: "portugal",),
                                      DropdownMenuItem(child: Text("qatar",),value: "qatar",),
                                      DropdownMenuItem(child: Text("russia",),value: "russia",),
                                      DropdownMenuItem(child: Text("usa",),value: "usa",),
                                    ],
                                    onChanged:(value){
                                      setState(() {
                                        txtcountry.text=value!;
                                        selectContry = value;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (){
                              if(txtkey.currentState!.validate() == true && f1.path.isEmpty==false){
                                  txt m1 = txt(
                                    age: txtage.text,
                                    image: f1.path,
                                    name: txtname.text,
                                    countey: txtcountry.text,
                                    gender: txtgender.text,
                                  );
                                  Navigator.pushReplacementNamed(context,'yourself');
                              }
                              else{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return Expanded(
                                      child: AlertDialog(
                                        title: Text('Red Alert',style: TextStyle(color: Colors.red),),
                                        content: Text('Please Upload a Photo'),
                                        actions: [
                                          InkWell(onTap:(){
                                            Navigator.pop(context);
                                          },
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Text("ok",style: TextStyle(fontSize: 20),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            child: GlassmorphicContainer(
                              width: 80.w,
                              height:7.h,
                              borderRadius: 20.sp,
                              blur: 50,
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
                              child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),)),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                      ],
                    ),
                  ),
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
      ),
    );
  }
  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF4D67), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(2999),
    );
    if(pickedDate != null ){
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        txtage = TextEditingController(text: "$formattedDate");
      });
    }
    else{
      print("Date is not selected");
    }
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
