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
        AdminHomeScree.routeName : (_) => AdminHomeScree(),
        AddCerScreen.routeName :(_) => AddCerScreen(),
      } ,
      initialRoute: AdminHomeScree.routeName,
      theme: MyTheme.LightTheme,
    );
  }
}
