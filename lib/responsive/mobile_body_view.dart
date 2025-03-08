
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../color.dart';
import '../databse_services.dart';
import '../navigation/route_constants.dart';


class MobileBody2 extends StatefulWidget {
  const MobileBody2({Key? key}) : super(key: key);

  @override
  State<MobileBody2> createState() => _MobileBody2State();
}

class _MobileBody2State extends State<MobileBody2> {
  TextEditingController certid_controller= TextEditingController();
  DocumentSnapshot <Map<String, dynamic>>?snapshot;
  final _formKey = GlobalKey<FormState>();

  double val = 0;
  String ?one ;
  bool check  = true;
  getCertDet()async{

      snapshot = await DatabaseService()
          .getUserData(certid_controller.text);
print(snapshot!.exists);


  }
  getCertImg(){
    one = snapshot!.data()!['certImg'];


    print("why are you doing this?");
}
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:  Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar( //centerTitle: true,
          backgroundColor: Colors.transparent,
          //backgroundColor: Color(0x44000000),
          elevation: 0,

          automaticallyImplyLeading: false,
          title:
          SizedBox(  //color: Colors.black,
            height: 100, width :size.width,
            child: Row( crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/lottie/logo.svg",width: 78.w,color: primary,),
                //AutoSizeText("SPELLWORK TECHNOLOGIES",  style: TextStyle(fontSize: 18, color: primary, fontWeight: FontWeight.w400, height: 1.5),minFontSize: 2,maxLines:2),
              ],
            ),

            // style: TextStyle(fontSize: 15.sp),
          ),


        ),

        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            height: double.infinity, width: double.infinity,
                decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[ bg,
                secondary  ],),),
            child: Center(
              child: Padding(

                padding: const EdgeInsets.all(2.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                   child:
                     SingleChildScrollView(
                       child: Container(
                         height: size.height*0.3,
                         width: (size.width)*0.95 ,
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
                           padding: const EdgeInsets.fromLTRB(3,15,2,3),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 15),
                             child: SingleChildScrollView(
                               child: Column( mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: size.height* 0.015 ,),
                                   Text("Certificate Verification",  style: TextStyle(fontSize: 18.sp),),
                                   Container(width: 6.w,height:3,
                                     decoration: const BoxDecoration(
                                       gradient: LinearGradient(
                                         colors:[ grad2,
                                           grad1  ],),),),

                                   SizedBox(height: size.height* 0.02 ,),
                                   SizedBox( width: (size.width-20)*.5,
                                       child: Text("Enter Certificate Id",
                                         style: TextStyle(fontSize: 12.sp),)),
                                   SizedBox(height: size.height* 0.01 ,),
                                   Container( width:  (size.width-20)*.6,

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

                                         child: TextFormField(
                                           onTapOutside: (event) {
                                             FocusScopeNode currentFocus = FocusScope.of(context);
                                             if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                                               FocusManager.instance.primaryFocus?.unfocus();
                                             }
                                           },

                                           decoration: InputDecoration(
                                             focusedBorder: const OutlineInputBorder(
                                               borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),

                                             ),
                                             enabledBorder: const OutlineInputBorder(
                                               borderSide: BorderSide(color: Colors.black12, width: 1.0),
                                             ),
                                            // labelText: "Enter Your Certificate Id", labelStyle: TextStyle(fontSize: 12.sp),
                                             hintText: check ? "CCXXXXXX" : null,
                                           //  hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey[400]),
                                             isDense: true, // important line
                                            // contentPadding: EdgeInsets.fromLTRB(10, 30, 20, 10),//
                                           ),
                                           style: TextStyle(fontSize:  size.height* 0.02 ,),
                                           controller: certid_controller,
                                           validator: (val) => val!.isEmpty ? 'This field cannot be blank' : null,
                                         ),
                                       ),

                                   SizedBox(height: size.height* 0.02 ,),
                                   InkWell( onTap: ()  async { if (_formKey.currentState!.validate()) {
                                     await getCertDet();
                                     if(snapshot!.exists)
                                     {
                                       getCertImg();
                                       {
                                         if (context.mounted) {
                                           context.pushNamed(
                                             RouteConstants.view_cert,
                                             queryParameters: {
                                               "img_url": one
                                             },
                                             pathParameters: {
                                               'id': certid_controller
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
                                   else if(!_formKey.currentState!.validate()){
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
                                       width: (size.width-20)*.3,
                                       height: (size.height-20)*0.055,
                                       decoration: const BoxDecoration(
                                         gradient: LinearGradient(
                                           colors:[ grad2,
                                             grad1  ],),
                                         borderRadius: BorderRadius.all(Radius.circular(3)),
                                       ),
                                       child:  Center(child: AutoSizeText("View",style: TextStyle(fontSize: 14.sp,color: Colors.white),
                                       minFontSize: 2,maxLines: 1,)),
                                     ),
                                   ),
                                   SizedBox(height: size.height* 0.02 ,),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                        )



                    ),
                  ),
            ),
          ),
        ),


    );
  }
}
