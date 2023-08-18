import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27),
        child: ListView(
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
                onTap: () {},
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
            Text(
              "Choose category",
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.start,
            ),
            ListTile(
              tileColor: Colors.black,
              leading: Text(
                'Tops',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onTap: () {},
            ),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Shirts & Blouses'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Cardigans & Sweaters'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Knitwear'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv(''),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Outerwear'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Pants'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Jeans'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Shorts'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Skirts'),
            Divider(color: Color(0xffABB4BD), endIndent: 0, indent: 0),
            listv('Dresses'),
          ],
        ),
      ),
    );
  }

  listv(String txt) {
    return ListTile(
      tileColor: Colors.black,
      leading: Text(
        txt,
        style: Theme.of(context).textTheme.bodyText2,
      ),

      //onTap: () {},
    );
  }
}
