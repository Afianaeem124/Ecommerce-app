import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'screens/elogin.dart';
//import 'Screens/elogin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffF6F6F6),
          ),
          bodyText2: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 14,
            color: Color(0xffABB4BD),
          ),
          headline4: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xffF6F6F6),
          ),
          headline3: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xffF6F6F6),
          ),
        ),
      ),
      home: esignup(),
    );
  }
}

class esignup extends StatelessWidget {
  esignup({Key? key}) : super(key: key);
  var res;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future<void> postreg() async {
    http.Response response = await http.post(
        Uri.parse("https://ecommerce.salmanbediya.com/users/register"),
        body: {
          "name": namecontroller.text,
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
        });
    res = response.statusCode;

    print(response.statusCode);

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    void switchtoelogin() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => elogin()));
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
                  "Sign up",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 50),
                TextField(
                  style: GoogleFonts.metrophobic(
                      fontSize: 14, color: Color(0xffF5F5F5)),
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 11,
                      color: Color(0xffABB4BD),
                    ),
                    floatingLabelStyle: GoogleFonts.cambo(
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
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
                      "Already have an account?",
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
                        switchtoelogin();
                      },
                    )
                  ],
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    // switchtotodopage();
                    if (emailcontroller.text.isNotEmpty &&
                        namecontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      await postreg();
                      if (res == 201) {
                        switchtoelogin();
                      }
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
                      "SIGN UP",
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
