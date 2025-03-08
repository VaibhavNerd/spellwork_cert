import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:spellwork_cert/color.dart';

import '../databse_services.dart';
import '../navigation/route_constants.dart';

class DesktopBody2 extends StatefulWidget {
  const DesktopBody2({Key? key}) : super(key: key);

  @override
  State<DesktopBody2> createState() => _DesktopBody2State();
}

class _DesktopBody2State extends State<DesktopBody2> {
  TextEditingController dcertid_controller= TextEditingController();
  DocumentSnapshot <Map<String, dynamic>>?snapshot;
  final _dformKey = GlobalKey<FormState>();
  double? dval = 0;
  String? done;
  bool ?check = true;
  getCertDet()async{

    snapshot = await DatabaseService()
        .getUserData(dcertid_controller.text);
    print(snapshot!.exists);


  }
  getCertImg(){
    done = snapshot!.data()!['certImg'];


    print("""why are you doing this?\n go get some help \n""");
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: null ,

        body: Form( key: _dformKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            height: double.infinity, width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[ bg,
                  secondary  ],),),
            child: Padding(

              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding:  EdgeInsets.only(left: size.width*0.025),
                        child: SvgPicture.asset("assets/lottie/logo.svg",width: 28.w,color: primary,),
                      ),
                      SizedBox(height: size.height* 0.25 ,),
                      Container( //color: Colors.cyanAccent,
                        child: Center(
                          child: Container(
                            height: size.height*0.35,
                            width: (size.width-20)*0.45 ,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              boxShadow: [
                                BoxShadow(
                                  color: shadow2,
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
                              padding: const EdgeInsets.fromLTRB(2,8,2,3),
                              child: Padding(
                                padding:  EdgeInsets.only(left: 3.w),
                                child: SingleChildScrollView(
                                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: size.height* 0.03 ,),

                                      SizedBox(  width: 30.w,
                                          child: const AutoSizeText("Certificate Verification", maxLines:1 ,minFontSize: 6,  style: TextStyle(fontSize: 30),)),
                                      Container(width: 2.4.w,height:0.35.h,decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors:[ grad2,
                                            grad1  ],),),),
                                      SizedBox(height: size.height* 0.02 ,),
                                      SizedBox( width: 30.w,
                                          child: const AutoSizeText("Enter Certificate Id",
                                            style: TextStyle(fontSize: 18),maxLines:3 ,minFontSize: 6,)),
                                      SizedBox(height: size.height* 0.01 ,),
                                      Container( width:  (size.width-20)*.2,

                                        decoration: const BoxDecoration( color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: shadow3,
                                              blurRadius: 2.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(1.0, 1.0,), // shadow direction: bottom right
                                            ),
                                            // BoxShadow(
                                            //   color: shadow,
                                            //   blurRadius: 3.0,
                                            //   spreadRadius: 2.0,
                                            //   offset: Offset(-2.0, -2.0,), // shadow direction: bottom right
                                            // )
                                          ],
                                        ),
                                        child:  TextFormField(


                                          decoration: InputDecoration(
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black12, width: 1.0),
                                            ),
                                           // labelText: "Enter your certificate id", labelStyle: TextStyle(fontSize: 3.5.sp),

                                            hintText: check! ? "CCXXXXXX" : null,
                                            hintStyle: TextStyle(fontSize: 3.5.sp,color: Colors.grey[400]),
                                            isDense: true, // important line
                                           // contentPadding: EdgeInsets.fromLTRB(10, 30, 20, 10),//
                                          ),
                                          style: TextStyle(fontSize:   (size.height)*0.03,),
                                          controller: dcertid_controller,
                                          validator: (val) => val!.isEmpty ? 'This field cannot be blank' : null,
                                        ),
                                      ),

                                      SizedBox(height: size.height* 0.02 ,),
                                      InkWell(
                                        onTap: ()  async { if (_dformKey.currentState!.validate()) {
                                          await getCertDet();
                                          if(snapshot!.exists)
                                          {
                                            getCertImg();
                                            {
                                              if (context.mounted) {
                                                context.pushNamed(
                                                  RouteConstants.view_cert,
                                                  queryParameters: {
                                                    "img_url": done
                                                  },
                                                  pathParameters: {
                                                    'id': dcertid_controller
                                                        .text
                                                  },
                                                );
                                              }
                                            }
                                          }
                                          else{
                                            const snackBar = SnackBar(
                                              content: Text('Enter valid Certificate ID'),

                                            );

                                            // Find  the ScaffoldMessenger in the widget tree
                                            // and use it to show a SnackBar.
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }

                                        }
                                        else if(!_dformKey.currentState!.validate()){
                                          setState(() {
                                            check = false;
                                          });
                                        }
                                        else{
                                          const snackBar = SnackBar(
                                            content: Text('Some error has occured'),

                                          );

                                          // Find  the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
                                          },
                                        child: Container(
                                          width: (size.width-20)*.09,
                                          height: (size.height-20)*0.06,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors:[ grad2,
                                                grad1  ],),
                                            borderRadius: BorderRadius.all(Radius.circular(3)),
                                          ),
                                          child:  const Center(child: AutoSizeText("View",style: TextStyle(fontSize: 20,color: Colors.white),minFontSize: 6,)),
                                        ),
                                      ),
                                      SizedBox(height: size.height* 0.015 ,),

                                    ],
                                  ),
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
          ),
        )
    );
  }
}
