import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cardField.dart';

class settingScreen extends StatefulWidget {
  @override
  _settingScreenState createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              height: 200,
              width: ScreenUtil().screenWidth,
              // color: Colors.blue,
              child: Image.asset(
                "lib/assets/images/arduino-icon.png",
                scale: 10,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: SizedBox(
                        height: ScreenUtil().setHeight(500),
                        child: CardField()),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
