import 'package:ecommerce/screens/showreview.dart';
import 'package:flutter/material.dart';

import 'globals.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Favourite extends StatefulWidget {
  Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _MyBagState();
}

class _MyBagState extends State<Favourite> {
  List<Map<String, dynamic>> producList = [];

  @override
  void initState() {
    super.initState();

    fetchProd();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Favorites',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 5,
              ),
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
                      itemCount: favourites.length,
                      itemBuilder: (context, index) {
                        final item = favourites[index];

                        return Container(
                            width: 347,
                            height: 104,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              tileColor: Color(0xff333232),
                              leading: Image.network(
                                item['image'],
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
                                    item['category']['name'] ??
                                        'Name not available',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Color: Black',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.start,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Size: $selectedSize',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  // Display the quantity
                                  Row(
                                    children: [
                                      Text(
                                        '\$${item['price']}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.start,
                                      ),
                                      Spacer(),
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
                                                  item['rating']?.toString() ??
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
                                        ),
                                      ),
                                      Text(
                                        item['rating']?.toString() ??
                                            'Rating not available',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      }))
            ],
          ),
          // You can display other product information here
        ));
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
