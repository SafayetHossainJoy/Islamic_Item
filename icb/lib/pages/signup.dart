import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:icb/Core/custom_http_request.dart';
import 'package:icb/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icb/widget/custom_TextField.dart';
import 'package:icb/widget/widget.dart';

class RegistationPage extends StatefulWidget {
  const RegistationPage({Key? key}) : super(key: key);

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
      // I am connected to a wifi network.
    }
    showInToast("No Internet");
    return false;
  }

  getRegister() async {
    check().then((internet) async {
      if (internet != null && internet) {
        var map = Map<String, dynamic>();
        map["name"] = nameController.text.toString();
        map["email"] = emailController.text.toString();
        map["password"] = passwordController.text.toString();
        map["password_confirmation"] =
            confirmPasswordController.text.toString();
        var responce = await http.post(
            Uri.parse(
              "https://apihomechef.antopolis.xyz/api/admin/create/new/admin",
            ),
            body: map,
            headers: CustomHttpRequest.defaultHeader);
        print("${responce.body}");
        final data = jsonDecode(responce.body);
        if (responce.statusCode == 201) {
          showInToast("Registation Successfull");
        } else {
          showInToast("Registation failed");
        }
      } else {
        showInToast("No Internet Connection");
      }
    });
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (Colors.green),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.green,
                gradient: LinearGradient(
                  colors: [(Colors.green), Color.fromARGB(255, 214, 245, 202)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "images/logo-modified.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 49, 9),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: nameController,
              hintText: "Enter your name",
              prefixIcon: Icon(Icons.person),
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Enter your Email",
              prefixIcon: Icon(Icons.email),
            ),
            CustomTextField(
              controller: passwordController,
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.vpn_key),
            ),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: "Enter Confirm password",
              prefixIcon: Icon(Icons.vpn_key),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                getRegister();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 112, 235, 116),
                    Color.fromARGB(255, 214, 245, 202)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                  "REGISTER",
                  style: TextStyle(
                      color: Color.fromARGB(255, 16, 53, 17),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have Already Member?  "),
                  GestureDetector(
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
