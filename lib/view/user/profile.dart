import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hinergi_kwh_meter/model/userModel.dart';
import 'package:hinergi_kwh_meter/services/apiService.dart';
import 'package:hinergi_kwh_meter/view/user/setting.dart';

import '../formField.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserData userData = UserData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<UserData>(
            future: userData.getUserdata(),
            builder: (context, AsyncSnapshot<UserData> snapshot) {
              if (snapshot.hasData) {
                var inputProfile = List(3);
                inputProfile[0] = snapshot.data.apiKey;
                inputProfile[1] = snapshot.data.channelId;
                inputProfile[2] = snapshot.data.tarifKwh;
                return SafeArea(
                    child: Stack(
                  children: [
                    Container(
                        height: ScreenUtil().setHeight(700),
                        // width: 200,
                        color: Color.fromARGB(255, 4, 117, 116)),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(70),
                        right: ScreenUtil().setWidth(20),
                        left: ScreenUtil().setWidth(20),
                      ),
                      child: Container(
                        height: 200,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(10),
                                        left: ScreenUtil().setWidth(30)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        color: Colors.white,
                                        child: Image.asset(
                                          "lib/assets/icons/avatar.png",
                                          scale: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenUtil().setWidth(50)),
                                    child: Text(snapshot.data.nama,
                                        style: GoogleFonts.quantico(
                                            color: Color.fromARGB(
                                                255, 4, 117, 116),
                                            fontSize: ScreenUtil().setSp(35))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenUtil().setWidth(60)),
                                    child: InkWell(
                                      onTap: () {
                                        print("Setting");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  settingScreen()),
                                        );
                                        // showAlertDialog(context);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset(
                                            "lib/assets/icons/settings.png",
                                            scale: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                // Horizontal ListView
                                height: 100,

                                child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    index += 1;
                                    return profileData(index, inputProfile);
                                  },
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Text(snapshot.data.apiKey,
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(35))),
                              //         Text("Daya Terpasang",
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(25))),
                              //       ],
                              //     ),
                              //     Column(
                              //       children: [
                              //         Text("40 KWH",
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(35))),
                              //         Text("Batas/Bulan",
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(25))),
                              //       ],
                              //     ),
                              //     Column(
                              //       children: [
                              //         Text("1.25KWH",
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(35))),
                              //         Text("Batas/Hari",
                              //             style: GoogleFonts.quantico(
                              //                 color: Color.fromARGB(
                              //                     255, 4, 117, 116),
                              //                 fontSize:
                              //                     ScreenUtil().setSp(25))),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                    bottom: ScreenUtil().setHeight(30)),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenUtil().setWidth(15)),
                                          child: InkWell(
                                            onTap: () {
                                              print("object");
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Container(
                                                color: Colors.white,
                                                child: Image.asset(
                                                  "lib/assets/icons/horizontal.png",
                                                  scale: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: ScreenUtil().setWidth(15)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.asset(
                                                "lib/assets/icons/stats.png",
                                                scale: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Penggunaan Bulanan",
                                            style: GoogleFonts.quantico(
                                                color: Color.fromARGB(
                                                    255, 4, 117, 116),
                                                fontSize:
                                                    ScreenUtil().setSp(40))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // Horizontal ListView
                                height: 100,
                                child: ListView.builder(
                                  itemCount: 12,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    index += 1;
                                    return monthlyUsage(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                    bottom: ScreenUtil().setHeight(30)),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: ScreenUtil().setWidth(15)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.asset(
                                                "lib/assets/icons/horizontal.png",
                                                scale: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: ScreenUtil().setWidth(15)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.asset(
                                                "lib/assets/icons/stats.png",
                                                scale: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Penggunaan Harian",
                                            style: GoogleFonts.quantico(
                                                color: Color.fromARGB(
                                                    255, 4, 117, 116),
                                                fontSize:
                                                    ScreenUtil().setSp(40))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // Horizontal ListView
                                height: 100,
                                child: ListView.builder(
                                  itemCount: 30,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    index += 1;
                                    return dailyUsage(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              }
              return SafeArea(child: Text("null"));
            }),
      ),
    );
  }

  Widget inputData(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Submitß"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String title) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        print("object");
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Container(
        height: 200,
        width: 200,
        // color: Colors.blue,
        child: Center(
          child: MyTextFormField(
            maxLength: 15,
            validator: (String value) {
              if (value.isEmpty) {
                return "Isikan nama";
              }
              return null;
            },
            onSaved: (String value) {
              userData.nama = value.toUpperCase();
            },
            labelText: "Nama",
            textInputType: TextInputType.text,
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget profileData(int index, List inputProfile) {
    // inputProfile[0] = snapshot.data.apiKey;
    //             inputProfile[1] = snapshot.data.channelId;
    //             inputProfile[2] = snapshot.data.tarifKwh;
    List dataUser = ["Terpasang", "Batas/Bulan", "Batas/Hari", "Harga/KWH"];

    List dataDummy = ["450W", "45KWh", "1.25KWH", inputProfile[2].toString()];

    Color textColor = Color.fromARGB(255, 4, 117, 116);
    String _date = "Not set";
    String _time = "Not set";

    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
      child: Container(
        height: 50,
        width: 120,
        child: InkWell(
          onTap: () {
            print(index);

            DateTime startDate, endDate;

            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2000, 1, 1),
                maxTime: DateTime(2022, 12, 31),
                // onChanged: (date) {print('change $date');},
                onConfirm: (date) {
              String tanggal = date.toString().split(" ")[0];
              final today = DateTime.now();
              final confirm = date;
              startDate = date;
              endDate = startDate.add(Duration(days: 1));
              final difference = today.difference(confirm).inDays;

              DateTime data = date.add(Duration(days: 1));
              print(data);
              Map getData = {
                "startDate": startDate.toString().split(" ")[0],
                "endDate": endDate.toString().split(" ")[0]
              };

              getThinkspeakData(getData);
              // print('confirm $difference');
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          child: Card(
            // color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(dataDummy[index - 1],
                      style: GoogleFonts.quantico(
                          color: textColor, fontSize: ScreenUtil().setSp(30))),
                  Text(dataUser[index - 1],
                      style: GoogleFonts.quantico(
                          color: textColor, fontSize: ScreenUtil().setSp(25))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget monthlyUsage(int index) {
    List nameMonth = [
      "Januari",
      "Pebruari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "Nopember",
      "Desember",
    ];
    Random random = new Random();
    int randomNumber = (800 + random.nextInt(400)) * 30;
    double doubleRandomNumber = randomNumber / 1000;

    Color cardColor = Colors.white;
    Color textColor = Color.fromARGB(255, 4, 117, 116);

    if (doubleRandomNumber > 31) {
      cardColor = Colors.red;
      textColor = Colors.white;
    }

    String stringIndex = index.toString();
    if (index < 10) {
      stringIndex = "0" + stringIndex;
    }

    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
      child: Container(
        height: 100,
        child: Card(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(nameMonth[index - 1],
                    style: GoogleFonts.quantico(
                        color: textColor, fontSize: ScreenUtil().setSp(40))),
                Text("$doubleRandomNumber KWH",
                    style: GoogleFonts.quantico(
                        color: textColor, fontSize: ScreenUtil().setSp(35))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dailyUsage(int index) {
    Random random = new Random();
    int randomNumber = 800 + random.nextInt(400);
    double doubleRandomNumber = randomNumber / 1000;

    Color cardColor = Colors.white;
    Color textColor = Color.fromARGB(255, 4, 117, 116);

    if (doubleRandomNumber > 1) {
      cardColor = Colors.red;
      textColor = Colors.white;
    }

    String stringIndex = index.toString();
    if (index < 10) {
      stringIndex = "0" + stringIndex;
    }

    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
      child: Container(
        height: 100,
        child: Card(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(stringIndex,
                    style: GoogleFonts.quantico(
                        color: textColor, fontSize: ScreenUtil().setSp(40))),
                Text("$doubleRandomNumber KWH",
                    style: GoogleFonts.quantico(
                        color: textColor, fontSize: ScreenUtil().setSp(35))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
