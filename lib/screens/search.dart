import 'dart:io';

import 'package:ecommerce/screens/bottombar.dart';
import 'package:ecommerce/screens/photos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class search extends StatefulWidget {
  search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  File? iimage;

  Future pickimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    print("Salman");
    print(image?.name);
    //if (image == null) return;

    iimage = File(image!.path);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => photos(
                  selectedImage: iimage,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Visual search",
            style: TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xffF6F6F6),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "Search for an outfit by taking a photo or uploading an image",
                  style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffF6F6F6),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  File? image = await pickimage(ImageSource.camera);
                  if (image != null) {}
                },
                child: Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffEF3651),
                      //border: Border.all(color: Color(0xffF6F6F6)),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    "TAKE A PHOTO",
                    style: TextStyle(
                        fontFamily: 'Metropolis',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF5F5F5)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  File? im = await pickimage(ImageSource.gallery);
                  if (im != null) {}
                },
                child: Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Color(0xffEF3651),
                      // border: Border.all(color: Color(0xffF6F6F6)),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    "UPLOAD AN IMAGE",
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
      ),
    );
  }
}
