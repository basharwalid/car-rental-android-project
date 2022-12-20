import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/taps/Paymentpage.dart';
import 'package:app/UI/user_interface/taps/viewcarsdetailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../utils/Dialogs_utils_class.dart';

class Show_car_Widget_Employee extends StatelessWidget {
  Car car;
  Show_car_Widget_Employee({required this.car});

  @override
  Widget build(BuildContext context) {
    var mediaQuere = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow:const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
              child :Image.network(car.Image),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
                  ),
                  child: Text("Complete Rent" , style: TextStyle(fontSize: 20)),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton(
                  onPressed: ()async{
                    car.isAvilable = true;
                    DialogUtils.showDialogeMessage(Message: "Loading...", context: context);
                    try{
                      await MyDataBase.updatecar(car);
                      DialogUtils.hideDialogMessage(context: context);
                      DialogUtils.showMessage(message: "Car Updated Sucsessfuly", context: context ,
                          posActiontitle: "Ok" ,
                          posAction: (){}
                      );
                    }catch(Error){
                      DialogUtils.hideDialogMessage(context: context);
                      DialogUtils.showMessage(message: "Error inserting data", context: context,
                        posAction: () async{
                          await MyDataBase.updatecar(car);
                        },
                        posActiontitle: "Try Again",
                        nigAction: (){
                          Navigator.pop(context);
                        },
                        nigActiontitle: "Cancel",
                        isdeismessable: true ,
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
                  ),
                  child: Text("End Rent" , style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
