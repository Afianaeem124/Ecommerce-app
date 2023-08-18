import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class eforget extends StatelessWidget {
  eforget({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                "Forgot password",
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffF6F6F6),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 50),
              Text(
                "Please, enter your email address. You will receive a link to create a new password via email.",
                style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 14,
                    color: Color(0xffF6F6F6)),
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
                    color: Color(0xffFF2424),
                  ),
                  fillColor: Color(0xff1D1D1D),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFF2424))),
                ),
              ),

              Text(
                "Not a valid email address. Should be your@email.com",
                style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 11,
                    color: Color(0xffFF2424)),
                textAlign: TextAlign.center,
              ),

              //const SizedBox(height: 10),

              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  // switchtotodopage();
                  //if (emailcontroller.text.isNotEmpty ) {
                  //  await putlog();
                  // } else {
                  //   print("fill up the text feilds");
//}
                },
                child: Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffEF3651),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    "SEND",
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF5F5F5)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
