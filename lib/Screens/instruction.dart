import 'package:flutter/material.dart';

class InstructionScreen extends StatefulWidget {
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Text(
              "Instruction",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2661FA),
                  fontSize: 36),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            height: 760,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              (("1)Students are required to board the college bus.If you wish, you can use the college bus after paying 6 months for the bus.\n2) 1st 6 months : February - July.\n 2nd 6 months : August - January. \n3) Six months once those who paid fees, then can get a buspass.\n4) The student must carry bus pass everyday when they came to college. The student must show their bus pass to bus incharge on demand.\n5) Students shoud stay at this stage 10 minutes before the allotted time. After the bus leaves the stage, the student should board the bus at the next stage of that bus. \n6) Students should board the bus what is alloted to them."
                  "\n7) The student should not stop the bus in between stages\n8) A long whistle will be blown to signal getting on the bus evening. Get on the bus immediately and sit down.\n9) When you comes to college bus do not go anywhere other than college for any reason\n10) Any problem related to maintenance of bus will be done by the concerned department. The maintenance may take some days depending upon the problem. The students are requested to maintain patience.\n11) A student board the bus without buspass wil be charged Rs.1000/-.\n12) Do not use mobile/any electronics devices inside the bus.\n13) Any problem related to buses should be informed to bus inchargers or other faculty members in the bus or to transport committe")),
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
              textAlign: TextAlign.left,
            ),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(6.0),
              color: Color(0x262561FA),
            ),
          ),
        ])));
  }
}
