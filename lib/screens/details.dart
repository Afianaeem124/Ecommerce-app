import 'package:flutter/material.dart';

class details extends StatefulWidget {
  details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  bool isp = false;

  bool isl = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Order Details",
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffF6F6F6),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '3 items',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF6F6F6),
                      ),
                    ),
                  ]),
            ),
            listitem(),
            listitem(),
            listitem(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Details",
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Shipping Address: ',
                            style: Theme.of(context).textTheme.bodyText2),
                        Expanded(
                          child: Text(
                              '3 Newbridge Court ,Chino Hills, CA 91709, United States',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Payment method:  ',
                            style: Theme.of(context).textTheme.bodyText2),
                        Image.asset("assets/card.png"),
                        Expanded(
                          child: Text('  **** **** **** 3947 ',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Delivery method:  ',
                            style: Theme.of(context).textTheme.bodyText2),
                        Expanded(
                          child: Text('FedEx, 3 days, 15',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Discount:       ',
                            style: Theme.of(context).textTheme.bodyText2),
                        Expanded(
                          child: Text('      10%, Personal promo code',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Total Amount:   ',
                            style: Theme.of(context).textTheme.bodyText2),
                        Expanded(
                          child: Text('    133',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 160.0,
                            height: 36.0,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  isp = !isp;
                                });
                              },
                              child: Text(
                                'Reorder',
                                style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontSize: 14,
                                  color: Color(0xffF6F6F6),
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    isp ? Colors.red : Colors.black,
                                side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 160.0,
                            height: 36.0,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  isl = !isl;
                                });
                              },
                              child: Text(
                                'Leave feedback',
                                style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontSize: 14,
                                  color: Color(0xffF6F6F6),
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    isl ? Colors.red : Colors.black,
                                side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  listitem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        width: 347,
        height: 108,
        child: ListTile(
          shape: RoundedRectangleBorder(
            //<-- SEE HERE
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          tileColor: Color(0xff333232),
          leading: Image.asset("assets/photo.png"),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Pullover',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF6F6F6),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mango',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 14,
                  color: Color(0xffABB4BD),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Color: Gray    ',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  ),
                  Text(
                    'Size: L',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      color: Color(0xffABB4BD),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Units: 1',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: Color(0xffABB4BD),
                      )),
                  Spacer(),
                  Text('51',
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF6F6F6),
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
