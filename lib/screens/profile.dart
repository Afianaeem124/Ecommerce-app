import 'package:ecommerce/screens/order.dart';
import 'package:ecommerce/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const home());

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Myprofile(),
    );
  }
}

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  void switchtoorder() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => order()));
  }

  void switchtosettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => settings()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: ListView(
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "My profile",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF6F6F6),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/icon.png"),
                    //const SizedBox(height: 60),
                  ),
                  Column(
                    children: [
                      Text(
                        "Matilda Brown",
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF6F6F6),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          'matildabrown@mail.com',
                          style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: 11,
                            color: Color(0xffABB4BD),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ListTile(
                title: Text(
                  'My Orders',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF6F6F6),
                  ),
                ),
                subtitle: Text(
                  'Already have 12 orders',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 11,
                    color: Color(0xffABB4BD),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.chevron_right, color: Color(0xffABB4BD)),
                  onPressed: () {
                    setState(() {
                      switchtoorder();
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              listitem('Shipping addresses', '3 ddresses'),
              const SizedBox(height: 10),
              listitem('Payment methods', 'Visa  **34'),
              const SizedBox(height: 10),
              listitem('Promocodes', 'You have special promocodes'),
              const SizedBox(height: 10),
              listitem('My reviews', 'Reviews for 4 items'),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF6F6F6),
                  ),
                ),
                subtitle: Text(
                  'Notifications, password',
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 11,
                    color: Color(0xffABB4BD),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.chevron_right, color: Color(0xffABB4BD)),
                  onPressed: () {
                    setState(() {
                      switchtosettings();
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }

  listitem(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xffF6F6F6),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: 'Metropolis',
          fontSize: 11,
          color: Color(0xffABB4BD),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.chevron_right, color: Color(0xffABB4BD)),
        onPressed: () {},
      ),
    );
  }
}
