import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stubus/Screens/instruction.dart';
import 'package:stubus/components/background.dart';

class FormScreen extends StatefulWidget {
  final String userid;
  FormScreen({Key key, @required this.userid}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {}

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
                            0), //SystemNavigator.pop(), // Navigator.of(context).pop(true),
                        child: new Text('Yes')),
                  ],
                ))) ??
        false;
  }

  Future Submit() async {
    var url = "https://buspassnivi.000webhostapp.com/form.php";
    var data = {
      "Userid": uid,
      "Name": name,
      "Department": dep,
      "Academic_year": acy,
      "Year": year,
      "User_from": from,
      "Bus_fees": bf,
      "Paid_fees": pf,
    };

    print(data);
    var res = await http.post(url, body: data);

    if (res.statusCode == 200) {
      var message = jsonDecode(res.body);
      print(message);
    } else {
      print('Request failed with status : ${res.statusCode}.');
      Fluttertoast.showToast(msg: "Please check your network connection");
    }

    var dat = jsonDecode(res.body);
    String dataa = dat.toString();

    if (dataa == "Your Form already submitted") {
      Fluttertoast.showToast(msg: "Your Form already submitted");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EndScreen(
                    formid: dataa,
                  )));
    } else {
      if (dataa == "false") {
        Fluttertoast.showToast(
            msg: "Oops! Something went wrong. Please try again later");
      } else {
        Fluttertoast.showToast(msg: "Form Submitted successfully");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EndScreen(
                      formid: dataa,
                    )));
      }
    }
  }

  String name;
  String dep;
  String acy;
  String year;
  String from;
  String bf = '0000';
  String pf = '0';
  String uid;

  int busfee() {
    if (from == 'Within Viralimalai') {
      bf = '9000';
    }
    if (from == 'Viralimalai Bypass') {
      bf = '9000';
    }
    if (from == 'Crawford') {
      bf = '9000';
    }
    if (from == 'Puthupatti') {
      bf = '9000';
    }
    if (from == 'Viralimalai') {
      bf = '9000';
    }
    if (from == 'Ramjinagar') {
      bf = '9000';
    }
    if (from == 'Vannankoil') {
      bf = '9000';
    }
    if (from == 'Mannarpuram') {
      bf = '9000';
    }
    if (from == 'TVS Tolgate') {
      bf = '9000';
    }
    if (from == 'Railway Junction') {
      bf = '9000';
    }
    if (from == 'Panjappur') {
      bf = '9000';
    }
    if (from == 'Kodumbalur') {
      bf = '12000';
    }
    if (from == 'Kovilpatti') {
      bf = '12000';
    }
    if (from == 'Court') {
      bf = '12000';
    }
    if (from == 'Puthur 4 Road') {
      bf = '12000';
    }
    if (from == 'Aruna Theatre') {
      bf = '12000';
    }
    if (from == 'Natchiyar Koil') {
      bf = '12000';
    }
    if (from == 'Woraiyur') {
      bf = '12000';
    }
    if (from == 'Kalaignar Arivalayam') {
      bf = '12000';
    }
    if (from == 'Senthaneerpuram') {
      bf = '12000';
    }
    if (from == 'Palpannai') {
      bf = '12000';
    }
    if (from == 'SIT') {
      bf = '12000';
    }
    if (from == 'Kattur') {
      bf = '12000';
    }
    if (from == 'Thiruverumbur') {
      bf = '12000';
    }
    if (from == 'Nambampatti') {
      bf = '12000';
    }
    if (from == 'Aandipatti') {
      bf = '12000';
    }
    if (from == 'Kalamraj Silai') {
      bf = '12000';
    }
    if (from == 'Manaparai') {
      bf = '12000';
    }
    if (from == 'Saravanapuram') {
      bf = '12000';
    }
    if (from == 'Pallakadu') {
      bf = '12000';
    }
    if (from == 'RT Malai') {
      bf = '12000';
    }
    if (from == 'Kavalkaranpatti') {
      bf = '12000';
    }
    if (from == 'Keelaveliyur') {
      bf = '12000';
    }
    if (from == 'Sathirapatti') {
      bf = '12000';
    }
    if (from == 'JJ Engg College') {
      bf = '12000';
    }
    if (from == 'Inamkulathur') {
      bf = '12000';
    }
    if (from == 'Anadavar Koil') {
      bf = '12000';
    }
    if (from == 'Pothametupatti') {
      bf = '12000';
    }
    if (from == 'Manaparai') {
      bf = '12000';
    }
    if (from == 'Sanjeevi nagar-Kollidam') {
      bf = '12000';
    }
    if (from == 'Periyar school') {
      bf = '12000';
    }
    if (from == 'Arasan Bakery') {
      bf = '12000';
    }
    if (from == 'LIC colony') {
      bf = '12000';
    }
    if (from == 'KK Nagar') {
      bf = '12000';
    }
    if (from == 'Airport') {
      bf = '12000';
    }
    if (from == 'Melapudur') {
      bf = '12000';
    }
    if (from == 'Market') {
      bf = '12000';
    }
    if (from == 'Singarathopu') {
      bf = '12000';
    }
    if (from == 'Chathiram Bus stand') {
      bf = '12000';
    }
    if (from == 'Subramaniyapuram') {
      bf = '12000';
    }
    if (from == 'Jail Corner') {
      bf = '12000';
    }
    if (from == 'Rice Mill') {
      bf = '12000';
    }
    if (from == 'Ponmalaipatti') {
      bf = '12000';
    }
    if (from == 'Kaikatti') {
      bf = '15000';
    }
    if (from == 'Valanadu') {
      bf = '15000';
    }
    if (from == 'Palakurichy') {
      bf = '15000';
    }
    if (from == 'Ammakulam') {
      bf = '15000';
    }
    if (from == 'Thuvarankurichy') {
      bf = '15000';
    }
    if (from == 'Srinivasanagar') {
      bf = '15000';
    }
    if (from == 'Uyyankondan Thirumalai') {
      bf = '15000';
    }
    if (from == 'Retta vaikal') {
      bf = '15000';
    }
    if (from == 'Nachikurichy') {
      bf = '15000';
    }
    if (from == 'BHEL Training centre') {
      bf = '15000';
    }
    if (from == 'Thuvakkudi') {
      bf = '15000';
    }
    if (from == 'Manjampatti') {
      bf = '15000';
    }
    if (from == 'Aatrupalam') {
      bf = '15000';
    }
    if (from == 'Vaiyampatti') {
      bf = '15000';
    }
    if (from == 'Alaganampatti') {
      bf = '15000';
    }
    if (from == 'Bommanayakanpatti') {
      bf = '15000';
    }
    if (from == 'Perur') {
      bf = '15000';
    }
    if (from == 'Neithalur Colony') {
      bf = '15000';
    }
    if (from == 'Viyalanmedu') {
      bf = '15000';
    }
    if (from == 'Kattanimedu') {
      bf = '15000';
    }
    if (from == 'Vadugapatti vilaku') {
      bf = '15000';
    }
    if (from == 'Pannankombu') {
      bf = '15000';
    }
    if (from == 'No.1 Tolgate') {
      bf = '15000';
    }
    if (from == 'Valadi') {
      bf = '15000';
    }
    if (from == 'Maanthurai') {
      bf = '15000';
    }
    if (from == 'Aangarai') {
      bf = '15000';
    }
    if (from == 'Lalgudi') {
      bf = '15000';
    }
    if (from == 'Poovalur By-pass') {
      bf = '15000';
    }
    if (from == 'Pullambadi') {
      bf = '15000';
    }
    if (from == 'Vadagarpettai') {
      bf = '15000';
    }
    if (from == 'Dalmiapuram') {
      bf = '15000';
    }
    if (from == 'Mathur') {
      bf = '15000';
    }
    if (from == 'Annanagar') {
      bf = '15000';
    }
    if (from == 'OFT') {
      bf = '15000';
    }
    if (from == 'Samayapuram') {
      bf = '15000';
    }
    if (from == 'Mannachanalur') {
      bf = '15000';
    }
    if (from == 'Ponmalai') {
      bf = '15000';
    }
    if (from == 'Ponamalai Sandhai') {
      bf = '15000';
    }
    if (from == 'Mariamman Kovil') {
      bf = '15000';
    }
    if (from == 'Mela Kalkandarkottai') {
      bf = '15000';
    }
    if (from == 'Keel Kalkandarkottai') {
      bf = '15000';
    }
  }

  Future _submit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      if (dep == null ||
          acy == null ||
          year == null ||
          from == null ||
          bf == null) {
        Fluttertoast.showToast(msg: "Please fill all the details");
        /*return (await showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                      title: new Text("Error"),
                      content: new Text("Please fill the details"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: new Text('Ok')),
                      ],
                    ))) ??
            false;

         */
      } else {
        Submit();
      }
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            key: scaffoldKey,
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Stack(children: <Widget>[
                      new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 40),
                              child: Text(
                                "BUSPASS FORM",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2661FA),
                                    fontSize: 28),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                decoration: InputDecoration(),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  if (val.length < 3) {
                                    return 'Name must be more than 2 character';
                                  }
                                  return null;
                                },
                                onSaved: (val) => name = val,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Department",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: DropdownButton(
                                hint: dep == null
                                    ? Text('Department')
                                    : Text(
                                        dep,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                items: [
                                  'CIVIL',
                                  'CSE',
                                  'ECE',
                                  'EEE',
                                  'IT',
                                  'MECHANICAL'
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    dep = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Academic Year",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: AlignmentDirectional.centerStart,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: DropdownButton(
                                hint: acy == null
                                    ? Text('Academic Year')
                                    : Text(
                                        acy,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                items: [
                                  '2017 - 2021',
                                  '2018 - 2022',
                                  '2019 - 2023',
                                  '2020 - 2024',
                                  '2021 - 2025',
                                  '2022 - 2026',
                                  '2023 - 2027',
                                  '2024 - 2028',
                                  '2025 - 2029'
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    acy = val;
                                    uid = widget.userid;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Year",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: AlignmentDirectional.centerStart,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: DropdownButton(
                                hint: year == null
                                    ? Text('Year')
                                    : Text(
                                        year,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                items: [
                                  '1st Year',
                                  '2nd Year',
                                  '3rd Year',
                                  '4th Year'
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    year = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "From",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: AlignmentDirectional.centerStart,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: DropdownButton(
                                hint: from == null
                                    ? Text('From')
                                    : Text(
                                        from,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                items: [
                                  'Within Viralimalai',
                                  'Viralimalai Bypass',
                                  'Crawford',
                                  'Puthupatti',
                                  'Viralimalai',
                                  'Ramjinagar',
                                  'Vannankoil',
                                  'Mannarpuram',
                                  'TVS Tolgate',
                                  'Railway Junction',
                                  'Panjappur',
                                  'Kodumbalur',
                                  'Kovilpatti',
                                  'Court',
                                  'Puthur 4 Road',
                                  'Aruna Theatre',
                                  'Natchiyar Koil',
                                  'Woraiyur',
                                  'Kalaignar Arivalayam',
                                  'Senthaneerpuram',
                                  'Palpannai',
                                  'SIT',
                                  'Kattur',
                                  'Thiruverumbur',
                                  'Nambampatti',
                                  'Aandipatti',
                                  'Kalamraj Silai',
                                  'Manaparai',
                                  'Saravanapuram',
                                  'Pallakadu',
                                  'RT Malai',
                                  'Kavalkaranpatti',
                                  'Keelaveliyur',
                                  'Sathirapatti',
                                  'JJ Engg College',
                                  'Inamkulathur',
                                  'Anadavar Koil',
                                  'Pothametupatti',
                                  'Manaparai',
                                  'Sanjeevi nagar-Kollidam',
                                  'Periyar school',
                                  'Arasan Bakery',
                                  'LIC colony',
                                  'KK Nagar',
                                  'Airport',
                                  'Melapudur',
                                  'Market',
                                  'Singarathopu',
                                  'Chathiram Bus stand',
                                  'Subramaniyapuram',
                                  'Jail Corner',
                                  'Rice Mill',
                                  'Ponmalaipatti',
                                  'Kaikatti',
                                  'Valanadu',
                                  'Palakurichy',
                                  'Ammakulam',
                                  'Thuvarankurichy',
                                  'Srinivasanagar',
                                  'Uyyankondan Thirumalai',
                                  'Retta vaikal',
                                  'Nachikurichy',
                                  'BHEL Training centre',
                                  'Thuvakkudi',
                                  'Manjampatti',
                                  'Aatrupalam',
                                  'Vaiyampatti',
                                  'Alaganampatti',
                                  'Bommanayakanpatti',
                                  'Perur',
                                  'Neithalur Colony',
                                  'Viyalanmedu',
                                  'Kattanimedu',
                                  'Vadugapatti vilaku',
                                  'Pannankombu',
                                  'No.1 Tolgate',
                                  'Valadi',
                                  'Maanthurai',
                                  'Aangarai',
                                  'Lalgudi',
                                  'Poovalur By-pass',
                                  'Pullambadi',
                                  'Vadagarpettai',
                                  'Dalmiapuram',
                                  'Mathur',
                                  'Annanagar',
                                  'OFT',
                                  'Samayapuram',
                                  'Mannachanalur',
                                  'Ponmalai',
                                  'Ponamalai Sandhai',
                                  'Mariamman Kovil',
                                  'Mela Kalkandarkottai',
                                  'Keel Kalkandarkottai'
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    from = val;
                                    busfee();
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "To",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              height: 50,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "INDRA GANESAN COLLEGE OF ENGINEERING",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "Bus fees",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              height: 50,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(6.0),
                                color: Color(0x262561FA),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(bf),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InstructionScreen()))
                                },
                                child: Text(
                                  "Instruction to follow",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2661FA)),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: RaisedButton(
                                  onPressed: _submit,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: size.width * 0.5,
                                    decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        gradient: new LinearGradient(colors: [
                                          Color.fromARGB(255, 0, 0, 160),
                                          Color.fromARGB(255, 0, 0, 233)
                                        ])),
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      "SUBMIT",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )),
                            /* SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "______________________",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Center(
                              child: Text(
                            "OFFICE USE ONLY",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              //fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Paid Fees",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(6.0),
                            color: Color(0x262561FA),
                          ),
                          alignment: AlignmentDirectional.centerStart,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: DropdownButton(
                            hint: pf == null
                                ? Text('Fees')
                                : Text(
                                    pf,
                                    style: TextStyle(color: Colors.black),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            items: ['9,000', '12,000', '15,000'].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(() {
                                pf = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Acknowledgement",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(6.0),
                            color: Color(0x262561FA),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(),
                            //validator: (val) => val.length < 3
                            //  ? 'Name must be more than 2 character'
                            //: null,
                            onSaved: (val) => ack = val,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: new Row(children: <Widget>[
                            new RaisedButton(
                              //onPressed: _submit,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.0,
                                width: size.width * 0.25,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    gradient: new LinearGradient(colors: [
                                      Color.fromARGB(255, 0, 0, 160),
                                      Color.fromARGB(255, 0, 0, 233)
                                    ])),
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "SUBMIT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            new RaisedButton(
                              //onPressed: _submit,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.0,
                                width: size.width * 0.25,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    gradient: new LinearGradient(colors: [
                                      Color.fromARGB(255, 0, 0, 160),
                                      Color.fromARGB(255, 0, 0, 233)
                                    ])),
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "REJECT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            new RaisedButton(
                              //onPressed: _submit,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 35.0,
                                width: size.width * 0.25,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    gradient: new LinearGradient(colors: [
                                      Color.fromARGB(255, 0, 0, 160),
                                      Color.fromARGB(255, 0, 0, 233)
                                    ])),
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "DELETE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: size.height * 0.05),*/
                          ]),
                    ])))));
  }
}

class EndScreen extends StatefulWidget {
  final String formid;
  EndScreen({Key key, @required this.formid}) : super(key: key);

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
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
                        onPressed: () =>
                            exit(0), //Navigator.of(context).pop(true),
                        child: new Text('Yes')),
                  ],
                ))) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String formid = widget.formid;
    print(formid);
    //String op = "Form No :" + formid;
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: Background(
          child: new Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "THANK YOU!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Thank You for using this application.Please pay the fees within three days. After three days your form will be expire. Note your Reference form no for further process.",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Form no : $formid ",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
