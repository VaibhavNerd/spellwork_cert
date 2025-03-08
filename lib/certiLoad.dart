import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';
class LoadCert extends StatefulWidget {

  final String? certid ;
  final String? imgurl ;
  const LoadCert({super.key, 
    this.certid,
    this.imgurl,
  });

  @override
  State<LoadCert> createState() => _LoadCertState();
}

class _LoadCertState extends State<LoadCert> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   var siz =  MediaQuery.of(context).size.width*0.85 ;
   var siz2 =  MediaQuery.of(context).size.width*0.85 ;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(  backgroundColor: bg,
        //extendBodyBehindAppBar: true,
        appBar: AppBar( //centerTitle: true,
          backgroundColor: bg,
          //backgroundColor: Color(0x44000000),
          automaticallyImplyLeading: false,
          elevation: 0,
          title:
          SizedBox(  //color: Colors.black,
            height: 100, width :size.width,
            child: Row( crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: size.width<600?MainAxisAlignment.center: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/lottie/logo.svg",width:size.width<600? 78.w:28.w,color: primary,),
                //AutoSizeText("SPELLWORK TECHNOLOGIES",  style: TextStyle(fontSize: 18, color: primary, fontWeight: FontWeight.w400, height: 1.5),minFontSize: 2,maxLines:2),
              ],
            ),

            // style: TextStyle(fontSize: 15.sp),
          ),


        ),

        body: Container(
          height: double.infinity, width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:[ bg,
                secondary  ],),),
          child: Center( child:
            Align(  alignment: Alignment.center,  child:
            Container(   color: Colors.transparent,
              width: MediaQuery.of(context).size.width*0.85 ,
              height: MediaQuery.of(context).size.height*0.85 ,
                 child:


              // CachedNetworkImage(fit: BoxFit.contain, color: bg,
              //   imageUrl: widget.imgurl!, filterQuality: FilterQuality.medium,imageRenderMethodForWeb: ,
              //   imageBuilder: (context, imageProvider) => PhotoView(
              //     maxScale: PhotoViewComputedScale.contained * 3.0,
              //     minScale: PhotoViewComputedScale.contained,
              //     initialScale: PhotoViewComputedScale.contained,
              //     backgroundDecoration:  const BoxDecoration(
              //   gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors:[ bg,
              //       secondary  ],),),
              //     imageProvider: imageProvider,
              //   ),
              //
              //   placeholder: (context, url) =>  Row(  mainAxisAlignment:  MainAxisAlignment.center,crossAxisAlignment:  CrossAxisAlignment.center,
              //       children: [
              //
              //         Align(  alignment: Alignment.center,  child:
              //
              //         Container(//color: Colors.red,
              //            height: MediaQuery.of(context).size.height*0.5,width: MediaQuery.of(context).size.width*0.5,
              //             child: Lottie.asset("assets/lottie/load.zip",fit: BoxFit.contain)),
              //         ),
              //       ]),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              PhotoView( filterQuality: FilterQuality.medium,
                imageProvider:
                 NetworkImage(
                  widget.imgurl!,
                  ),
                maxScale: PhotoViewComputedScale.contained * 3.0,
                    minScale: PhotoViewComputedScale.contained,
                    initialScale: PhotoViewComputedScale.contained,
                    backgroundDecoration:  const BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[ bg,
                      secondary  ],),),
                loadingBuilder: (context,loadingProgress) => Align(  alignment: Alignment.center,  child:
                     SizedBox(//color: Colors.red,
                          height: MediaQuery.of(context).size.height*0.5,width: MediaQuery.of(context).size.width*0.5,
                           child: Lottie.asset("assets/lottie/load.zip",fit: BoxFit.contain)),
            ),
                errorBuilder: (context, error, stackTrace) =>

                    SizedBox( height: double.infinity, width: double.infinity,
                        child:  Lottie.asset("assets/lottie/e404.json"),),

                ) ,
              ),
            ),),
          ),
        ),

    );
  }
}
