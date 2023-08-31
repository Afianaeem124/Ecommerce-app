import 'package:ecommerce/screens/addshipping.dart';
import 'package:ecommerce/screens/mybag.dart';
import 'package:ecommerce/screens/showreview.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'globals.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Productinfo extends StatefulWidget {
  final Map<String, dynamic> product;

  Productinfo({Key? key, required this.product}) : super(key: key);

  @override
  State<Productinfo> createState() => _ProductinfoState();
}

class _ProductinfoState extends State<Productinfo> {
  List<Map<String, dynamic>> productsList = [];

  @override
  void initState() {
    super.initState();
    fetchProduct();
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

  // Function to add or remove the product from favorites
  void toggleFavorite() {
    int findex = favourites
        .indexWhere((element) => element["id"] == widget.product["id"]);

    setState(() {
      if (findex != -1) {
        favourites.removeAt(findex);
      } else {
        favourites.add(widget.product);
      }
    });
  }

  void switchtoshipping() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ShippingAddressInputPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              widget.product['category']['name'],
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xffF6F6F6),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Display Product Image
                      Image.network(
                        widget.product['image'],
                        width: double.infinity, // Full width
                        height: 200, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 138,
                              child: OutlinedButton(
                                onPressed: () {
                                  bottomshett();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Size :$selectedSize',
                                      style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        fontSize: 14,
                                        color: Color(0xffF6F6F6),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Colors.white),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xffABB4BD)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 40,
                              width: 138,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Black',
                                      style: TextStyle(
                                        fontFamily: 'Metropolis',
                                        fontSize: 14,
                                        color: Color(0xffF6F6F6),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Colors.white),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Color(0xffABB4BD)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: toggleFavorite,
                              icon: Icon(
                                favourites.indexWhere((element) =>
                                            element["id"] ==
                                            widget.product["id"]) !=
                                        -1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Color.fromARGB(204, 172, 41, 41),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), // Space between image and text

                      // Display Product Name
                      Row(
                        children: [
                          Text(
                            widget.product['category']['name'],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Spacer(),
                          Text(
                            '\$${widget.product['price']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.product['name'],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigate to the showreview screen here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      showreview(), // Replace with your actual showreview screen
                                ),
                              );
                            },
                            child: RatingBar.builder(
                              initialRating: double.tryParse(
                                      widget.product['rating']?.toString() ??
                                          '0') ??
                                  0.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // Handle rating update if needed
                              },
                              unratedColor:
                                  Colors.grey, // Color for empty stars
                              updateOnDrag: true,
                            ),
                          ),
                          Text(
                            widget.product['rating']?.toString() ??
                                'Rating not available',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),

                      SizedBox(height: 15),
                      Text(
                        widget.product['description'],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          // Add the selected product to the cartItems list
                          setState(() {
                            globals.cartItems.add(widget.product);
                          });

                          // Navigate to the MyBag screen and pass the cartItems
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyBag(),
                            ),
                          );
                        },
                        child: Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Color(0xffEF3651),
                              borderRadius: BorderRadius.circular(25)),
                          alignment: Alignment.center,
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                                fontFamily: 'Metropolis',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffF5F5F5)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                          color: Color(0xffABB4BD), endIndent: 0, indent: 0),
                      listv('Shipping info', switchtoshipping),
                      Divider(
                          color: Color(0xffABB4BD), endIndent: 0, indent: 0),
                      listv('Support', switchtoshipping),
                      Divider(
                          color: Color(0xffABB4BD), endIndent: 0, indent: 0),

                      Container(
                        height: 300,
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "You can also like this",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Spacer(),
                                Text(
                                  "6 items",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (Map<String, dynamic> product
                                      in productsList)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                          Text(
                                            product['category']['name'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          Text(
                                            '\$${product['price']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]))));
  }

  listv(String txt, Function() onTapFunction) {
    return ListTile(
      tileColor: Colors.black,
      leading: Text(
        txt,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
      onTap: () {
        onTapFunction();
      },
    );
  }

  void bottomshett() {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Select size',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = 'XS';
                            Navigator.pop(context);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xffABB4BD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'XS',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = 'S';
                            Navigator.pop(context);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xffABB4BD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'S',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = 'M';
                            Navigator.pop(context);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xffABB4BD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'M',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = 'L';
                            Navigator.pop(context);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xffABB4BD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'L',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = 'XL';
                            Navigator.pop(context);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xffABB4BD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'XL',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            color: Color(0xffF6F6F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
                  SizedBox(height: 5),
                  TextButton(
                      child: Row(
                        children: [
                          Text(
                            'Size info',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right, color: Colors.white),
                        ],
                      ),
                      onPressed: () {}),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 327,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color(0xffEF3651),
                          borderRadius: BorderRadius.circular(25)),
                      alignment: Alignment.center,
                      child: Text(
                        "SAVE",
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
        });
  }
}
