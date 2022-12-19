import 'dart:io';
import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../FireBase_FireStore_DataBase/My_DataBase.dart';
import '../../../utils/Dialogs_utils_class.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = "create account";

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  User user = User(
      id: "",
      Name: '',
      Email: '',
      Password: '',
      PhoneNumber: '',
      Country: '',
      Iamge: ''
  );
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
  final formKey = GlobalKey<FormState>();

  TextEditingController UserName  = TextEditingController();
  TextEditingController Email  = TextEditingController();
  TextEditingController Password  = TextEditingController();
  TextEditingController re_Password  = TextEditingController();
  TextEditingController PhoneNumber  = TextEditingController();
  TextEditingController Country  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Account'),
          elevation: 0,
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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // User Name
                    Container(
                      margin :const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        controller: UserName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            label: Text( "User Name ",
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
                          if (value == null || value.isEmpty )
                            return 'Enter a valid User Name address';
                          else
                            return null;
                        },

                      ),
                    ),
                    // Email
                    Container(
                      margin :const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        controller: Email,
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

                      ),
                    ),
                    // Password
                    Container(
                      margin :const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: Password,
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
                      ),
                    ),
                    //Confirm Password
                    Container(
                      margin :const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        controller: re_Password,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            label: Text( "Confirm Password",
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
                          if (re_Password.text != Password.text ) {
                            print(re_Password.text);
                            print(Password.text);
                            return 'invalid';
                          }
                          return null;
                        },
                      ),
                    ),
                    // Phone Number
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        controller: PhoneNumber,
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

                      ),
                    ),
                    // Country
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      child: TextFormField(
                        controller: Country,
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
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Invalid Country';
                          }
                          return null;
                        },

                      ),
                    ),

                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                      width: mediaquery.width,
                      child: ElevatedButton(
                        onPressed: ()async{
                          final isvalidform = formKey.currentState!.validate();
                          if (isvalidform){
                            user.Name = UserName.text;
                            user.Email = Email.text;
                            user.Password = Password.text;
                            user.PhoneNumber = PhoneNumber.text;
                            user.Country = Country.text;
                            DialogUtils.showDialogeMessage(Message: "Loading...", context: context);
                            try{
                              await insertdata();
                              DialogUtils.hideDialogMessage(context: context);
                              DialogUtils.showMessage(message: "Account Created", context: context ,
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
                        child: Text("Create Account",style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
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
        user.Iamge = url;
      }
      await MyDataBase.insertUserData(user);
    }
  }
}
