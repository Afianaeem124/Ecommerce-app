import 'package:ecommerce/screens/top.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<Map<String, dynamic>> productsList = [];

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/category/getAll"));
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final categories = jsonData['categories'] as List<dynamic>;

      setState(() {
        productsList = List<Map<String, dynamic>>.from(categories);
      });
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }
  }

  void switchtotop() {
    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => Top()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Categories',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  switchtotop();
                },
                child: Container(
                  width: 340,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xffEF3651),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "VIEW ALL ITEMS",
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffF5F5F5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 240),
              child: Text(
                "Choose category",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    final category = productsList[index];
                    print("Category name: ${category['name']}");

                    return Column(
                      children: [
                        ListTile(
                          tileColor: Colors.black,
                          leading: Text(
                            category['name'],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          onTap: () {
                            switchtotop();
                          },
                        ),
                        Divider(
                            color: Color(0xffABB4BD), endIndent: 0, indent: 0),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
