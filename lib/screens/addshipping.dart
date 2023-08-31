import 'package:flutter/material.dart';

import 'globals.dart';

class ShippingAddressInputPage extends StatefulWidget {
  const ShippingAddressInputPage({Key? key}) : super(key: key);

  @override
  State<ShippingAddressInputPage> createState() =>
      _ShippingAddressInputPageState();
}

class _ShippingAddressInputPageState extends State<ShippingAddressInputPage> {
  bool isFormFilled = false;
  void validateForm() {
    setState(() {
      isFormFilled = fullName.isNotEmpty &&
          address.isNotEmpty &&
          city.isNotEmpty &&
          province.isNotEmpty &&
          zipCode.isNotEmpty &&
          country.isNotEmpty;
    });
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Adding Shipping Address',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 14,
                color: Color(0xffF5F5F5)),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
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
            onChanged: (value) {
              setState(() {
                fullName = value;
              });
              validateForm();
            },
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
              hintText: "Address",
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
            onChanged: (value) {
              setState(() {
                address = value;
              });
              validateForm();
            },
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
              hintText: "City",
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
            onChanged: (value) {
              setState(() {
                city = value;
              });
              validateForm();
            },
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
              hintText: "State/Province/Region",
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
            onChanged: (value) {
              setState(() {
                province = value;
              });
              validateForm();
            },
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
              hintText: "Zip Code (Postal Code)",
              hintStyle: Theme.of(context).textTheme.bodyText2,
              floatingLabelStyle: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfffefdfd)),
              fillColor: Color(0xff1D1D1D),
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff979797))),
            ),
            onChanged: (value) {
              setState(() {
                zipCode = value;
              });
              validateForm();
            },
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black, // Border color when focused
                ),
              ),
              hintText: "Country",
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
            onChanged: (value) {
              setState(() {
                country = value;
              });
              validateForm();
            },
          ),
          SizedBox(height: 27),
          GestureDetector(
            onTap: () {
              if (isFormFilled) {
                // Validate and save the address
                final completeAddress =
                    '$fullName\n\n$address\n$city,$province  $zipCode,$country';

                // Send the complete address back to the previous page
                Navigator.pop(context, completeAddress);
              } else {
                // Show an error dialog with a custom error message
                showErrorDialog(context, "Please fill in all fields.");
              }
            },
            child: Container(
              width: 327,
              height: 48,
              decoration: BoxDecoration(
                  color: isFormFilled
                      ? Color(0xffEF3651)
                      : Colors.grey, // Disable button if form is not filled
                  borderRadius: BorderRadius.circular(25)),
              alignment: Alignment.center,
              child: Text(
                "SAVE ADDRESS",
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
    );
  }
}
