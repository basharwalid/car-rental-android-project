import 'dart:convert';

import 'package:app/DataBase/DataClasses/Car.dart';
import 'package:app/DataBase/Database.dart';
import 'package:app/UI/Admin_Interface/cartaps/editdataofthecar.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatefulWidget {
  Car car ;
  CarCardWidget({required this.car});

  @override
  State<CarCardWidget> createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
  SQLDB sqldb = SQLDB() ;

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      width: mq.width,
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient:const LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white
          ],
          begin: Alignment.bottomLeft ,
          end: Alignment.topRight,
        ),
        boxShadow: const[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset(-3,3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("${widget.car.ManufacturCompany}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),textAlign: TextAlign.center,),
          Container(
              height: mq.height * 0.25,
              child: Image.memory(base64Decode("${widget.car.Image}") , width: mq.width*0.1, fit: BoxFit.contain,)
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child:Container(
                margin:const EdgeInsets.symmetric(horizontal:5 , vertical: 10),
                child: ElevatedButton(
                  onPressed: ()async{
                    await sqldb.deleteData("DELETE FROM 'Car' WHERE CarID = ${widget.car.CarID} ");
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      )
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.recycling_rounded , color: MyTheme.white,),
                    SizedBox(width: 10,),
                    Text("Delete",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
                  ],
                ),

                ),
              )  ),
              Expanded(child:Container(
                margin:const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, editCerScreen.routeName , arguments: widget.car);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_rounded , color: MyTheme.white,),
                      SizedBox(width: 10,),
                      Text("Edit",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
                    ],
                  ),

                ),
              )  ),

            ],
          ),
        ],
      ),
    );
  }
}
