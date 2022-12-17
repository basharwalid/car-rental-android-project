import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/UI/Admin_Interface/cartaps/carCardWidget.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../FireBase_FireStore_DataBase/car/car.dart';
class ShowCarsTap extends StatefulWidget {

  @override
  State<ShowCarsTap> createState() => _ShowCarsTapState();
}

class _ShowCarsTapState extends State<ShowCarsTap> {
  @override
  Widget build(BuildContext context){
    return FutureBuilder <List<Car>> (
      future: MyDataBase.getCarsData(),
      builder: (buildcontext, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: LoadingAnimationWidget.fourRotatingDots(color: MyTheme.blue, size: 40));
        }
        var cars = snapshot.data;
        if(snapshot.hasError){return Center(child: Text("loading erroe" ,style: TextStyle(fontSize: 30),),);}
        return ListView.builder(
          itemBuilder:(_,index) =>CarCardWidget(car: cars![index],),
          itemCount: cars?.length ?? 0,
        );
      },
    );
  }
}
