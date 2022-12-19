import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfleScreen extends StatelessWidget {
  static const String routeName = 'profile screen';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<userprovider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('john'),
      ),
      body: Column(
        children: [
          Text("${user.Email}")
        ],
      ),
    );
  }
}
