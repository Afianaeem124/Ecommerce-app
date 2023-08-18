import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool state = false;
  bool st = false;
  bool te = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Settings",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Personal Information",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          color: Color(0xffF5F5F5)),
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        floatingLabelStyle: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff979797)),
                        fillColor: Color(0xff1D1D1D),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797))),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          color: Color(0xffF5F5F5)),
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        hintStyle: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 11,
                          color: Color(0xffABB4BD),
                        ),
                        fillColor: Color(0xff1D1D1D),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797))),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF6F6F6)),
                          textAlign: TextAlign.right,
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.black,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 400,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Password Change',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            txt("Old Password"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                Text(
                                                  'Forgot Password?  ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                  textAlign: TextAlign.end,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            txt("New Password"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            txt("Repeat New Password"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: 327,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEF3651),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "SAVE PASSWORD",
                                                style: TextStyle(
                                                    fontFamily: 'Metropolis',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffF5F5F5)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              "change",
                              style: Theme.of(context).textTheme.bodyText2,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          color: Color(0xffF5F5F5)),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 11,
                          color: Color(0xffABB4BD),
                        ),
                        fillColor: Color(0xff1D1D1D),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF6F6F6)),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sales",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: state,
                          onChanged: (value) {
                            state = value;
                            setState(
                              () {},
                            );
                          },
                          thumbColor: Color(0xff1cf870),
                          activeColor: Color(0xff50956e),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "New arrivals",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: st,
                          onChanged: (value) {
                            st = value;
                            setState(
                              () {},
                            );
                          },
                          thumbColor: Color(0xff1cf870),
                          activeColor: Color(0xff50956e),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery status changes",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: te,
                          onChanged: (value) {
                            te = value;
                            setState(
                              () {},
                            );
                          },
                          thumbColor: Color(0xff1cf870),
                          activeColor: Color(0xff50956e),
                          trackColor: Color(0xff5f6461),
                        ),
                      ],
                    ),
                  ],
                ))));
  }

  txt(String text) {
    return TextField(
      style: TextStyle(
          fontFamily: 'Metropolis', fontSize: 14, color: Color(0xffF5F5F5)),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 11,
          color: Color(0xffABB4BD),
        ),
        fillColor: Color(0xff1D1D1D),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff979797))),
      ),
    );
  }
}
