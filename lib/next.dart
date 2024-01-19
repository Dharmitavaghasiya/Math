import 'package:flutter/material.dart';
import 'package:math/new.dart';
import 'package:shared_preferences/shared_preferences.dart';

class next extends StatefulWidget {
  int a;
  next(this.a);

  // const next({super.key});
  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {

  int b=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get1();
  }

  get1()
  async {
    // home.prefs = await SharedPreferences.getInstance();

    widget.a=home.prefs!.getInt("counter") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("next")),
    body: Column(
      children: [
        Center(child: Text("a=${widget.a}",style: TextStyle(fontSize: 40),)),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:  (context) {
            return home();
          },));
          setState(() {});
        }, child: Text("return")),

      ],
    ),);
  }
}
