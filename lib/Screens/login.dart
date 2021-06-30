import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stubus/Screens/register.dart';
import 'package:stubus/components/background.dart';
import 'package:stubus/Screens/forgot.dart';
import 'package:stubus/Screens/form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

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
                        onPressed: () => exit(
                            0), //SystemNavigator.pop(), //Navigator.of(context).pop(true),
                        child: new Text('Yes')),
                  ],
                ))) ??
        false;
  }

  String _mail;
  String _password;
  bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      Login();
    }
    ;
  }

  Future Login() async {
    var url = "https://buspassnivi.000webhostapp.com/login.php";
    var data = {
      "mailid": _mail,
      "password": _password,
    };

    print(data);
    var res = await http.post(url, body: data);

    if (res.statusCode == 200) {
      var message = jsonDecode(res.body);
      print(message);
    } else {
      print('Request failed with status : ${res.statusCode}.');
      Fluttertoast.showToast(msg: "Please check your connection!");
    }

    var dat = jsonDecode(res.body);
    String dataa = dat.toString();

    if (dataa == "Account not exists") {
      Fluttertoast.showToast(msg: "Account not exists");
    } else {
      if (dataa == "false") {
        Fluttertoast.showToast(msg: "Incorrect Password");
      } else {
        //var user = jsonDecode(res.body);
        Fluttertoast.showToast(msg: "Login successfully");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FormScreen(userid: dataa)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            key: scaffoldKey,
            body: Background(
              child: new Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA),
                              fontSize: 36),
                          textAlign: TextAlign.left,
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
                          validator: (val) =>
                              val.isEmpty ? 'Please enter password' : null,
                          onSaved: (val) => _password = val,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotScreen()))
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2661FA),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: RaisedButton(
                            onPressed: _submit,
                            //() {
                            //Navigator.push(
                            //  context,
                            //MaterialPageRoute(
                            //  builder: (context) => FormScreen()));
                            //},
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
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()))
                          },
                          child: Text(
                            "Don't Have an Account? Sign up",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2661FA)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
