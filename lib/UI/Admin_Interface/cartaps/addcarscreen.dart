import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/UI/Admin_Interface/Admin_home_Screen.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../FireBase_FireStore_DataBase/car/car.dart';
import '../../../utils/Dialogs_utils_class.dart';

class AddCerScreen extends StatefulWidget {
  static const String routeName = 'add car screen' ;

  @override
  State<AddCerScreen> createState() => _AddCerScreenState();
}

class _AddCerScreenState extends State<AddCerScreen> {
  MyDataBase db = MyDataBase();

  File? image;
  XFile? pickedImage ;
  final imagepicker = ImagePicker();
  UploadTask? uploadTask ;

  Car car = Car(
      CarID: "",
      DepartmentID: "",
      Color: "Color",
      ManufacturCompany: "ManufacturCompany",
      CarModel: "CarModel",
      HorsePower:"HorsePower",
      MaximumSpeed: "MaximumSpeed",
      TransmissionType: "TransmissionType",
      YearModel:"YearModel",
      Seats: "Seats",
      Price: 0,
      Image: ""
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
  // cars list
  final Car_makers_name_list = [
    'All Brands' , 'Abarth' , 'Alfa Romeo' , 'Aston Martin' , 'Audi' , 'Bentley' ,
    'BMW' , 'Bugatti' , 'Cadillac' , 'Caterham' , 'Chery' , 'Chevrolet' , 'Chrysler' , 'Citroen' , 'Daewoo' , 'Daihatsu' ,
    'Datsun' , 'Dodge' , 'Ferrari' , 'Fiat' , 'Ford' , 'Genesis' , 'Great Wall' , 'Haval' , 'Holden' , 'Honda' ,
    'Hyundai' , 'Infiniti' , 'Isuzu UTE' , 'Jaguar' , 'Jeep' , 'Kia' , 'Lamborghini' , 'Land Rover' , 'LDV' ,
    'Lexus' , 'Lotus' , 'Maserati' , 'Mazda' , 'McLaren' , 'Mercedes-Benz' , 'MG' , 'Mini' , 'Mitsubishi' ,
    'Nissan' , 'Opel' , 'Peugeot' , 'Porsche' , 'Proton' , 'Renault' , 'Rolls Royce' , 'Saab' , 'ŠKODA' ,
    'Smart' , 'SsangYong' , 'Subaru' ,  'Suzuki' ,  'Tesla' ,  'Toyota' , 'Volkswagen' , 'Volvo'
  ];
  String Car_Maker = 'All Brands' ;
  // the transition type
  final Transmission_Type_List = ['Automatic' , 'Manual'];
  String Transmition_type = 'Automatic' ;
  // the transition type
  final Year_List = ['Year' , '2000' , '2001', '2002', '2003', '2004' , '2005', '2006', '2007', '2008'
    , '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020'
    , '2021', '2022'
  ];
  String Year = 'Year' ;
  // the transition type
  final Seats_list = ['Seats' , '2' , '3', '4', '5', '6' , '7' ];
  String Seats = 'Seats' ;

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
                // Color
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "Color",
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
                      car.Color = val;
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
                      car.DepartmentID = val;
                      setState(() {
                      });},
                  ),
                ),
                // car brand
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Car_Maker,
                      style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                      dropdownColor: MyTheme.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                      items: Car_makers_name_list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        car.ManufacturCompany = value! ;
                        this.Car_Maker = value!;
                      }
                      ),
                    ),
                  ),
                ),
                // Car Model
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "Car Model",
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
                      car.CarModel = val ;
                      },
                  ),
                ),
                // Horse Power
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "Horse Power",
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
                      }},
                    onChanged: (val) {
                      car.HorsePower = val;
                      },
                  ),
                ),
                // Maximum Speed
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "Maximum Speed",
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
                      }},
                    onChanged: (val) {
                      car.MaximumSpeed = val;
                      },
                  ),
                ),
                // Transmition Type
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Transmition_type,
                      style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                      dropdownColor: MyTheme.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                      items: Transmission_Type_List.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        car.TransmissionType = value! ;
                        this.Transmition_type = value!;
                      }),
                    ),
                  ),
                ),
                // year
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Year,
                      style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                      dropdownColor: MyTheme.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                      items: Year_List.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        car.YearModel = value!;
                        this.Year = value!;
                      }),
                    ),
                  ),
                ),
                // Seats
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1 ,color: MyTheme.primarycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: Seats,
                      style: Theme.of(context).textTheme.headline1?.copyWith(color: MyTheme.primarycolor , fontWeight: FontWeight.w400),
                      dropdownColor: MyTheme.white,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon:const Icon(Icons.add, color: MyTheme.primarycolor,),
                      items: Seats_list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {
                        car.Seats = value!;
                        this.Seats= value!;
                      }),
                    ),
                  ),
                ),
                // price
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: Text( "Price",
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
                      }},
                    onChanged: (val) {
                      car.Price = double.parse(val);
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
                          DialogUtils.showMessage(message: "Car Updated Sucsessfuly", context: context ,
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
                    child: Text("Add Car",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
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
        car.Image = url;
      }
      await MyDataBase.insertCarData(car);
    }
  }
}
