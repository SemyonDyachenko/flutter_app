import 'package:flutter/material.dart';

final Color bgColor = Color(0xFF4A4A58);

class MenuDashBoardpage extends StatefulWidget {
 @override
 _MenuDashBoardPageState createState() => _MenuDashBoardPageState();
  }

  class _MenuDashBoardPageState extends State<MenuDashBoardpage> with SingleTickerProviderStateMixin {

    bool isCollased = true;
    double screenWidth,screenHeight;
    final Duration duration = const Duration(microseconds: 300);
    AnimationController _controller;
    Animation<double> _scaleAnimation;
    Animation<double> _menuScaleAnimation;
    Animation<Offset> _slideAnimation;


    @override
    void initState()
    {
      super.initState();
      _controller = AnimationController(vsync: this,duration: duration);
      _scaleAnimation = Tween<double>(begin: 1,end:0.6 ).animate(_controller);
      _slideAnimation = Tween<Offset>(begin:Offset(-1,0),end: Offset(0,0)).animate(_controller);
      _menuScaleAnimation
    }

    @override
    void dispose()
    {
      _controller.dispose();
      super.dispose();
    }

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
      return SlideTransition(
        position: _slideAnimation,
        child: Padding(
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
        ),
      );
    }

    Widget dashboard(context) {
      return AnimatedPositioned(
        duration: duration,
        top:  0,
        bottom:0,
        left: isCollased ? 0 : 0.6 * screenWidth,
        right: isCollased ? 0 : -0.4 * screenWidth,
        child: ScaleTransition(
          scale:_scaleAnimation,
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
                            if(isCollased)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollased = !isCollased;
                          });
                        },
                      ),
                      Text("Актуальные туры",
                        style: TextStyle(fontSize: 24, color: Colors.white),),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 400,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.vertical,
                      pageSnapping: true,
                      children: <Widget>
                      [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          color:Colors.redAccent,
                          width:100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          color:Colors.blueAccent,
                          width:100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
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
        ),
      );
    }

  }