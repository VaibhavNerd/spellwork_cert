

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:spellwork_cert/certiLoad.dart';
import 'package:spellwork_cert/homepage.dart';
import 'package:spellwork_cert/navigation/route_constants.dart';

import 'package:spellwork_cert/view_cert.dart';



class AppRouter{
 GoRouter router = GoRouter(
   routes: [
     // GoRoute( name: RouteConstants.splash,
     //   path:  '/',
     //   pageBuilder: (context, state) {
     //     return MaterialPage(child: SplashScreen(),);
     //   },
     // ),
     GoRoute( name: RouteConstants.home,
       path:  '/',
     pageBuilder: (context, state) {
       return const MaterialPage(child: HomePage(),);
     },
     ),

     GoRoute( name: RouteConstants.cert_id,
       path:  '/cert_id',
       pageBuilder: (context, state) {
         return const MaterialPage(child: ViewCert(),);

       },
     ),

     GoRoute( name: RouteConstants.view_cert,
       path:  '/view_cert/:id',
       pageBuilder: (context, state) {
         return MaterialPage(child: LoadCert(
             certid: state.pathParameters['id']??"696969",
              imgurl: state.queryParameters['img_url']?? "ok"),);
       },
     ),






   ],

    errorPageBuilder: (context, state){
     return  MaterialPage(child:
     WillPopScope(
       onWillPop: () async => false,
       child: Scaffold(
         body: Center(
           child: SizedBox( height: double.infinity, width: double.infinity,
             child:
              Lottie.asset("assets/lottie/e404.json"),
           ),
         ),
       ),
     ),);
    }
 );
  
}