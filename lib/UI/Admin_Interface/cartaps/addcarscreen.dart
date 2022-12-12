import 'dart:io';
import 'dart:math';
import 'dart:core';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddCerScreen extends StatefulWidget {
  static const String routeName = 'add car screen' ;

  @override
  State<AddCerScreen> createState() => _AddCerScreenState();
}

class _AddCerScreenState extends State<AddCerScreen> {
  final car_brand_items  = ['Car Brand', 'Tesla' , 'BMW', 'Ferrari', 'Ford' , 'Porsche' ,'Honda' , 'Lamborghini' , 'Toyota' , 'Bentley' , 'Audi' , 'Jeep' , 'Hyundai' , 'Jaguar' , 'Nissan' ,'Mercedes-Benz'];
  String? car_brand = 'Car Brand';
  final transmition_type_items = ["Automatic" , "Manual"];
  String? transmition_type = 'Automatic';

  File? image;
  final imagepicker = ImagePicker();

  uploadImage() async {
    XFile? pickedImage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    image = File(pickedImage.path);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter The New Car Data"),
      ),
      body: Column(
        children: [
          // the profile screen code
          Container(
            width: mediaquery.width,
            height: mediaquery.height * 0.4,
            decoration: BoxDecoration(
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
                  height: mediaquery.height*0.35,
                  width: mediaquery.width,
                  child:image == null? Icon(Icons.camera_alt_rounded , color: MyTheme.white, size: 40,):Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: FileImage(image! ),fit: BoxFit.cover),
                    ),
                  )
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(

                child: Form(
                  child: ListView(
                    children: [
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Car ID",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Color",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      // drop down
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: car_brand,
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight:FontWeight.w500),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: car_brand_items.map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                            onChanged: (value) => setState(() {this.car_brand = value;}),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20 , ),
                        margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width:2 , color: MyTheme.primarycolor),
                          borderRadius: BorderRadius.circular(1000)
                        ),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Car Model",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Engine Capacity",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Horse Power",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000)),
                              label: Text(
                                "Max Speed",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(
                                  horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                      MyTheme.primarycolor),
                                  borderRadius:
                                  BorderRadius.circular(
                                      1000))),
                          cursorColor: MyTheme.primarycolor,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: transmition_type,
                            style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20, fontWeight:FontWeight.w500),
                            dropdownColor: MyTheme.white,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(Icons.add, color: MyTheme.primarycolor,),
                            items: transmition_type_items.map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                            onChanged: (value) => setState(() {this.transmition_type = value;}),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20 , ),
                        margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(width:2 , color: MyTheme.primarycolor),
                            borderRadius: BorderRadius.circular(1000)
                        ),
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
