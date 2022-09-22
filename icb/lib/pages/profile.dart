import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:icb/Screen/HomeScreen.dart';
import 'package:icb/widget/brand_colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObsecure = true;

  var _image;
  ImagePicker _picker = ImagePicker();
  chooseImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Choose Image from"),
            children: [
              SimpleDialogOption(
                child: Text("Choose from Gallery"),
                onPressed: () {
                  chooseImageFromGallery();
                },
              ),
              SimpleDialogOption(
                child: Text("Choose from Camera"),
                onPressed: () {
                  chooseImageFromCamera();
                },
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  chooseImageFromGallery() async {
    var pickImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickImage!.path);
    });
    Navigator.of(context).pop();
  }

  chooseImageFromCamera() async {
    var pickImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickImage!.path);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Colors.green,
                    gradient: LinearGradient(
                      colors: [
                        (Colors.green),
                        Color.fromARGB(255, 214, 245, 202)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.bottomLeft,
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                        Center(
                            child: Text(
                          "Complete Your Profiles",
                          style: myStyle(20, aTextColor),
                        )),
                        InkWell(
                          onTap: () {
                            chooseImage();
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey)),
                                  child: Container(
                                      margin: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: _image != null
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage:
                                                  NetworkImage(_image.path),
                                            )
                                          : IconButton(
                                              icon: Icon(Icons.camera),
                                              onPressed: () {
                                                chooseImage();
                                              },
                                            )),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                right: 120,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        Color.fromARGB(255, 112, 235, 116).withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 112, 235, 116), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 112, 235, 116),
                        width: 1,
                      ),
                    ),

                    labelText: "Enter Your Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your name",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        Color.fromARGB(255, 112, 235, 116).withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 112, 235, 116), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 112, 235, 116),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter Phone Number",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Phone Number",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Invalid Email";
                    } else if (!value.contains("com")) {
                      return "Invalid Email";
                    }
                  },
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        Color.fromARGB(255, 112, 235, 116).withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 112, 235, 116), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 112, 235, 116),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter your Email ",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObsecure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Required";
                    }

                    if (value.length > 15) {
                      return "Password is too long";
                    }

                    if (value.length < 3) {
                      return "Password is too short";
                    }
                  },
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        Color.fromARGB(255, 112, 235, 116).withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 112, 235, 116), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 112, 235, 116),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter your Password ",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: Icon(_isObsecure == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.black54,
                    ),
                    //prefixIcon: Icon(Icons.lock),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Password",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 50, right: 80, top: 40),
                    padding: EdgeInsets.only(left: 50, right: 70),
                    height: 54,
                    width: 450,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 112, 235, 116),
                            Color.fromARGB(255, 214, 245, 202)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Color.fromARGB(255, 16, 53, 17),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
