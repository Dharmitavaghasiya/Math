import 'package:flutter/material.dart';
import 'package:math/data.dart';
import 'package:math/main.dart';
import 'package:math/second.dart';

class grid extends StatefulWidget {
  List l;

  grid(this.l);

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  int level_no = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() {
    level_no = first.prefs!.getInt("lvl_number") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "SELECT PUZZLE",
                  style: TextStyle(
                      fontSize: 30, color: Colors.indigo, fontFamily: 'one'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "1/4",
                    style: TextStyle(
                        fontSize: 30, color: Colors.indigo, fontFamily: 'one'),
                  )),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: data.que.length - 51,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          if (index < level_no || widget.l[index] == "yes") {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return second(index);
                              },
                            ));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: (index < level_no)
                                  ? (widget.l[index] == "yes")
                                      ? DecorationImage(
                                          image:
                                              AssetImage("assets/img/tick.png"))
                                      : null
                                  : DecorationImage(
                                      image: AssetImage("assets/img/lock.png")),
                              // color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10),
                              border: (index < level_no)
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null),
                          child: (index < level_no)
                              ? Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: 'one'),
                                  // ),
                                )
                              : null,
                        ));
                  },
                ),
              ),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return grid2(widget.l);
                    },));
                  },
                    child: Container(margin: EdgeInsets.all(10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/next.png"),
                              fit: BoxFit.contain)),
                    ),
                  )
                ],
              ))
            ],
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
class grid2 extends StatefulWidget {
  List l;

  grid2(this.l);
  @override
  State<grid2> createState() => _grid2State();
}

class _grid2State extends State<grid2> {
  int level_no=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() {
    level_no = first.prefs!.getInt("lvl_number") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "SELECT PUZZLE",
                  style: TextStyle(
                      fontSize: 30, color: Colors.indigo, fontFamily: 'one'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "2/4",
                    style: TextStyle(
                        fontSize: 30, color: Colors.indigo, fontFamily: 'one'),
                  )),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: data.que.length - 51,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          if (index+24 < level_no || widget.l[index+24] == "yes") {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return second(index+24);
                                  },
                                ));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: (index+24 < level_no)
                                  ? (widget.l[index+24] == "yes")
                                  ? DecorationImage(
                                  image:
                                  AssetImage("assets/img/tick.png"))
                                  : null
                                  : DecorationImage(
                                  image: AssetImage("assets/img/lock.png")),
                              // color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10),
                              border: (index +24< level_no)
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null),
                          child: (index+24 < level_no)
                              ? Text(
                            "${index + 25}",
                            style: TextStyle(
                                fontSize: 30, fontFamily: 'one'),
                            // ),
                          )
                              : null,
                        ));
                  },
                ),
              ),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return grid(widget.l);
                        },));
                      },
                        child: Container(margin: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/img/next.png"),
                                  fit: BoxFit.contain)),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),

    );
  }
}

