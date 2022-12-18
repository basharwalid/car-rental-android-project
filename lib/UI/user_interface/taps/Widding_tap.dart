import 'package:app/UI/user_interface/taps/showcarwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../../../FireBase_FireStore_DataBase/car/car.dart';
import '../../theme/themedatafile.dart';


class Widding_tap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Car>>(
      stream: MyDataBase.getcardatastreamwithQuire("3"),
      builder: (buildcontext, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: LoadingAnimationWidget.fourRotatingDots(color: MyTheme.blue, size: 40));
        }
        var cars = snapshot.data?.docs.map((doc) => doc.data()).toList();
        if(snapshot.hasError){return Center(child: Text("loading erroe" ,style: TextStyle(fontSize: 30),),);}
        return ListView.builder(
          itemBuilder:(_,index) =>Show_car_Widget(car: cars![index],),
          itemCount: cars?.length ?? 0,
        );
      },
    );

  }
}
