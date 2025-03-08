// ignore_for_file: prefer_const_constructors;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spellwork_cert/color.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spellwork_cert/navigation/router.dart';
import 'firebase_options.dart';
import 'package:spellwork_cert/url _strategy/url_strategy_native.dart'
if (dart.library.html) 'package:spellwork_cert/url _strategy/url_strategy_web.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await svgCache();
  await LottieCache().add("assets/lottie/confetti.zip");
    runApp(const MyApp());
    urlConfig();
}

Future<void> svgCache() async {
   const loader = SvgAssetLoader("assets/lottie/logo.svg");
  svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
}
class LottieCache {

  final Map<String, LottieComposition> _compositions = {};

  Future<void> add(String assetName) async {
    _compositions[assetName] = await AssetLottie(assetName).load();
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // User _user;
  final bool _isLoggedIn = false;
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   return Sizer(
        builder: (context, orientation, deviceType) {
         return MaterialApp.router(
           title: "JoyForge Technologies",
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.router.routeInformationParser,
      routerDelegate: _appRouter.router.routerDelegate ,
           builder: (context, router) => router!,
      theme: ThemeData(primaryColor: bg),
          );
        }
    );
  }
}
