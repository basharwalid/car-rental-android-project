import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/taps/Widding_tap.dart';
import 'package:app/UI/user_interface/taps/longterm.dart';
import 'package:app/UI/user_interface/taps/motorcycle_tap.dart';
import 'package:app/UI/user_interface/taps/short_term_tap.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class User_Home_screen extends StatefulWidget {
  static const String routeName = "usser home Screen" ;

  @override
  State<User_Home_screen> createState() => _User_Home_screenState();
}

class _User_Home_screenState extends State<User_Home_screen> {
  int currentIndex = 0;
  List<Widget> taps = [Long_term_tap(),Short_term_tap(),Widding_tap(),MotorCycle_tap()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions:<Widget> [
            InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(1000),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 3 , color: MyTheme.white),
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.person_rounded , size: 24,),
              ),
            ),
            SizedBox(width: 20,)
          ],
          title: Text('Home'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: taps[currentIndex]),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: MyTheme.white,
          onTap: (value) {
            setState(() {
              currentIndex  = value ;
            });
          },
          items:const [
            Icon(Icons.access_time_filled_rounded, color: MyTheme.blue, size: 30, semanticLabel: String.fromEnvironment("car"), ),
            Icon(Icons.timelapse_rounded , color: MyTheme.blue, size: 30, semanticLabel: String.fromEnvironment("car"), ),
            Icon(Icons.event_rounded , color: MyTheme.blue, size: 30, semanticLabel: String.fromEnvironment("car"), ),
            Icon(Icons.motorcycle_rounded , color: MyTheme.blue, size: 30, semanticLabel: String.fromEnvironment("car"), ),
          ],
        ),
      ),
    );
  }
}
