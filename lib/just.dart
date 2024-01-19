import 'package:flutter/material.dart';
import 'package:puzzle1/data.dart';
import 'package:puzzle1/win.dart';

import 'first.dart';

class second extends StatefulWidget {
  int? ind;

  second([this.ind]);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  String str = "";
  int level_no = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.ind!=null)
    {
      level_no=widget.ind!;
    }
    else {
      level_no = first.prefs!.getInt("levelno") ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.only(top: 10),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                              onTap: () {
                                String str=first.prefs!.getString("skip_time")??"";
                                if(str=="")
                                {
                                  DateTime dt=DateTime.now();
                                  first.prefs!.setString("skip_time",dt.toString());
                                  first.prefs!.setString("level_status$level_no", "no");
                                  level_no++;
                                  first.prefs!.setInt("levelno", level_no);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second();
                                  },));
                                  setState(() {});

                                }
                                else {
                                  DateTime current_time = DateTime.now();
                                  DateTime skip_time = DateTime.parse(str);
                                  Duration c = current_time.difference(
                                      skip_time);
                                  int sec = c.inSeconds;
                                  if (sec >= 10) {
                                    first.prefs!.setString(
                                        "skip_time", dt.toString());
                                    first.prefs!.setString(
                                        "level_status$level_no", "no");
                                    level_no++;
                                  }
                                }



                              },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("myassets/skip.png"),
                                        fit: BoxFit.fill)),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "LEVEL ${level_no + 1}",
                                style: TextStyle(
                                    fontFamily: 'one',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("myassets/level_board.png"),
                                      fit: BoxFit.fill)),
                            )),
                        Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("myassets/hint.png"),
                                      fit: BoxFit.fill)),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${data.que[level_no]}"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(flex: 1, child: Text("")),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: Colors.white,
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text("${str}"),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      str = str.substring(0, str.length - 1);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage("myassets/delete.png"),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      if (int.parse(str) == data.ans[level_no]) {
                                        first.prefs!.setString("level_status$level_no", "YES");
                                        level_no++;
                                        first.prefs!.setInt("levelno", level_no);
                                        str = "";
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) {
                                            return win(level_no);
                                          },
                                        ));

                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Wrong")));
                                        str = "";
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'one',
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
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
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "2";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "3";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "4";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "5";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "5",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "6";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "7";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "7",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "8";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "9";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        str = str + "0";
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("myassets/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
            ),
            ),
        );
    }
}
