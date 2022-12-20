import 'package:app/UI/Admin_Interface/cartaps/editdataofthecar.dart';
import 'package:app/UI/Admin_Interface/employeetaps/addEmployee.dart';
import 'package:app/UI/Admin_Interface/employeetaps/editemployeescreen.dart';
import 'package:app/UI/Emloyee/EmployeeHomeScreen.dart';
import 'package:app/UI/user_interface/StartScreen.dart';
import 'package:app/UI/user_interface/home_screen.dart';
import 'package:app/UI/user_interface/profile/EditProfileScreen.dart';
import 'package:app/UI/user_interface/profile/profilescreen.dart';
import 'package:app/UI/user_interface/regestration/createaccount.dart';
import 'package:app/UI/user_interface/regestration/loginpage.dart';
import 'package:app/UI/user_interface/taps/Paymentpage.dart';
import 'package:app/UI/user_interface/taps/QRpage.dart';
import 'package:app/UI/user_interface/taps/viewcarsdetailsscreen.dart';
import 'package:app/userprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FireBase_FireStore_DataBase/car/user.dart';
import 'UI/Admin_Interface/Admin_home_Screen.dart';
import 'UI/Admin_Interface/cartaps/addcarscreen.dart';
import 'UI/theme/themedatafile.dart';
import 'firebase_options.dart';

void main ()async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = User(
        id: 'id',
        Name: 'Name',
        Email: 'Email',
        Password: 'Password',
        PhoneNumber: 'PhoneNumber',
        Country: 'Country',
        Iamge: 'Iamge'
    );
    return MultiProvider(
      providers: [
        Provider(create: (context)=> userprovider(user: user) )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:{
          StartScreen.routeName :(_) => StartScreen(),
          LoginPage.routeName :(_) => LoginPage(),
          ProfleScreen.routeName :(_) => ProfleScreen(),
          EditProfileScreen.routeName :(_) => EditProfileScreen(),
          ViewCarDetailsScreen.routeName :(_) => ViewCarDetailsScreen(),
          CreateAccount.routeName :(_) => CreateAccount(),
          PaymentPage.routeName :(_) => PaymentPage(),
          QRPage.routeName :(_)=> QRPage(),
          EmployeeHomeScreen.routeName :(_) => EmployeeHomeScreen(),
          User_Home_screen.routeName : (_) => User_Home_screen(),
          AddEmployeeSCreen.routeName :(_) => AddEmployeeSCreen(),
          editCerScreen.routeName :(_) => editCerScreen(),
          EditEmployeeScreen.routeName : (_) => EditEmployeeScreen(),
          AdminHomeScree.routeName : (_) => AdminHomeScree(),
          AddCerScreen.routeName :(_) => AddCerScreen(),
        },
        initialRoute: StartScreen.routeName,
        theme: MyTheme.LightTheme,
      ),
    );
  }
}
