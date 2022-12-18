import 'dart:io';

import 'package:app/UI/theme/themedatafile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = "create account";

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  File? image;

  XFile? pickedImage ;

  final imagepicker = ImagePicker();

  UploadTask? uploadTask ;

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
    var mediaqurue = MediaQuery.of(context).size;
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/login background.png"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: mediaqurue.height*0.8,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyTheme.white,
              ),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    Container(
                      width: mediaqurue.width,
                      height: mediaqurue.height * 0.3,
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
                              height: mediaqurue.height*0.25,
                              width: mediaqurue.width,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
