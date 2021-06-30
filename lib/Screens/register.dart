import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stubus/Screens/login.dart';
import 'package:stubus/components/background.dart';

Random random = new Random();

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text("Are you sure?"),
                  content: new Text("Do you want to exit"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: new Text('No')),
                    TextButton(
                        onPressed: () => exit(0), child: new Text('Yes')),
                  ],
                ))) ??
        false;
  }

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _username;
  String _mail;
  String _password;
  String _mobileno;

  bool _passwordVisible;
  int minNumber = 1000;
  int maxNumber = 9999;
  String countryCode = "+91";
  int randomNumber = random.nextInt(9999) + 1111;

  Future signin() async {
    var url = "https://buspassnivi.000webhostapp.com/register.php";
    var data = {
      "username": _username,
      "mailid": _mail,
      "mobileno": _mobileno,
      "password": _password,
    };

    //var body = json.encode(data);

    print(data);
    var res = await http.post(url, body: data);

    if (res.statusCode == 200) {
      var message = json.decode(res.body);
      print(message);
    } else {
      print('Request failed with status : ${res.statusCode}.');
      Fluttertoast.showToast(msg: "Please check your network connection");
    }

    var dat = jsonDecode(res.body);
    String dataa = dat.toString();
    print(dataa);

    if (dataa == "account already exists") {
      Fluttertoast.showToast(msg: "account exists! please login");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      if (dataa == "true") {
        Fluttertoast.showToast(msg: "Account created successfully");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "Oops! Something went wrong! Please try again later");
      }
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      signin();
    }
    ;
  }

  String validatemobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            key: scaffoldKey,
            body: Background(
                child: Form(
              key: formKey,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 32),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "UserName"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter name';
                        }
                        if (val.length < 3) {
                          return 'Name must be more than 2 character';
                        }
                        return null;
                      },
                      onSaved: (val) => _username = val,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Mail-id"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter name';
                        }
                        if (!val.contains('@gmail.com')) {
                          return 'Invalid mail-id';
                        }
                        return null;
                      },
                      onSaved: (val) => _mail = val,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Mobile no"),
                      validator: validatemobile,
                      //(val) =>
                      //val.length > 10 && !val.contains('a')? 'Enter 10 digit number' : null,
                      onSaved: (val) => _mobileno = val,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter password';
                        }
                        if (val.length < 6) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                      onSaved: (val) => _password = val,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: RaisedButton(
                        onPressed: _submit,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: size.width * 0.5,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: new LinearGradient(colors: [
                                Color.fromARGB(255, 255, 136, 34),
                                Color.fromARGB(255, 255, 177, 41)
                              ])),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "SIGN UP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
            ))));
  }
}
