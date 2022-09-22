import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icb/new_widget/listview.dart';
import 'package:icb/pages/drawer.dart';
import 'package:icb/pages/login.dart';
import 'package:icb/pages/signup.dart';
import 'package:icb/pages/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon CusIcon = Icon(Icons.search);
  Widget CusSearchBar = Text(
    "Islamic Item",
    style: TextStyle(color: Colors.black),
  );
  final divider = Divider(
    color: Colors.black,
  );
  //for slider
  final _imagePaths = [
    'images/mudi_islamic_item.jpg',
    'images/soaking_shoes_islamic_item.jpg',
    'images/soaking_shoes_islamic_item2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu))),
          elevation: 0,
          title: CusSearchBar,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 112, 235, 116),
              Color.fromARGB(255, 214, 245, 202)
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          )),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 3,
                            color: Colors.lightGreenAccent)
                      ],
                      shape: BoxShape.circle,
                      color: Colors.lightGreenAccent.shade100),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (this.CusIcon.icon == Icons.search) {
                          this.CusIcon = Icon(Icons.cancel);
                          this.CusSearchBar = TextField(
                            cursorColor: Colors.black,
                            cursorHeight: 20,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Item"),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          this.CusIcon = Icon(Icons.search);
                          this.CusSearchBar = Text(
                            "Islamic Item",
                            style: TextStyle(color: Colors.black),
                          );
                        }
                      });
                    },
                    icon: CusIcon,
                    color: Colors.black,
                    iconSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 3,
                                color: Colors.lightGreenAccent)
                          ],
                          shape: BoxShape.circle,
                          color: Colors.lightGreenAccent.shade100),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            dividerColor: Colors.black,
                            iconTheme: IconThemeData(color: Colors.black)),
                        child: PopupMenuButton<Menu>(
                            onSelected: (value) {
                              if (value == Menu.itemlogin) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                              } else if (value == Menu.itemsignup) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RegistationPage(),
                                ));
                              } else if (value == Menu.itemlogout) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<Menu>>[
                                  PopupMenuItem<Menu>(
                                    value: Menu.itemlogin,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text("Log In")
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem<Menu>(
                                    value: Menu.itemsignup,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.app_registration,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text("Sign Up")
                                      ],
                                    ),
                                  ),
                                  PopupMenuDivider(),
                                  PopupMenuItem<Menu>(
                                    value: Menu.itemlogout,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text("Sign Out")
                                      ],
                                    ),
                                  ),
                                ]),
                      )),
                )
              ],
            ),
          ],
        ),
        drawer: drawer(divider: divider),
        body: Container(
          child: ListView(
            children: [
              Custom_CarouselSlider(imagePaths: _imagePaths),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.04,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Populer',
                      style: GoogleFonts.roboto(
                          color: Color(0xff060608),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: GoogleFonts.roboto(
                          color: Color(0xffC7051A),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PopItemList(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.04,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'মুদি পণ্য',
                      style: GoogleFonts.roboto(
                          color: Color(0xff060608),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: GoogleFonts.roboto(
                          color: Color(0xffC7051A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PopItemList(),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.04,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'নতুন প্রোডাক্ট ',
                      style: GoogleFonts.roboto(
                          color: Color(0xff060608),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: GoogleFonts.roboto(
                          color: Color(0xffC7051A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PopItemList(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
