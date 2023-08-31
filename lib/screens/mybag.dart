import 'package:ecommerce/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class MyBag extends StatefulWidget {
  MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  List<int> productQuantities = [];
  List<double> individualProductPrices = [];

  @override
  void initState() {
    super.initState();
    // Initialize quantities based on the number of items in the cart
    productQuantities = List.generate(cartItems.length, (index) => 1);
    individualProductPrices = List.generate(cartItems.length,
        (index) => double.parse(cartItems[index]['price'].toString()));
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < cartItems.length; i++) {
      totalPrice += individualProductPrices[i] * productQuantities[i];
    }
    total = totalPrice;

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total price of items in the cart
    double totalPrice = calculateTotalPrice(); // Calculate the total price

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'My Bag',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  var quantity = productQuantities[index]; // Get the quantity
                  var productPrice =
                      individualProductPrices[index]; // Get the product price
// Calculate the individual product price based on quantity
                  var totalPriceForProduct = productPrice * quantity;
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
                              item['category']['name'] ?? 'Name not available',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Color: Black',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textAlign: TextAlign.start,
                                ),
                                Spacer(),
                                Text(
                                  'Size: $selectedSize',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    if (quantity > 1) {
                                      quantity -= quantity;
                                      // Decrement the quantity if greater than 1
                                      setState(() {
                                        productQuantities[index]--;
                                      });
                                    }
                                  },
                                ),
                                Text(quantity.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    quantity += quantity;

                                    // Increment the quantity
                                    setState(() {
                                      productQuantities[index]++;
                                    });
                                  },
                                ), // Display the quantity
                                Text(
                                  '\$${totalPriceForProduct.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // You can display other product information here
                      ));
                },
              ),
            ),
            SizedBox(height: 5),
            TextField(
              style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 14,
                  color: Color(0xffF5F5F5)),
              decoration: InputDecoration(
                hintText: "Enter your promo code",
                hintStyle: Theme.of(context).textTheme.bodyText2,
                fillColor: Color(0xff1D1D1D),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Total amount:', // Display total price

                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Spacer(),
                Text(
                  ' \$${totalPrice.toStringAsFixed(2)}', // Display total price

                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout()));
              },
              child: Container(
                width: 327,
                height: 48,
                decoration: BoxDecoration(
                    color: Color(0xffEF3651),
                    borderRadius: BorderRadius.circular(25)),
                alignment: Alignment.center,
                child: Text(
                  "CHECK OUT",
                  style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffF5F5F5)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
