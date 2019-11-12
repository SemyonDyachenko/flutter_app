import 'package:flutter/material.dart';

final Color bgColor = Colors.white;

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
      _menuScaleAnimation = Tween<double>(begin:0.5,end:1).animate(_controller);
      _slideAnimation = Tween<Offset>(begin:Offset(-1,0),end: Offset(0,0)).animate(_controller);
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
      return DefaultTabController(
        length: 3,
        child: Theme(
          data: ThemeData(
          brightness:Brightness.dark
        ),
        child: Scaffold(
          backgroundColor: bgColor,
          bottomNavigationBar: TabBar(
      tabs: [
        Tab(icon: Icon(Icons.list,),text: "Туры",),
        Tab(icon: Icon(Icons.account_circle),text:"Профиль"),
        Tab(icon: Icon(Icons.contacts ),text:"Контакты"),

      ],
      unselectedLabelColor: Color(0xff999999),
      labelColor: Colors.black,
      indicatorColor: Colors.transparent,
      ),
          body: Stack(
            children: <Widget>[
              dashboard(context),
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
                      Text("Актуальные туры",
                        style: TextStyle(fontSize: 18, color: Colors.black,fontFamily:"Poppins-Black",fontWeight: FontWeight.w400),),
                      Icon(Icons.settings, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 300,
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
                // Text("Tra")
                //  ListView.separated(itemBuilder: null, separatorBuilder: null, itemCount: null)
                ],
              ),
            ),
          ),
        ),
      );
    }

  }