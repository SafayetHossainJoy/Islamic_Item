import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icb/Screen/NavigationScreen.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => BottomNav())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 247, 159),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo-modified.png",
                height: 150,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "ইসলামিক আইটেম বাংলাদেশ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              SpinKitSpinningLines(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
