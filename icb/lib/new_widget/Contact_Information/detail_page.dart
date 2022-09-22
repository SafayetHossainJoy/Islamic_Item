import 'package:flutter/material.dart';
import 'package:icb/new_widget/Contact_Information/Contact_Information_Model.dart';

class ContactDetail extends StatefulWidget {
  final String _appBarTitle;
  final Contact_Information _contact;

  ContactDetail(this._contact, this._appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ContactDetailState(this._contact, this._appBarTitle);
  }
}

class ContactDetailState extends State<ContactDetail> {
  final String _appBarTitle;
  Contact_Information _contact;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // use controllers to bind fields to value passed in
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  ContactDetailState(this._contact, this._appBarTitle);

  @override
  void initState() {
    super.initState();
    if (_appBarTitle == "Edit Contact") {
      _nameController.text = _contact.name;
      _phoneController.text = _contact.homePhone;
      _mobilePhoneController.text = _contact.mobilePhone;
      _addressController.text = _contact.address;
      _emailController.text = _contact.email;
      _notesController.text = _contact.notes;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _mobilePhoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _notesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return WillPopScope(
      onWillPop: () async {
        // For when user presses Back navigation button in device navigationBar (Android)
        _returnToHomePage(false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            _appBarTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 53, 177, 57),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _returnToHomePage(false);
              }),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _nameController,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        enabled: (_appBarTitle == 'Add Contact'),
                        // name is the key. can't change it. must delete and re-create.

                        style: textStyle,
                        decoration: _inputDecoration(textStyle!, "Name"),
                      ),
                    ),
                    // Home and Mobile Phones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 170,
                          height: 50,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 15.0, left: 6.0),
                            child: TextFormField(
                              controller: _phoneController,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: textStyle,
                              validator: (value) {
                                if (value!.length > 29) {
                                  return "Phone too long";
                                }
                                _contact.homePhone = _phoneController.text;
                                return null;
                              },
                              decoration:
                                  _inputDecoration(textStyle, "Home Phone"),
                            ),
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 50,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 15.0, right: 6.0),
                            child: TextFormField(
                              controller: _mobilePhoneController,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              style: textStyle,
                              validator: (value) {
                                if (value!.length > 29) {
                                  return "Phone too long";
                                }
                                _contact.mobilePhone =
                                    _mobilePhoneController.text;
                                return null;
                              },
                              decoration:
                                  _inputDecoration(textStyle, "Mobile Phone"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Email
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.length > 59) {
                            return 'Email must be less than 60 characters';
                          }
                          _contact.email = _emailController.text;
                          return null;
                        },
                        style: textStyle,
                        decoration: _inputDecoration(textStyle, "Email"),
                      ),
                    ),
                    // Address
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _addressController,
                        autocorrect: false,
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        validator: (value) {
                          if (value!.length > 254) {
                            return 'Address must be less than 255 characters';
                          }
                          _contact.address = _addressController.text;
                          return null;
                        },
                        style: textStyle,
                        decoration: _inputDecoration(textStyle, "Address"),
                      ),
                    ),
                    // Notes
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 6.0, right: 6.0),
                      child: TextFormField(
                        controller: _notesController,
                        autocorrect: false,
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        validator: (value) {
                          if (value!.length > 254) {
                            return 'Notes must be less than 255 characters';
                          }
                          _contact.notes = _notesController.text;
                          return null;
                        },
                        style: textStyle,
                        decoration: _inputDecoration(textStyle, "Notes"),
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      width: 990,
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
                        "Save",
                        style: TextStyle(
                            color: Color.fromARGB(255, 16, 53, 17),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(TextStyle textStyle, String text) {
    return InputDecoration(
        labelText: text,
        labelStyle: textStyle,
        errorStyle:
            TextStyle(color: Color.fromARGB(255, 40, 233, 130), fontSize: 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)));
  }

  void _returnToHomePage(bool refreshListDisplay) {
    Navigator.of(context).pop(refreshListDisplay);
  }
}

void showAlertDialog(BuildContext context, String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_) => alertDialog);
}

/*
onPressed: () {
                        setState(() {
                          if (_formKey.currentState.validate()) {}
                        });
                      },
                      */