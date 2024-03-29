import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:app/UI/Admin_Interface/cartaps/ShowCarsTap.dart';
import 'package:app/UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'package:app/UI/Admin_Interface/employeetaps/Show_Emplyoee_Tap.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';

import '../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../user_interface/profile/profilescreen.dart';
import '../user_interface/regestration/loginpage.dart';


class AdminHomeScree extends StatefulWidget {
  static const String routeName = 'Admin home Scree';

  @override
  State<AdminHomeScree> createState() => _AdminHomeScreeState();
}

class _AdminHomeScreeState extends State<AdminHomeScree> {
  int curantindex = 0;
  var taps = [ShowCarsTap(),ShowEmployeeTap()];
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
        drawer: Drawer(
            child: Column(
              children: [
                const SizedBox(height: 30,),
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
              setState(() {});
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
