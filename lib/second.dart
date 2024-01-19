import 'package:flutter/material.dart';
import 'package:math/data.dart';
import 'package:math/main.dart';
import 'package:math/win.dart';

class second extends StatefulWidget {
  int? level;
  second([this.level]);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  int level_no = 0;
  String str = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.level!=null)
      {
        level_no=widget.level!;
      }
    else
      {
        level_no = first.prefs!.getInt("lvl_number") ?? 0;
      }
    print(level_no);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WillPopScope(child:
      SafeArea(
          minimum: EdgeInsets.only(top: 10),
          child: Container(
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(onTap: () {
                          String t=first.prefs!.getString("skiptime") ?? "";
                          print("t=${t}");

                          if(t=="") {
                            DateTime dt = DateTime.now();
                            print("dt:${dt}");
                            first.prefs!.setString("skiptime", dt.toString());
                            first.prefs!.setString(
                                "level_status$level_no", "no");
                            level_no++;
                            first.prefs!.setInt("lvl_number", level_no);

                          }
                          else {
                            DateTime cur_time = DateTime.now();
                            DateTime skip_time = DateTime.parse(t);
                            print("cur_time:-${cur_time}");
                            print("skip_time:-${skip_time}");
                            Duration dur = cur_time.difference(skip_time);
                            int sec = dur.inSeconds;
                            print("sec:-${sec}");

                            if (sec >= 10) {
                              first.prefs!.setString(
                                  "level_status$level_no", "no");
                              level_no++;
                              first.prefs!.setInt("lvl_number", level_no);
                              first.prefs!.setString(
                                  "skiptime", cur_time.toString());
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return second();
                                  },));
                            }

                            else {
                              showDialog(barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("YOU CAN SKIP AFTER 10 SEC"),
                                    actions: [ElevatedButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("OK"))
                                    ],);
                                },);
                            }
                          }
                          setState(() {

                          });

                        },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/img/skip.png"),
                                    fit: BoxFit.fill)),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "LEVEL ${level_no + 1}",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'one',
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic),
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/img/level_board.png"),
                                  fit: BoxFit.fill)),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/img/hint.png"),
                                  fit: BoxFit.fill)),
                        )),
                  ],
                ),
              ),
              Text(""),
              Expanded(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${data.que[level_no]}"),
                            fit: BoxFit.fill)),
                  )),
              Expanded(flex: 1, child: Text("")),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Text("${str}"),
                                    margin: EdgeInsets.all(5),
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: Colors.white,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(onTap: () {
                                    str = str.substring(0, str.length - 1);
                                    setState(() {});

                                  },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/delete.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(onTap: () {
                                    // var str=this.str;
                                    if(int.parse(str)==data.ans[level_no])
                                    {
                                      first.prefs!.setString("level_status$level_no", "yes");
                                      // level_no++;
                                      // first.prefs!.setInt("lvl_number", level_no);
                                      // str = "";
                                      // Navigator.pushReplacement(context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) {
                                      //         return win(level_no);
                                      //       },));
                                      if(widget.level!=null)
                                      {
                                        level_no++;
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                          return win(widget.level!,true);
                                        },));
                                      }
                                      else{
                                        level_no++;
                                        first.prefs!.setInt("lvl_number", level_no);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                          return win(level_no);
                                        },));
                                      }
                                    }
                                    else{
                                      str="";
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(content: Text("wrong")));
                                    }
                                    // level_no++;
                                    setState(() {

                                    });
                                  },
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              fontFamily: 'one',
                                              fontSize: 15,
                                              color: Colors.white),
                                        )),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "1";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "2";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "3";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "3",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "4";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "4",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "5";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "5",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "6";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "6",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "7";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "7",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "8";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "8",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "9";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "9",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                        onTap: () {
                                          str = str + "0";
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          color: Colors.grey,
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Text(
                                            "0",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ))),
                              ],
                            ))
                      ],
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black,
                  )),
              Text(""),
            ]),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/gameplaybackground.jpg"),
                    fit: BoxFit.fill)),
          )),
           onWillPop: () async{
        showDialog(context: context, builder: (context) {
          return AlertDialog(title: Text("GAME EXIT"),
          actions: [
          ElevatedButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return first();
            },));
          }, child: Text("OK")),
    ElevatedButton(onPressed: () {
      Navigator.pop(context);
    }, child: Text("CANCEL")),
    ],);
        },);
        return true;
    },)
    );
  }
}
