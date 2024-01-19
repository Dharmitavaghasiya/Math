import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math/data.dart';
import 'package:math/grid.dart';
import 'package:math/second.dart';
import 'package:math/win.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
    debugShowCheckedModeBanner: false,
  ));
}

class first extends StatefulWidget {
  const first({super.key});
   static SharedPreferences? prefs;

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  bool temp1 = false;
  bool temp2 = false;
  bool temp3 = false;
  List l=[];


  share_pref()
  async {
    first.prefs= await SharedPreferences.getInstance();
    int level_no = first.prefs?.getInt("lvl_number")??0;

    l=List.filled(data.ans.length, "no");
    for(int i=0;i<level_no;i++)
      {
        l[i]=first.prefs!.getString("level_status$i");
      }
    print(l);
    setState(() {});

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share_pref();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      WillPopScope(
        onWillPop: () { exit(0); },
        child: SafeArea(
            minimum: EdgeInsets.only(top: 10),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "MATH PUZZLE",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'one',
                            color: Colors.indigo),
                      )),

                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(flex: 1, child: Text("")),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTapDown: (details) {
                                        temp1 = true;
                                        setState(() {});
                                      },
                                      onTapCancel: () {
                                        temp1 = false;
                                        setState(() {});
                                      },
                                      onTapUp: (details) {
                                        temp1 = false;
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return second();
                                        },));
                                        setState(() {});
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: (temp1)
                                                  ? Border.all(
                                                      color: Colors.white,
                                                      width: 3)
                                                  : null),
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "CONTINUE",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontFamily: 'one'),
                                          )))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTapDown: (details) {
                                        temp2 = true;
                                        setState(() {});
                                      },
                                      onTapCancel: () {
                                        temp2 = false;
                                        setState(() {});
                                      },
                                      onTapUp: (details) {
                                        temp2 = false;
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return grid(l);
                                        },));
                                        setState(() {});
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: (temp2)
                                                  ? Border.all(
                                                      color: Colors.white,
                                                      width: 3)
                                                  : null),
                                          margin: EdgeInsets.all(20),
                                          child: Text(
                                            "PUZZLE",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontFamily: 'one'),
                                          )))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTapDown: (details) {
                                        temp3 = true;
                                        setState(() {});
                                      },
                                      onTapCancel: () {
                                        temp3 = false;
                                        setState(() {});
                                      },
                                      onTapUp: (details) {
                                        temp3 = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: (temp3)
                                                  ? Border.all(
                                                      color: Colors.white,
                                                      width: 3)
                                                  : null),
                                          margin: EdgeInsets.all(20),
                                          child: Text(
                                            "BUY PRO",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontFamily: 'one'),
                                          )))
                                ],
                              ),
                            ),
                            Expanded(flex: 1, child: Text("")),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/img/blackboard_main_menu.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black38,
                              Colors.white30,
                              Colors.black38
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/img/emailus.png"),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black38,
                              Colors.white30,
                              Colors.black38
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/img/shareus.png"),
                                fit: BoxFit.contain)),
                      )
                    ],
                  ))
                ],
              ),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/background.jpg"),
                      fit: BoxFit.fill)),
            )),
      ),
    );
  }
}
