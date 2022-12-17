import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:app/UI/Admin_Interface/employeetaps/employeecardwidget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../theme/themedatafile.dart';

class ShowEmployeeTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<Employee>> (
      future: MyDataBase.getEmployeesData(),
      builder: (buildcontext, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: LoadingAnimationWidget.fourRotatingDots(color: MyTheme.blue, size: 40));
        }
        var employees = snapshot.data;
        if(snapshot.hasError){return Center(child: Text("loading erroe" ,style: TextStyle(fontSize: 30),),);}
        return ListView.builder(
          itemBuilder:(_,index) =>EmployeeCardWidget(employee: employees![index]),
          itemCount: employees?.length ?? 0,
        );
      },
    );;
  }
}
