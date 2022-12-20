import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/UI/Admin_Interface/Admin_home_Screen.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/home_screen.dart';
import 'package:app/UI/user_interface/regestration/createaccount.dart';
import 'package:app/userprovider.dart';
import 'package:app/utils/Dialogs_utils_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  List<User> users_list = [];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var mediaquere = MediaQuery.of(context).size;
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    return StreamBuilder(
      stream: MyDataBase.getUserData(),
      builder: (context, snapshot) {
        var userslist = snapshot.data?.docs.map((doc) => doc.data()).toList();
        return Container(
          decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/login background.png", ),fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  padding:const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
                  decoration: BoxDecoration(
                    color: MyTheme.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Form(

                    child: Column(
                      children: [
                        Image.asset("assets/login title.png" , height: mediaquere.height*0.1,),
                        // Email
                        SizedBox(height: 40,),
                        Container(
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
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: Password,
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
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){}, child: Text('Forget Password?')),
                          ],
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: (){
                            for (int i =0 ; i < userslist!.length ;i++){
                              print(userslist[i].Email);
                              if (Email.text == userslist[i].Email){
                                if (Password.text == userslist[i].Password){
                                  Provider.of<userprovider>(context , listen: false).setactiveuser(userslist[i]);
                                  Navigator.popAndPushNamed(context, User_Home_screen.routeName);
                                  return;
                                }
                              }
                            }
                            if(Email.text == 'Messi@win.com' && Password.text == 'messi'){
                              Navigator.popAndPushNamed(context, AdminHomeScree.routeName);
                              return ;
                            }

                            DialogUtils.showMessage(message: "Invalid Account", context: context ,isdeismessable: true ,posActiontitle: "ok" ,posAction: () {},);
                          },
                          child: Text('Login Page' , style: Theme.of(context).textTheme.headline2,),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                              fixedSize: MaterialStateProperty.all(Size.fromWidth(mediaquere.width)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have Account"),
                            TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, CreateAccount.routeName);
                                },
                                child: Text('Create Account')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void readdata()async {
  //   userslist = await MyDataBase.listofusers();
  //   print(userslist.length);
  //   setState(() {
  //   });
  // }
}
