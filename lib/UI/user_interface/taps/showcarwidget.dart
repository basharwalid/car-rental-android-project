import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Show_car_Widget extends StatelessWidget {
  Car car;
  Show_car_Widget({required this.car});

  @override
  Widget build(BuildContext context) {
    var mediaQuere = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.blue,

          borderRadius: BorderRadius.circular(20)
      ),
      margin:const EdgeInsets.all(20),
      child: Slidable(
        key: const ValueKey(1),
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20)),
              onPressed: (BuildContext) async {
              },
              backgroundColor: MyTheme.blue,
              foregroundColor: Colors.white,
              icon: Icons.remove_red_eye_rounded,
              label: 'View',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                MyTheme.lightbule,
                MyTheme.white,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(-3,3),
                blurRadius: 10
              )
            ]
          ),
          height:mediaQuere.height *0.22 ,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.network(car.Image),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24),textAlign: TextAlign.center,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.airline_seat_recline_normal_rounded , color: MyTheme.primarycolor,),
                          Text(": ${car.Seats}" ,style: TextStyle(fontSize: 18),)
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.speed_rounded , color: MyTheme.primarycolor,),
                          Text(": ${car.MaximumSpeed} Kmh" ,style: TextStyle(fontSize: 18),)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                  backgroundColor:MaterialStateProperty.all(MyTheme.primarycolor),
                                  fixedSize: MaterialStateProperty.all(Size.fromWidth(mediaQuere.width),),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                              ),
                              child: Text('${car.Price} EGP' , style: TextStyle(fontSize: 16),)
                          ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
