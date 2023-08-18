import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  //List<String> productImages = [];
  List<Map<String, dynamic>> productsList = [];
  List<String> productImages = [];

  @override
  void initState() {
    super.initState();
    fetchProduct();
    fetchProductImages();
  }

  Future<void> fetchProduct() async {
    final response = await http.get(
      Uri.parse("https://ecommerce.salmanbediya.com/products/tag/sale/getAll"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final products = jsonData['products'] as List<dynamic>;

      setState(() {
        productsList = List<Map<String, dynamic>>.from(products);
      });
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 196,
              width: 376,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/sbanner.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Text(
                        "Fashion ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ]),
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
                          "Sale",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Text(
                      "Super summer sale",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (Map<String, dynamic> product in productsList)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    product['image'],
                                    width: 148,
                                    height: 184,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Rating: ${product['rating']}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    product['name'],
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  Text(
                                    product['category']['name'],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    product['price'],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "New",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: Theme.of(context).textTheme.bodyText2,
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
        ));
  }
}
