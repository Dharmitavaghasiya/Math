import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math/next.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(home:home()));
}
class home extends StatefulWidget {
  // const home({super.key});
  static SharedPreferences? prefs;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int a=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    home.prefs = await SharedPreferences.getInstance();
    a=home.prefs!.getInt("counter") ?? 0;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DEMO")),
      body: Column(
        children: [
          Center(child: Text("a=${a}",style: TextStyle(fontSize: 40),)),
          ElevatedButton(onPressed: () {
            a++;
            home.prefs!.setInt("counter", a);
           
            setState(() {});
          }, child: Text("++",)),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return next(a);
            },));

          }, child:Text("NEXT"))
        ],
      ),
    );
  }
}
