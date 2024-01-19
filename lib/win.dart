import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:math/data.dart';
import 'package:math/main.dart';
import 'package:math/second.dart';
import 'package:share/share.dart';

class win extends StatefulWidget {
  int level_no;
  bool? is_skip;

  win(this.level_no,[this.is_skip]);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/img/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Container(
          child: Column(children: [
            Expanded(
                flex: 1,
                child: (widget.is_skip==true)?Text(
                  "LEVEL ${widget.level_no+1} COMPLETED",
                  style: TextStyle(
                      fontSize: 30, color: Colors.indigo, fontFamily: 'one',fontWeight: FontWeight.w900),
                ):Text(
                  "LEVEL ${widget.level_no} COMPLETED",
                  style: TextStyle(
                      fontSize: 30, color: Colors.indigo, fontFamily: 'one',fontWeight: FontWeight.w900),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/trophy.png"),
                          fit: BoxFit.fill)),
                )),
            Expanded(flex: 3,child: Container(height: double.infinity,width: double.infinity,child: Column(children: [
              Expanded(child: InkWell(onTap: () {
                if(widget.is_skip==true)
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    widget.level_no++;
                    print("${widget.level_no}");

                    return second(widget.level_no);
                  },));
                }else {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) {
                    // widget.level_no++;
                    print("win Level:-${widget.level_no}");
                    return second(widget.level_no);
                  },));
                }
              },
                child: Container(margin: EdgeInsets.fromLTRB(100, 10, 110, 10),height: double.infinity,width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.black12, width: 2),
                    gradient: LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.grey,
                      Colors.blueGrey
                    ])),alignment: Alignment.center,child: Text("CONTINUE",style: TextStyle(fontSize: 20,fontFamily: 'one',fontWeight: FontWeight.w700)),),
              )),
              Expanded(child: InkWell(onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                  return first();
                },));
              },
                child: Container(margin: EdgeInsets.fromLTRB(100, 10, 110, 10),height: double.infinity,width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: Colors.black12, width: 2),
                      gradient: LinearGradient(colors: [
                        Colors.blueGrey,
                        Colors.grey,
                        Colors.blueGrey
                      ])),alignment: Alignment.center,child: Text("MAIN MENU",style: TextStyle(fontSize: 20,fontFamily: 'one',fontWeight: FontWeight.w700)),),
              )),
              Expanded(child: Container(margin: EdgeInsets.fromLTRB(100, 10, 110, 10),height: double.infinity,width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.black12, width: 2),
                    gradient: LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.grey,
                      Colors.blueGrey
                    ])),alignment: Alignment.center,child: Text("BUY PRO",style: TextStyle(fontSize: 20,fontFamily: 'one',fontWeight: FontWeight.w700)),)),
            ],),)),

            Expanded(
                flex: 1,
                child: Text(
                  "SHARE THIS PUZZLE",
                  style: TextStyle(
                      fontSize: 30, color: Colors.indigo, fontFamily: 'one',fontWeight: FontWeight.w600),
                )),
            Expanded(child:
            InkWell(onTap: () async{
              getImageFileFromAssets("p${widget.level_no}.png").then((value) {
                print(value);
                Share.shareFiles(['${value.path}'], text: 'Great picture');
              });
              setState(() { });

            },
              child: Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(colors: [
                Colors.blueGrey,
                Colors.grey,
                Colors.blueGrey
              ]),image: DecorationImage(image: AssetImage("assets/img/shareus.png"),fit: BoxFit.contain)),),
            )),
              Expanded(flex:1,child: Text("")),
          ]),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
