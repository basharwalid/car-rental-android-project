import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:flutter/material.dart';
import '../../theme/themedatafile.dart';

class EmployeeCardWidget extends StatelessWidget {
  Employee employee ;
  EmployeeCardWidget({required this.employee});
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
            blurRadius: 10,
            offset: Offset(-3,3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3 ,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(employee.Image), fit:  BoxFit.cover),
                border: Border.all(width: 5,color: MyTheme.white)
              ),
              height: mq.height*0.15,
          )),
          SizedBox(width: 10,),
          Expanded(
            flex: 5 ,
            child: Container(
              height: mq.height*0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(employee.EmployeeName ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),),
                  Text("Age : ${employee.EmployeeAge}" ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
                  Text("Salary : ${employee.EmployeeSalary} EGP" ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
                ],
              ),
          ))
        ],
      ),
    );
  }
}
