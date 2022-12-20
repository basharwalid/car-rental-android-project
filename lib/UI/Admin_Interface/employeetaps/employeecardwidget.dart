import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:app/UI/Admin_Interface/employeetaps/editemployeescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../../../utils/Dialogs_utils_class.dart';
import '../../theme/themedatafile.dart';

class EmployeeCardWidget extends StatefulWidget {
  Employee employee ;
  EmployeeCardWidget({required this.employee});

  @override
  State<EmployeeCardWidget> createState() => _EmployeeCardWidgetState();
}

class _EmployeeCardWidgetState extends State<EmployeeCardWidget> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      margin:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient:const LinearGradient(
          colors: [
            Colors.red,
            Color(0xff7bc043),
          ],
          stops: [0.5,0.5],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        ),
      ),
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
                deleteemployee(BuildContext);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane:  ActionPane(
          extentRatio: 0.3,
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              flex: 3,
              onPressed:(BuildContext) {
                Navigator.pushNamed(context, EditEmployeeScreen.routeName , arguments: widget.employee);
              } ,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,bottomRight: Radius.circular(20)),
              backgroundColor: Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.edit_rounded,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          width: mq.width,
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
                    image: DecorationImage(image: NetworkImage(widget.employee.Image), fit:  BoxFit.cover),
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
                      Text(widget.employee.EmployeeName ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),textAlign: TextAlign.center,),
                      Text("Age : ${widget.employee.EmployeeAge}" ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
                      Text("Salary : ${widget.employee.EmployeeSalary} EGP" ,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),),
                    ],
                  ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void deleteemployee (BuildContext){
    DialogUtils.showMessage(message: "Are You Sure That You Want To Delete The Employee", context: context,
        posActiontitle: "ok",
        posAction: ()async {
          DialogUtils.showDialogeMessage(Message: "Loading..", context: context);
          MyDataBase.deleteEmployee(widget.employee);
          DialogUtils.hideDialogMessage(context: context);
          DialogUtils.showMessage(message: "Employee deleted Sucsessfully", context: context ,
            posActiontitle: "Ok" ,
          );
        },
        nigActiontitle: "Cancel",
        isdeismessable: true
    );
  }
}
