import 'package:flutter/material.dart';
import 'package:spellwork_cert/responsive/desktop_body_view.dart';
import 'package:spellwork_cert/responsive/mobile_body_view.dart';
import 'package:spellwork_cert/responsive/responsive_layout.dart';
class ViewCert extends StatefulWidget {
  const ViewCert({Key? key}) : super(key: key);

  @override
  State<ViewCert> createState() => _ViewCertState();
}

class _ViewCertState extends State<ViewCert> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody2(),
        desktopBody: DesktopBody2(),
      ),
    );
  }
}
