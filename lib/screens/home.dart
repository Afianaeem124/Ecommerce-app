import 'dart:convert';

import 'package:ecommerce/screens/sale.dart';
import 'package:ecommerce/screens/top.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> productImages = [];

  @override
  void initState() {
    super.initState();
    fetchProductImages();
  }

  Future<void> fetchProductImages() async {
    final response = await http.get(
      Uri.parse("https://ecommerce.salmanbediya.com/products/tag/new/getAll"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final products = jsonData['products'] as List<dynamic>;

      setState(() {
        productImages = products
            .map<String>((product) => product['image'] as String)
            .toList();
      });
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }
  }

  void switchtosales() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => sales()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 460,
            width: 376,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/banner.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 250),
                  Text(
                    "Fashion ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "Sale ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      switchtosales();
                    },
                    child: Container(
                      width: 160,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xffEF3651),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Check",
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        "New",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(this.context,
                              MaterialPageRoute(builder: (context) => Top()));
                        },
                        child: Text(
                          "View all",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "You’ve never seen it before!",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (String imageUrl in productImages)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.network(
                              imageUrl,
                              width: 148,
                              height: 184,
                              fit: BoxFit.cover,
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
      ),
    );
  }
}
