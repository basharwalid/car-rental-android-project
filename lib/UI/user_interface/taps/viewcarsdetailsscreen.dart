import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/taps/Paymentpage.dart';
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
        body: Stack(
          children: [
            Container(
              height: mediaquery.height*0.5,
              child: Image.network(car.Image),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: mediaquery.height*0.5,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: mediaquery.height*0.5,
                    ),
                    width: mediaquery.width,
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: MyTheme.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("${car.ManufacturCompany}" ,style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30),),
                        SizedBox(height:50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Car Model : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.ManufacturCompany} ${car.CarModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Color  : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.Color}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Horse Power : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.HorsePower}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Maximum Speed : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.MaximumSpeed}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Transmission Type : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.TransmissionType}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Year Model : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.YearModel}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Number of Seats : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.Seats}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price : " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),),
                            Text("${car.Price}" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),)
                          ],
                        ),
                        Container(
                          color: MyTheme.primarycolor,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 0,
                        ),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, PaymentPage.routeName , arguments: car);
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                              backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                              fixedSize: MaterialStateProperty.all(Size.fromWidth(mediaquery.width)),
                            ),
                            child: Text('Rent Now' , style: Theme.of(context).textTheme.headline2,)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
