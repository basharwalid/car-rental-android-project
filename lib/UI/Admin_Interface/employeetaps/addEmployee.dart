import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app/DataBase/DataClasses/Employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../DataBase/DataClasses/Department.dart';
import '../../../DataBase/Database.dart';
import '../../theme/themedatafile.dart';

class AddEmployeeSCreen extends StatefulWidget {
  static const String routeName = 'add empl screen' ;

  @override
  State<AddEmployeeSCreen> createState() => _AddEmployeeSCreenState();
}

class _AddEmployeeSCreenState extends State<AddEmployeeSCreen> {
  SQLDB SqlDb = SQLDB();

  Employee employee = Employee(EmployeeID: 0, EmployeeDepartment: 0, EmployeeName: 'EmployeeName', EmployeeEmail: 'EmployeeEmail', EmployeeUserName: 'EmployeeUserName', EmployeePassword: 'EmployeePassword', EmployeeGender: 'EmployeeGender', EmployeeAge: 'EmployeeAge', EmployeeNationalID: 'EmployeeNationalID', EmployeePhoneNumber: 'EmployeePhoneNumber', EmployeeCountry: 'EmployeeCountry', EmployeeCity: 'EmployeeCity', EmployeeAddress: 'EmployeeAddress', EmployeeNationality: 'EmployeeNationality', EmployeeSalary: 0, EmployeeBankingInforamtion: 'EmployeeBankingInforamtion', EmployeeGraduationState: 'EmployeeGraduationState', Image: 'Image');

  File? image;

  final imagepicker = ImagePicker();

  Uint8List? bytes;

  String? img64 ;

  final formKey = GlobalKey<FormState>();

  uploadImage() async {
    // the image in the page
    XFile? pickedImage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    bytes = File(image!.path).readAsBytesSync();
    img64 = base64Encode(bytes!);
    setState(() {

    });
  }

  List<Department> departments =[];

  @override
  Widget build(BuildContext context) {
    readDepartmentdata();
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("add Employee"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // the profile screen code
            Container(
              width: mediaquery.width,
              height: mediaquery.height * 0.3,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(100000),
                  onTap: uploadImage,
                  child: Container(
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyTheme.primarycolor,
                      ),
                      height: mediaquery.height*0.25,
                      width: mediaquery.width,
                      child:image == null? Icon(Icons.camera_alt_rounded , color: MyTheme.white, size: 40,):Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: FileImage(image! ),fit: BoxFit.contain),
                          color: Colors.transparent,
                        ),
                      )
                  ),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  // Department ID
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Department ID",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      validator: (value) {
                        for (int i =0 ; i< departments.length ; i++){
                          if(departments[i].DepartmentID.toString() == value){
                            return null;
                          }
                        }
                        return "invalied Department Id" ;
                      },
                      onChanged: (val) {
                        employee.EmployeeDepartment = int.parse(val);
                        setState(() {
                        });
                      },
                    ),
                  ),
                  // name
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Employee Name",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeName = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  // email
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Email",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeEmail = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "User Name",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeUserName = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Password",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeePassword = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Gender",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeGender = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Age",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeAge = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "NationalID",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeNationalID = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Phone Number",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeePhoneNumber = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Country",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeCountry = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "City",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeCity = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Address",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeAddress=val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Nationality",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeNationality = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Salary",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeSalary = double.parse(val);
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Banking Inforamtion",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeBankingInforamtion = val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          label: Text( "Graduation State ",
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:const BorderSide(color: Colors.white, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:const BorderSide(width: 1, color: MyTheme.primarycolor),
                              borderRadius: BorderRadius.circular(10))),
                      cursorColor: MyTheme.primarycolor,
                      onChanged: (val) {
                        employee.EmployeeGraduationState =val;
                        setState(() {
                        });
                      },
                    ),
                  ),
                  //
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    width: mediaquery.width,
                    child: ElevatedButton(
                      onPressed: (){
                        final isvalidform = formKey.currentState!.validate();
                        if( isvalidform ){
                          SqlDb.insertData("INSERT INTO 'Employee' ('EmployeeName' , 'EmployeeDepartment' , 'EmployeeUserName' , 'EmployeePassword' , 'EmployeeGender' , 'EmployeeAge' , 'EmployeeNationalID' , 'EmployeePhoneNumber' , 'EmployeeCountry' ,'EmployeeCity' , 'EmployeeAddress' ,'EmployeeNationality' , 'EmployeeSalary' , 'EmployeeBankingInforamtion' , 'EmployeeGraduationState' , 'Image') VALUES ('${employee.EmployeeName}', '${employee.EmployeeDepartment}','${employee.EmployeeEmail}','${employee.EmployeeUserName}','${employee.EmployeePassword}','${employee.EmployeeGender}','${employee.EmployeeAge}','${employee.EmployeeNationalID}','${employee.EmployeePhoneNumber}','${employee.EmployeeCountry}','${employee.EmployeeCity}','${employee.EmployeeAddress}','${employee.EmployeeNationality}','${employee.EmployeeSalary}','${employee.EmployeeBankingInforamtion}','${employee.EmployeeGraduationState}','${img64}' )");
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add Car",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          )
                      ),
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
  readDepartmentdata ()async{
    List<Map<String , dynamic>> response = await SqlDb.readData("SELECT * FROM 'Department'");
    departments = List.generate(response.length, (index) {
      return Department(
        DepartmentID: response[index]['DepartmentID'],
        DepartmentName: response[index]['DepartmentName'],
        DepartmentLocation: response[index]['DepartmentLocation'],
        DepartmentStartDate: response[index]['DepartmentStartDate'],
      );
    });
  }
}
