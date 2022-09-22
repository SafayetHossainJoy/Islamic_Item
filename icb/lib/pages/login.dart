import 'dart:convert';
import 'package:icb/Screen/NavigationScreen.dart';
import 'package:icb/Screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icb/pages/signup.dart';
import 'package:icb/widget/custom_TextField.dart';
import 'package:icb/widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  SharedPreferences? sharedPreferences;
  String? token;
  String loginLlink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";

  isLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences!.getString("token");
    if (token!.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNav()));
    } else {
      print("token is null");
    }
  }

  getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var map = Map<String, dynamic>();
    map["email"] = emailController.text.toString();
    map["password"] = passwordController.text.toString();
    var responce = await http.post(
      Uri.parse(loginLlink),
      body: map,
    );
    final data = jsonDecode(responce.body);
    print("Successfull$data");
    if (responce.statusCode == 200) {
      setState(() {
        sharedPreferences!.setString("token", data["access_token"]);
      });
      token = sharedPreferences!.getString("token");
      print("Token Saved $token");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNav()));
      showInToast("Login Succesfull");
    } else {
      showInToast("Login Failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    isLogin();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (Colors.green),
        leading: InkWell(onTap: () {}, child: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300,
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
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 30, 49, 9),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20,
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
          MaterialButton(
            onPressed: () {
              getLogin();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
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
                "LOGIN",
                style: TextStyle(
                    color: Color.fromARGB(255, 16, 53, 17),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?  "),
                  GestureDetector(
                    child: Text(
                      "Register Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistationPage(),
                          ));
                    },
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
