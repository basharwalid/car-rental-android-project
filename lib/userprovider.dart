import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:flutter/cupertino.dart';

class userprovider extends ChangeNotifier{
  User? user ;
  userprovider ({  this.user });

  void setactiveuser( User currantuser){
    user = currantuser;
    notifyListeners();
  }

}