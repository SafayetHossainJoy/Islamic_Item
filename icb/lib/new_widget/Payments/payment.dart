import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:icb/new_widget/Contact_Information/Contact_Information_Model.dart';
import 'package:icb/new_widget/Contact_Information/detail_page.dart';
import 'package:icb/new_widget/Payments/checkout_order_details.dart';

class paymentpage extends StatefulWidget {
  const paymentpage({Key? key}) : super(key: key);

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Checkout'),
        backgroundColor: Color.fromARGB(255, 53, 177, 57),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /*Text(
                            'Shipping Address:\n Name:Safayet Hossain\nAddress:Banashree Dhaka-1219',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),*/
                          InkWell(
                            onTap: () {
                              _showDetailPage(
                                  Contact_Information("", "", "", "", "", ""),
                                  "Add Shipping Address");
                            },
                            child: Text(
                              'Change',
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        color: Colors.redAccent,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.redAccent,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              RadioButtonGroup(
                labels: [
                  'Card',
                  'SLL',
                ],
                onSelected: (String label) => (selected) {},
              ),
              /* Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png',
                        fit: BoxFit.cover,
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Text('**** **** **** 2718'),
                ],
              ),*/
              const SizedBox(height: 24.0),
              Text(
                'Delivery method',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8.0),
              CheckoutOrderDetails(),
              const SizedBox(height: 32.0),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 20, right: 25, top: 20),
                padding: EdgeInsets.only(left: 20, right: 25),
                height: 54,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 112, 235, 116),
                    Color.fromARGB(255, 214, 245, 202)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(25),
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
                    _showSnackBar(context, "Payment Successful");
                  },
                  child: Text(
                    "Submit Order",
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
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    //Scaffold.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showDetailPage(Contact_Information contact, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContactDetail(contact, title);
    }));

    if (result == true) {}
  }
}

class DeliveryMethod {}

class DeliveryMethodItem {}
