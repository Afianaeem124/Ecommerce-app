import 'package:ecommerce/screens/info.dart';
import 'package:ecommerce/screens/showreview.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'globals.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Top extends StatefulWidget {
  const Top({Key? key}) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  List<Map<String, dynamic>> productsList = [];
  List<Map<String, dynamic>> producList = [];

  @override
  void initState() {
    super.initState();
    fetchproduct();
    fetchProd();
  }

  Future<void> fetchproduct() async {
    final response = await http
        .get(Uri.parse("https://ecommerce.salmanbediya.com/products/getAll"));
    if (response.statusCode == 200) {
      final spot = jsonDecode(response.body);
      final product = spot['products'] as List<dynamic>;

      setState(() {
        productsList = List<Map<String, dynamic>>.from(product);
      });
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }
  }

  Future<void> fetchProd() async {
    final response = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/category/getAll"));
    print(response.statusCode);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final categories = jsonData['categories'] as List<dynamic>;

      setState(() {
        producList = List<Map<String, dynamic>>.from(categories);
      });
    } else {
      print("API request failed with status code: ${response.statusCode}");
    }
  }

  void switchtoinfo(Map<String, dynamic> products) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Productinfo(product: products)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'All items',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            Container(
              height: 50, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: producList.length,
                itemBuilder: (context, index) {
                  final category = producList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        category['name'],
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      bottomshett();
                    }),
                Text(
                  selectedFilter,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  final produ = productsList[index];

                  int findex = favourites
                      .indexWhere((element) => element["id"] == produ["id"]);

                  return Container(
                    child: ListTile(
                      onTap: () {
                        switchtoinfo(produ);
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: Color(0xff333232),
                      leading: Image.network(
                        produ['image'],
                        width: 104,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            produ['category']['name'] ?? 'Name not available',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            produ['name'] ?? 'Name not available',
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to the ShowReview screen here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            showreview()), // Replace ShowReview with your target screen
                                  );
                                },
                                child: RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: double.tryParse(
                                          produ['rating']?.toString() ?? '0') ??
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
                                    setState(() {});
                                  },
                                ),
                              ),
                              Text(
                                produ['rating']?.toString() ??
                                    'Rating not available',
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${produ['price']}',
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.start,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    print(findex);

                                    if (findex != -1) {
                                      setState(() {
                                        favourites.removeAt(findex);
                                      });
                                    } else {
                                      setState(() {
                                        favourites.add(produ);
                                      });
                                    }
                                  },
                                  icon: findex != -1
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : Icon(Icons.favorite_border_outlined))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
                      'Sort by',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      'Popular',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.redAccent; //<-- SEE HERE
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'Popular';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      child: Text(
                        'Newest',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.redAccent; //<-- SEE HERE
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'Newest';
                        });
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      child: Text(
                        'Customer review',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.redAccent; //<-- SEE HERE
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'Customer review';
                        });
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      child: Text(
                        'Price: lowest to high',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.redAccent; //<-- SEE HERE
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'Price: lowest to high';
                        });
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      child: Text(
                        'Price: highest to low',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.redAccent; //<-- SEE HERE
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'Price: highest to low';
                        });
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          );
        });
  }
}
