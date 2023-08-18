import 'dart:io';

import 'package:ecommerce/screens/bottombar.dart';
import 'package:flutter/material.dart';

class photos extends StatefulWidget {
  final File? selectedImage;
  const photos({Key? key, this.selectedImage}) : super(key: key);
  //const photos({super.key});

  @override
  State<photos> createState() => _photosState();
}

class _photosState extends State<photos> {
  void switchtoBottom() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Bottomnavigation()));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), switchtoBottom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              widget.selectedImage != null
                  ? Image.file(
                      widget.selectedImage!,
                      width: 240,
                      height: 240,
                      fit: BoxFit.cover,
                    )
                  : Text('No image selected.'),
              SizedBox(height: 50),
              Image.asset('assets/base.png'),
              Text('Finding similar results...',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
