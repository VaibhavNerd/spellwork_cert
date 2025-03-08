import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:spellwork_cert/color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:spellwork_cert/navigation/route_constants.dart';


class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bg,
        appBar: AppBar( //centerTitle: true,
        backgroundColor: Colors.transparent,
          //backgroundColor: Color(0x44000000),
          elevation: 0,
          title:
             SizedBox(  //color: Colors.black,
                height: 100, width :size.width,
                 child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SvgPicture.asset("assets/lottie/logo.svg",width: 78.w,),
                    //AutoSizeText("SPELLWORK TECHNOLOGIES",  style: TextStyle(fontSize: 18, color: primary, fontWeight: FontWeight.w400, height: 1.5),minFontSize: 2,maxLines:2),
                   ],
                 ),

             // style: TextStyle(fontSize: 15.sp),
            ),


        ),

      body:
         Stack(
           children : <Widget>[
             Container(
               color: Colors.transparent,
               child:
               Lottie.asset("assets/lottie/confetti.zip",fit: BoxFit.fill,repeat: false),
             ),
            Padding(

            padding: const EdgeInsets.fromLTRB(8,0,8,0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child:
                       Center(
                         child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: size.height*0.1,),
                             Container(
                                      height: size.height*0.62,
                                     width: (size.width-20)*0.8 ,
                                       decoration: const BoxDecoration(
                                           color: secondary,
                                           borderRadius: BorderRadius.all(Radius.circular(20)),
                                         boxShadow: [
                                           BoxShadow(
                                             color: shadow,
                                             blurRadius: 6.0,
                                             spreadRadius: 3.0,
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
                                        padding: const EdgeInsets.fromLTRB(2,0,2,3),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                            SizedBox(  height: 15.h, width: 40.w,
                                                 child: Lottie.asset("assets/lottie/check.zip",fit: BoxFit.contain,
                                                   frameRate: FrameRate.max,
                                                 errorBuilder: (context, error, stackTrace) => const FittedBox( fit: BoxFit.contain,
                                                     child: Icon(Icons.verified_rounded,color: Colors.green,)),
                                                 )
                                             ),
                                              Container( // color: Colors.amber,
                                                alignment: Alignment.center,
                                                width: (size.width-20)*.60, height: size.height*0.15,
                                                child:const AutoSizeText(
                                                  "This\nDocument\nIs Verified",
                                                  style: TextStyle(fontSize: 36,),
                                                  textAlign: TextAlign.center,
                                                   minFontSize: 2, maxLines: 3,
                                                ),

                                              ),
                                              // Text("This",  style: TextStyle(fontSize: 26.sp),),
                                              // Text("Document",  style: TextStyle(fontSize: 26.sp),),
                                              // Text("Is Verified",  style: TextStyle(fontSize: 26.sp),),
                                              SizedBox(height: size.height* 0.02 ,),
                                              SizedBox( //color: Colors.cyan,
                                                  width: (size.width-20)*.55, height: size.height*0.17,
                                                  child: AutoSizeText("The Candidate Have Successfully Completed Three Month Remote Internship Under JoyForge Technologies",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 14.sp,height: 1.5,fontWeight: FontWeight.w300),
                                                    minFontSize: 2, maxLines: 5,
                                                    )),
                                              SizedBox(height: size.height* 0.03,),
                                              InkWell( onTap: ()   { context.pushNamed(RouteConstants.cert_id);},
                                                child: Container(
                                                  width: (size.width-20)*.6,
                                                  height: (size.height-20)*0.06,
                                                   decoration: const BoxDecoration(
                                                       gradient: LinearGradient(
                                                     colors:[ grad2,
                                                              grad1  ],),
                                                     borderRadius: BorderRadius.all(Radius.circular(6)),
                                                   ),
                                                  child:  Center(child: AutoSizeText("View Certificate",style: TextStyle(fontSize: 15.sp,color: Colors.white),
                                                   minFontSize: 2,maxLines: 1,)),

                                                ),
                                              ),
                                              SizedBox(height: size.height* 0.04 ,),

                                            ],
                                          ),
                                        ),
                                      ),
                                   ),
                               ],
                               ),
                       ),

                           ),

                       ),
                       ),

        ], ),







          );
  }
}
