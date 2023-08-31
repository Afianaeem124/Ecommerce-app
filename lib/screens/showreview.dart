import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'globals.dart';

class showreview extends StatefulWidget {
  const showreview({super.key});

  @override
  State<showreview> createState() => _showreviewState();
}

class _showreviewState extends State<showreview> {
  TextEditingController yourController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                'Rating&Reviews',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 15),
              Text(
                '4.3',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 5),
              Text(
                '23 ratings',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 15),
              Text(
                reviews.length.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: reviews.length, // Use the updated reviews list
                  itemBuilder: (context, index) {
                    final reviewData = reviews[index];
                    final double rating = reviewData['rating'];
                    final String reviewText = reviewData['reviewText'];

                    return Container(
                      width: 347,
                      height: 104,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        tileColor: Color(0xff333232),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rating: $rating',
                                  style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    fontSize: 12,
                                    color: Color(0xffF5F5F5),
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Add a star rating widget to display the rating
                                RatingBar.builder(
                                  initialRating: rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              reviewText,
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Stack(alignment: Alignment.bottomRight, children: [
                ElevatedButton(
                  onPressed: () {
                    bottomsheet();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffEF3651),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "  Write a review",
                      style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF5F5F5),
                      ),
                    ),
                  ),
                ),
              ]),
            ])));
  }

  void bottomsheet() {
    double rating = 0.0;
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'What is you rate?',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (newRating) {
                      setState(() {
                        rating = newRating;
                      });
                    },
                    unratedColor: Colors.grey, // Color for empty stars
                    updateOnDrag: true,
                    ignoreGestures: false,
                  ),
                  // RatingBar(
                  //   initialRating: rating,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemSize: 30,
                  //   ratingWidget: RatingWidget(
                  //       full: Icon(Icons.star, color: Colors.amber),
                  //       half: Icon(Icons.star_half, color: Colors.amber),
                  //       empty: Icon(Icons.star_border,
                  //           color: Color.fromARGB(255, 136, 135, 132))),
                  //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //   onRatingUpdate: (rating) {
                  //     print(rating);
                  //   },
                  // ),
                  Text(
                    'Please share your opinion\nabout the product',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: yourController,
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        color: Color(0xffF5F5F5)),
                    decoration: InputDecoration(
                      hintText: "Your review",
                      hintStyle: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 11,
                        color: Color(0xffABB4BD),
                      ),
                      fillColor: Color(0xff1D1D1D),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff979797))),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Add the review and rating to your data (e.g., review list)
                        Map<String, dynamic> reviewData = {
                          'rating': rating,
                          'reviewText': yourController.text,
                        };

                        reviews.add(reviewData);

                        // Clear the text field and reset the rating
                        yourController.clear();
                        rating = 0.0;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 327,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color(0xffEF3651),
                          borderRadius: BorderRadius.circular(25)),
                      alignment: Alignment.center,
                      child: Text(
                        "SEND REVIEW",
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF5F5F5)),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
