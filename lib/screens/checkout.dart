import 'package:ecommerce/screens/addshipping.dart';
import 'package:ecommerce/screens/success.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class PaymentCard {
  final String cardNumber;
  final String nameOnCard;
  final String expireDate;
  final String cvv;
  final bool isDefault;

  PaymentCard({
    required this.cardNumber,
    required this.nameOnCard,
    required this.expireDate,
    required this.cvv,
    this.isDefault = false,
  });
}

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedAddress = '';
  List<PaymentCard> paymentCards = [];

  bool isInformationComplete() {
    return selectedAddress.isNotEmpty && paymentCards.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Checkout',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              'Shipping Address',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 20),
            buildAddressTile(),
            SizedBox(height: 30),
            Text(
              'Payment',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            buildPaymentTile(_showAddCardBottomSheet),
            SizedBox(height: 20),
            Text(
              'Delivery method',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Image.asset('assets/fedex.png')),
                Expanded(child: Image.asset('assets/usps.png')),
                Expanded(child: Image.asset('assets/dhl.png')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Order:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Spacer(),
                Text(
                  '$total\$',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (isInformationComplete()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Success()),
                  );
                } else {
                  // Show an error message or dialog to inform the user.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Information'),
                        content: Text(
                            'Please provide both address and payment information.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
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
                  "SUBMIT ORDER",
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
      ),
    );
  }

  Widget buildAddressTile() {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Color(0xff333232),
      title: selectedAddress.isEmpty
          ? TextButton(
              child: Text(
                'Add Address',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                // Navigate to the address input screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShippingAddressInputPage(),
                  ),
                ).then((address) {
                  if (address != null) {
                    setState(() {
                      selectedAddress = address;
                    });
                  }
                });
              },
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedAddress,
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 14,
                    color: Color(0xffF6F6F6),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // Navigate to the address input screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShippingAddressInputPage(),
                      ),
                    ).then((address) {
                      if (address != null) {
                        setState(() {
                          selectedAddress = address;
                        });
                      }
                    });
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffEF3651),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildPaymentTile(Function(BuildContext) showAddCardBottomSheet) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Color(0xff333232),
      title: paymentCards.isEmpty
          ? TextButton(
              child: Text(
                'Add Card',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                showAddCardBottomSheet(
                    context); // Call the function with context
              },
            )
          : Row(
              children: [
                Image.asset('assets/card.png'),
                Text(
                  paymentCards[0].cardNumber,
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 14,
                    color: Color(0xffF6F6F6),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    showAddCardBottomSheet(
                        context); // Call the function with context
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffEF3651),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _showAddCardBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        String cardNumber = '';
        String nameOnCard = '';
        String expireDate = '';
        String cvv = '';

        // Wrap the SingleChildScrollView around your content
        return SingleChildScrollView(
          // Add a `Padding` widget to provide space at the bottom for the keyboard
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20, // Add top padding to create space
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  20, // Adjust for keyboard
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add new card',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                txt("Name on card", onChanged: (text) {
                  nameOnCard = text;
                }),
                SizedBox(height: 10),
                txt("Card number", onChanged: (text) {
                  cardNumber = text;
                }),
                SizedBox(height: 10),
                txt("Expire Date", onChanged: (text) {
                  expireDate = text;
                }),
                SizedBox(height: 10),
                txt("CVV", onChanged: (text) {
                  cvv = text;
                }),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/checkbox.png'),
                    SizedBox(height: 3),
                    Text(
                      '   Set as default payment method ',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  // Change from InkWell to GestureDetector
                  onTap: () {
                    // Validate and save the card information
                    if (cardNumber.isNotEmpty &&
                        nameOnCard.isNotEmpty &&
                        expireDate.isNotEmpty &&
                        cvv.isNotEmpty) {
                      setState(() {
                        paymentCards.add(PaymentCard(
                          cardNumber: cardNumber,
                          nameOnCard: nameOnCard,
                          expireDate: expireDate,
                          cvv: cvv,
                          isDefault: false, // You can change this as needed
                        ));
                      });
                      // Close the bottom sheet
                      Navigator.pop(context);
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
                      "ADD CARD",
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
      },
    );
  }

  Widget txt(String text, {ValueChanged<String>? onChanged}) {
    return TextField(
      style: TextStyle(
        fontFamily: 'Metropolis',
        fontSize: 14,
        color: Color(0xffF5F5F5),
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Border color when focused
          ),
        ),
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 11,
          color: Color(0xffABB4BD),
        ),
        fillColor: Color(0xff1D1D1D),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff979797)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
