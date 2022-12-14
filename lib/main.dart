import 'package:app/UI/Admin_Interface/cartaps/editdataofthecar.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:flutter/material.dart';
import 'UI/Admin_Interface/Admin_home_Screen.dart';
import 'UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'UI/theme/themedatafile.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        AddEmployeeSCreen.routeName :(_) => AddEmployeeSCreen(),
        editCerScreen.routeName :(_) => editCerScreen(),
        AdminHomeScree.routeName : (_) => AdminHomeScree(),
        AddCerScreen.routeName :(_) => AddCerScreen(),
      } ,
      initialRoute: AdminHomeScree.routeName,
      theme: MyTheme.LightTheme,
    );
  }
}
