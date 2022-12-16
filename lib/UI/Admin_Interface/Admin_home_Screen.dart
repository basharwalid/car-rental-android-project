import 'package:app/DataBase/Database.dart';
import 'package:app/UI/Admin_Interface/cartaps/ShowCarsTap.dart';
import 'package:app/UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'package:app/UI/Admin_Interface/employeetaps/Show_Emplyoee_Tap.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';


class AdminHomeScree extends StatefulWidget {
  static const String routeName = 'Admin home Scree';

  @override
  State<AdminHomeScree> createState() => _AdminHomeScreeState();
}

class _AdminHomeScreeState extends State<AdminHomeScree> {
  int curantindex = 0;
  var taps = [ShowCarsTap(),ShowEmployeeTap()];
  SQLDB Sqldb =SQLDB();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft ,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Home"),
        ),

        body: Column(
          children: [
            Expanded(child: taps[curantindex])
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 6 , color: MyTheme.white),
            borderRadius: BorderRadius.circular(1000)
          ),
          child: FloatingActionButton(
            onPressed: (){
              if (curantindex == 0 ){
                Navigator.pushNamed(context, AddCerScreen.routeName);
              }else{
                Navigator.pushNamed(context, AddEmployeeSCreen.routeName);
              }
            },
            child:const Icon(Icons.add_rounded , size: 36, color: MyTheme.white,),
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          color: MyTheme.white,
          child: BottomNavigationBar(
            currentIndex: curantindex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (index){
              curantindex = index;
              setState(() {
              });
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.car_rental_rounded) , label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded) , label: ""),
            ],
          ),
        )
      ),
    );
  }

}
