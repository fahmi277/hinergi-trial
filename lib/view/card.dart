import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class cardSetting extends StatefulWidget {
  @override
  _cardSettingState createState() => _cardSettingState();
}

class _cardSettingState extends State<cardSetting> {
  Color textColor = Colors.green;
  var dayaTerpasang = ["450", "900", "1300", "2200", "3500"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        index += 1;
        return Card(
          // color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "lib/assets/icons/electricity.png",
                  scale: 10,
                ),
                Column(
                  children: [
                    Text("Daya Terpasang",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quantico(
                            // color: textColor,
                            fontSize: ScreenUtil().setSp(35))),
                    Text(dayaTerpasang[counter],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quantico(
                            // color: textColor,
                            fontSize: ScreenUtil().setSp(35))),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Container(
                        width: 40,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.green)),
                          onPressed: () {},
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("+",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quantico(
                                  // color: textColor,
                                  fontSize: ScreenUtil().setSp(45))),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () {},
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text("-",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quantico(
                                // color: textColor,
                                fontSize: ScreenUtil().setSp(45))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
