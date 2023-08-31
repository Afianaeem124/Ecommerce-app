import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/bags.png'),
              SizedBox(
                height: 30,
              ),
              Text(
                'Order:',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your order will be delivered soon.\nThank you for choosing our app!',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffEF3651),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    "CONTINUE SHOPPING",
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
