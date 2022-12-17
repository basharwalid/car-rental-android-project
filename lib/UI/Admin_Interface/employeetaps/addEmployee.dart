import 'dart:convert';
import 'dart:io';
import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/Dialogs_utils_class.dart';
import '../../theme/themedatafile.dart';

class AddEmployeeSCreen extends StatefulWidget {
  static const String routeName = 'add empl screen' ;

  @override
  State<AddEmployeeSCreen> createState() => _AddEmployeeSCreenState();
}

class _AddEmployeeSCreenState extends State<AddEmployeeSCreen> {
  MyDataBase db = MyDataBase();

  File? image;
  XFile? pickedImage ;
  final imagepicker = ImagePicker();
  UploadTask? uploadTask ;

  Employee employee = Employee(
      EmployeeID: '',
      EmployeeDepartment: 0,
      EmployeeName:'',
      EmployeeEmail: '',
      EmployeePassword:'',
      EmployeeAge:'',
      EmployeeNationalID:'',
      EmployeePhoneNumber:'',
      EmployeeSalary:0,
      Image: ''
  );

  final formKey = GlobalKey<FormState>();

  uploadImage() async {
    // the image in the page
    XFile? picked_Image = await imagepicker.pickImage(source: ImageSource.gallery);
    pickedImage = picked_Image ;
    if (pickedImage == null) return;
    image = File(pickedImage!.path);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter The New Car Data"),
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
                          image: DecorationImage(image: FileImage(image! )),
                          color: Colors.transparent,
                        ),
                      )
                  ),
                ),
              ),
            ),
            Form(key: formKey,
              child: Column(children:[
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
                        label: Text( "Name",
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
                      if (value == null || value.isEmpty){
                        return "Invalid Value it Must not be Empty" ;
                      }
                      else{
                        return null;
                      }},
                    onChanged: (val) {
                      employee.EmployeeName = val;
                      setState(() {
                      });},
                  ),
                ),
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
                      if (value == '1' || value == '2' || value == '3' || value == '4' ){
                        return null ;
                      }
                      return "invalied Department Id" ;
                    },
                    onChanged: (val) {
                      employee.EmployeeID = val;
                      setState(() {
                      });},
                  ),
                ),
                // Email
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
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern);
                      if (value == null || value.isEmpty || !regex.hasMatch(value))
                        return 'Enter a valid email address';
                      else
                        return null;
                      },
                    onChanged: (val) {
                      employee.EmployeeEmail = val;
                      setState(() {
                      });},
                  ),
                ),
                // Password
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
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
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      employee.EmployeePassword = val;
                      setState(() {
                      });},
                  ),
                ),
                // Age
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
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
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Invalid age';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      employee.EmployeeAge = val;
                      setState(() {
                      });},
                  ),
                ),
                // Nationail id
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "National ID ",
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
                      if (value!.trim().isEmpty) {
                        return 'Invalid ID';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      employee.EmployeeNationalID = val;
                      setState(() {
                      });},
                  ),
                ),
                // Phone Number
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
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
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Invalid Phone Number';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      employee.EmployeePhoneNumber = val;
                      setState(() {
                      });},
                  ),
                ),
                // Salary
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
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
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Salary';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      employee.EmployeeSalary = double.parse(val);
                      setState(() {
                      });},
                  ),
                ),


                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  width: mediaquery.width,
                  child: ElevatedButton(
                    onPressed: ()async{

                      final isvalidform = formKey.currentState!.validate();
                      if (isvalidform){
                        DialogUtils.showDialogeMessage(Message: "Loading...", context: context);
                        try{
                          await insertdata();
                          DialogUtils.hideDialogMessage(context: context);
                          DialogUtils.showMessage(message: "Employee added successfully", context: context ,
                              posActiontitle: "Ok" ,
                              posAction: (){
                                Navigator.pop(context);
                              }
                          );
                        }catch(Error){
                          DialogUtils.hideDialogMessage(context: context);
                          DialogUtils.showMessage(message: "Error inserting data", context: context,
                            posAction: () async{
                              await insertdata();
                            },
                            posActiontitle: "Try Again",
                            nigAction: (){
                              Navigator.pop(context);
                            },
                            nigActiontitle: "Cancel",
                            isdeismessable: true ,
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200),
                        )
                    ),
                    child: Text("Add Employee",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
                  ),
                ),
              ],),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> insertdata () async{
    final isvalidform = formKey.currentState!.validate();
    if( isvalidform ){
      if(pickedImage != null){
        final path = 'images/${pickedImage!.name}';
        final file = File(pickedImage!.path);
        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(file);
        final snapshot = await uploadTask!.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();
        employee.Image = url;
      }
      await MyDataBase.insertEmployeeData(employee);
    }
  }
}
