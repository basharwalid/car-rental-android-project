import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';

import '../../../FireBase_FireStore_DataBase/car/car.dart';

class ViewCarDetailsScreen extends StatelessWidget {
  static const String routeName = 'view car details screen';

  @override
  Widget build(BuildContext context) {
    Car car = ModalRoute.of(context)?.settings.arguments as Car;
    var mediaquery= MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white ,
          ],
          begin: Alignment.bottomLeft,
          end : Alignment.topRight
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("${car.ManufacturCompany} ${car.CarModel}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: mediaquery.height *0.4,
                decoration: BoxDecoration(
                  color: MyTheme.white,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 20
                    ),
                  ],
                ),
                child: Image.network(car.Image),
              ),
              SizedBox(height: 20,),
              Text("${car.ManufacturCompany}" ,style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),),
              SizedBox(height: 20,),
              Text("${car.ManufacturCompany} ${car.CarModel}" ,style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24),),
            ],
          ),
        ),
      ),
    );
  }
}