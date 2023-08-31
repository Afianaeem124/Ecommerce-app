import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/screens/globals.dart';

class eforget extends StatefulWidget {
  eforget({Key? key}) : super(key: key);

  @override
  _eforgetState createState() => _eforgetState();
}

class _eforgetState extends State<eforget> {
  TextEditingController emailcontroller = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  bool showError = false; // Track if there's an error

  // Replace with your valid email

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
                fontSize: 14,
                color: Color(0xffF5F5F5),
              ),
              controller: emailcontroller,
              focusNode: emailFocusNode, // Assign focus node
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 11,
                  color: Color(0xffABB4BD),
                ),
                fillColor: Color(0xff1D1D1D),
                filled: true,
                errorText: showError
                    ? "Not a valid email address"
                    : null, // Show error message
                errorStyle: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 11,
                  color: Color(0xffFF2424),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: showError
                        ? Color(0xffFF2424)
                        : Color.fromARGB(255, 12, 12, 12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: showError
                        ? Color(0xffFF2424)
                        : Color.fromARGB(255, 8, 8, 8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Check if the entered email matches the valid email
                if (emailcontroller.text == email) {
                  setState(() {
                    showError = false;
                  });
                  // Send the email
                } else {
                  setState(() {
                    showError = true;
                  });
                }
              },
              child: Container(
                width: 327,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xffEF3651),
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  "SEND",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF5F5F5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
