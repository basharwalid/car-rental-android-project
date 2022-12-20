import 'package:app/UI/Emloyee/Viewcarwidgetinemployee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../../FireBase_FireStore_DataBase/car/car.dart';
import '../theme/themedatafile.dart';
import '../user_interface/regestration/loginpage.dart';

class EmployeeHomeScreen extends StatelessWidget {
  static const String routeName = 'Employee home screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("View Orders"),
        ),
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
        body: StreamBuilder<QuerySnapshot<Car>>(
          stream: MyDataBase.getrentedcar(),
          builder: (buildcontext, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: LoadingAnimationWidget.fourRotatingDots(color: MyTheme.blue, size: 40));
            }
            var cars = snapshot.data?.docs.map((doc) => doc.data()).toList();
            if(snapshot.hasError){return Center(child: Text("loading erroe" ,style: TextStyle(fontSize: 30),),);}
            return ListView.builder(
              itemBuilder:(_,index) =>Show_car_Widget_Employee(car: cars![index],),
              itemCount: cars?.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
