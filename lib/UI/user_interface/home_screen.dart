import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/profile/profilescreen.dart';
import 'package:app/UI/user_interface/regestration/loginpage.dart';
import 'package:app/UI/user_interface/taps/Widding_tap.dart';
import 'package:app/UI/user_interface/taps/longterm.dart';
import 'package:app/UI/user_interface/taps/motorcycle_tap.dart';
import 'package:app/UI/user_interface/taps/short_term_tap.dart';
import 'package:app/userprovider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    User user = Provider.of<userprovider>(context).user;
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
          title: Text('Home'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                margin:const EdgeInsets.only(top: 40),
                child: user.Iamge == null || user.Iamge.isEmpty ?
                const Icon(Icons.account_circle_rounded,size: 140, color: MyTheme.primarycolor,) :
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(user.Iamge,),fit: BoxFit.cover),
                    shape: BoxShape.circle
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(user.Name , style:const TextStyle(fontSize: 18 , color: MyTheme.primarycolor , fontWeight: FontWeight.w500),),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.person_outline_rounded , size: 30, color: MyTheme.primarycolor,),
                  const SizedBox(width: 10,),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProfleScreen.routeName);
                    },
                    child:Text("View Profile" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 22 ,fontWeight: FontWeight.w500),textAlign: TextAlign.start,) ,
                  ),
                ],
              ),
              Container(height: 1, margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5), color: MyTheme.primarycolor,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.logout_rounded, size: 30, color:Colors.red,),
                  const SizedBox(width: 10,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, LoginPage.routeName);
                    },
                    child:Text("Sign Out" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 22 ,fontWeight: FontWeight.w500, color: Colors.red),textAlign: TextAlign.start ,) ,
                  ),
                ],
              ),
            ],
          ),
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
          animationDuration: Duration(milliseconds: 300),

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
