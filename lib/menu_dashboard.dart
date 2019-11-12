import 'package:flutter/material.dart';

final Color bgColor = Color(0xFF4A4A58);

class MenuDashBoardpage extends StatefulWidget {
 @override
 _MenuDashBoardPageState createState() => _MenuDashBoardPageState();
  }

  class _MenuDashBoardPageState extends State<MenuDashBoardpage> {

    bool isCollased = true;
    double screenWidth,screenHeight;
    final Duration duration = const Duration(microseconds: 300);

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      screenWidth = size.width;
      screenHeight = size.height;
      return Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: <Widget>[
            menu(context),
            dashboard(context),
          ],
        ),
      );
    }


    Widget menu(context) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Актуальные туры",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 10),
              Text("Профиль",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 10),
              Text("Контакты",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    }

    Widget dashboard(context) {
      return AnimatedPositioned(
        duration: duration,
        top: isCollased ? 0 : 0.2 * screenHeight,
        bottom: isCollased ? 0 : 0.2 * screenHeight,
        left: isCollased ? 0 : 0.6 * screenWidth,
        right: isCollased ? 0 : -0.4 * screenWidth,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 8,
          color: bgColor,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(Icons.menu, color: Colors.white),
                      onTap: () {
                        setState(() {
                          isCollased = !isCollased;
                        });
                      },
                    ),
                    Text("Актуальные туры",
                      style: TextStyle(fontSize: 24, color: Colors.white),),
                    Icon(Icons.settings, color: Colors.white),
                  ],
                ),
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>
                    [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color:Colors.blueAccent,
                        width:100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color:Colors.blueAccent,
                        width:100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color:Colors.greenAccent,
                        width:100,
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      );
    }

  }