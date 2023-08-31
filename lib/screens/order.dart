import 'package:flutter/material.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/screens/details.dart';

class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  bool isp = false;
  bool ism = false;
  bool isn = false;

  void switchtodetails() {
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => details()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'My Orders',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF6F6F6),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isp = !isp;
                      });
                    },
                    child: Text(
                      'Delivered',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: isp ? Colors.black : Color(0xffF6F6F6),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: isp ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        ism = !ism;
                      });
                    },
                    child: Text(
                      'Processing',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: ism ? Colors.black : Color(0xffF6F6F6),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: ism ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isn = !isn;
                      });
                    },
                    child: Text(
                      'Cancelled',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: isn ? Colors.black : Color(0xffF6F6F6),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: isn ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            listitem(),
            listitem(),
            listitem(),
          ],
        ));
  }

  listitem() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 347,
        height: 164,
        child: ListTile(
          shape: RoundedRectangleBorder(
            //<-- SEE HERE
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          tileColor: Color(0xff575454),
          title: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Order №1947034',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF6F6F6),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '05-12-2019',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Tracking number:  ',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  ),
                  Text(
                    'IW3475453455',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF6F6F6),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Quantity:  ',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF6F6F6),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Total Amount:  ',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  ),
                  Text(
                    "112",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF6F6F6),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      switchtodetails();
                    },
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: Color(0xffF6F6F6),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Delivered',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xff55D85A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
