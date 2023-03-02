import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Yourself_Screen extends StatefulWidget {
  const Yourself_Screen({Key? key}) : super(key: key);

  @override
  State<Yourself_Screen> createState() => _Yourself_ScreenState();
}

class _Yourself_ScreenState extends State<Yourself_Screen> {
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding:  EdgeInsets.only(top: 3.h),
            child: Column(
              children: [
                ListTile(leading: Text("Choose Your Interest",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text("Choose your interests and get the best video recommendations.",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 1.h,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                            "🎭 Entertainment",
                            0,
                          ),
                          Selecte(
                            "🎮 Gaming",
                            1,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                            "🎨 Art",
                            2,),
                          Selecte(
                              "🐶 Animals",
                              3),
                          Selecte(
                              "😀 Comedy",
                              4),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "💃 Dance",
                              5),
                          Selecte(
                              "🌹 Beauty", 6),
                          Selecte(
                              "🎶 Music",
                              7),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "🍹 Food & Drink",
                              8),
                          Selecte(
                              "🏅 Sports",
                              9),
                          Selecte(
                              "⛏ DIY",
                              10),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "🔭 Science & Education",
                              11),
                          Selecte(
                              "🧳 Travel",
                              12),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "👨‍👩‍👧 Family",
                              13),
                          Selecte(
                              "📽️ Anime & Movie", 14),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "📱 Technology",
                              15),
                          Selecte(
                              "🥾 Outdoors",
                              16),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "🧫 Culture",
                              17),
                          Selecte(
                              "🏥 Health",
                              18),
                          Selecte(
                              "📚 Comics",
                              19),
                        ],
                      ),
                      SizedBox(height: 0.5.h,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //
                      //   ],
                      // ),

                      SizedBox(height: 1.h,),
                      Container(height: 18.h,width: 100.w,color: Colors.white,),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                                Navigator.pushNamed(context,'permission');
                            },
                            child: Container(
                              height: 7.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(20.sp)
                              ),
                              child: Center(child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,'permission');
                            },
                            child: Container(
                              height: 7.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF4D67),
                                  borderRadius: BorderRadius.circular(20.sp)
                              ),
                              child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget Selecte(String text, int i) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.sp,color: Color(0xFFFF4D67)),
        backgroundColor: cnt == i ? Color(0xFFFF4D67) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
      ),
      onPressed: () {
        setState(() {
          cnt = i;
        });
      },
      child: Text(
        "$text",
        style: TextStyle(fontSize: 13.sp,color:cnt == i?  Colors.white : Color(0xFFFF4D67)),
      ),
    );
  }
}
