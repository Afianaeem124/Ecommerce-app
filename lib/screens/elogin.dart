import 'package:ecommerce/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'eforget.dart';

class elogin extends StatelessWidget {
  elogin({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> putlog() async {
    http.Response response = await http.put(
        Uri.parse("https://ecommerce.salmanbediya.com/users/login"),
        body: {
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
        });

    print(response.statusCode);

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    void switchtoeforget() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => eforget()));
    }

    void switchtosearch() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => search()));
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF6F6F6),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 50),
                TextField(
                  style: GoogleFonts.metrophobic(
                      fontSize: 14, color: Color(0xffF5F5F5)),
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
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
                const SizedBox(height: 10),
                TextField(
                  style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffF5F5F5)),
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                    fillColor: Color(0xff1D1D1D),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffF6F6F6)),
                      textAlign: TextAlign.right,
                    ),
                    IconButton(
                      icon: Image.asset(
                          'assets/arrow.png'), // Use Image.asset instead of Icon
                      onPressed: () {
                        switchtoeforget();
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    // switchtotodopage();
                    if (emailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      await putlog();
                      switchtosearch();
                    } else {
                      print("fill up the text feilds");
                    }
                  },
                  child: Container(
                    width: 327,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Color(0xffEF3651),
                        borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffF5F5F5)),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Text(
                    "Or sign up with social account",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffF6F6F6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Google.png",
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      "assets/Facebook.png",
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
