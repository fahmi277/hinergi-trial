import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hinergi_kwh_meter/view/formField.dart';
import 'package:hinergi_kwh_meter/view/mainScreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

final _formKey = GlobalKey<FormState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          // appBar: AppBar(),
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(60),
                            // top: ScreenUtil().setHeight(180)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'lib/assets/images/logohinergi.jpg',
                              scale: 6,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MyTextFormField(
                                onSaved: (String value) {
                                  print(value);
                                },
                                // icon: Icon(Icons.verified_user_rounded),
                                // hintText: "Misal : Fahmi",
                                labelText: "Nama",
                                textInputType: TextInputType.text,
                              ),
                              MyTextFormField(
                                  onSaved: (String value) {
                                    print(value);
                                  },
                                  // icon: Icon(Icons.lock),
                                  // hintText: "Masukkan Password",
                                  labelText: "Password",
                                  textInputType: TextInputType.number),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                          child: RaisedButton(
                            textColor: Colors.white,
                            //rgb(4, 117, 116)
                            color: Color.fromARGB(255, 4, 117, 116),
                            onPressed: () {
                              _formKey.currentState.save();
                            },
                            child: Text("MASUK"),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                          child: OutlineButton(
                            // textColor: Colors.blue,
                            textColor: Color.fromARGB(255, 4, 117, 116),
                            color: Color(0xFF6200EE),
                            onPressed: () {
                              _formKey.currentState.save();
                            },
                            child: Text(
                              "Belum punya akun, klik disini",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
        ));
  }
}
