import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icb/Screen/NavigationScreen.dart';
import 'package:icb/widget/custom_TextField.dart';

class Massage extends StatefulWidget {
  const Massage({Key? key}) : super(key: key);

  @override
  State<Massage> createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (Colors.green),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
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
                      "Massage",
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
              controller: _notesController,
              hintText: "Enter your Massage",
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {},
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
                child: InkWell(
                  onTap: () {
                    final snackBar = SnackBar(content: Text("send Successful"));
                    //Scaffold.of(context).showSnackBar(snackBar);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(
                        color: Color.fromARGB(255, 16, 53, 17),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
