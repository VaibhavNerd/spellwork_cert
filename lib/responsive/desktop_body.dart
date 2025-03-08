import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../color.dart';
import '../navigation/route_constants.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bg,
        appBar: null,

        body: Stack(
          children: [ Container( height: size.height,width: size.width,
            color: Colors.transparent,
            child:
            Center(child: Lottie.asset("assets/lottie/confetti.zip",width: 78.w,fit: BoxFit.contain,repeat: false
            )),
          ),

            Padding(

            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [

                    Padding(
                      padding:  EdgeInsets.only(left: size.width*0.025),
                      child: SvgPicture.asset("assets/lottie/logo.svg",width: 28.w,),
                    ),
                    SizedBox(height: size.height* 0.15 ,),
                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          height: size.height*0.53,
                          width: (size.width-20)*0.4 ,
                          decoration: const BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: shadow,
                                blurRadius: 5.0,
                                spreadRadius: 4.0,
                                offset: Offset(2.0, 2.0,), // shadow direction: bottom right
                              ),
                              // BoxShadow(
                              //   color: shadow,
                              //   blurRadius: 3.0,
                              //   spreadRadius: 2.0,
                              //   offset: Offset(-2.0, -2.0,), // shadow direction: bottom right
                              // )
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2,8,2,3),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: size.height* 0.02 ,),
                                  SizedBox(  //color: Colors.black,
                                      height: 13.h, width: 30.w,
                                      child: Lottie.asset("assets/lottie/check.zip",fit: BoxFit.contain,
                                        frameRate: FrameRate.max,
                                        errorBuilder: (context, error, stackTrace) => const FittedBox( fit: BoxFit.contain,
                                            child: Icon(Icons.verified_rounded,color: Colors.green,)),
                                      )
                                  ),
                                  Container(  width: 30.w, alignment: Alignment.center,
                                      child: const AutoSizeText("This Document Is Verified", maxLines:1 ,minFontSize: 6,  style: TextStyle(fontSize: 72),)),

                                  SizedBox(height: size.height* 0.03 ,),
                                  SizedBox( width: 30.w,
                                      child: const AutoSizeText("The Candidate Have Successfully Completed Three Month Remote Internship Under JoyForge Technologies",
                                        textAlign: TextAlign.center, style: TextStyle(fontSize: 20,height: 1.5,fontWeight: FontWeight.w100,),maxLines:3 ,minFontSize: 6,)),
                                  SizedBox(height: size.height* 0.03 ,),
                                  InkWell( onTap: ()   { context.pushNamed(RouteConstants.cert_id);},
                                    child: Container(
                                      width: 28.w,
                                      height: 6.5.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        gradient: LinearGradient(
                                          colors:[ grad2,
                                            grad1  ],),
                                      ),
                                      child:  const Center(child: AutoSizeText("View Certificate",style: TextStyle(fontSize: 22,color: Colors.white),minFontSize: 6,maxLines: 1,)),
                                    ),
                                  ),
                                  SizedBox(height: size.height* 0.025 ,),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

                  ],

                ),
              ),
            ),
          ),

    ],
        )
    );
  }
}
