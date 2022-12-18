import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/regestration/createaccount.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'loginpage';

  @override
  Widget build(BuildContext context) {
    var mediaquere = MediaQuery.of(context).size;
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/login background.png", ),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
              child:Column(
                children: [
                  Image.asset("assets/login title.png" , height: mediaquere.height*0.1,),
                  // Email
                  SizedBox(height: 40,),
                  Container(
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

                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
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
                    onPressed: (){},
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
          ],
        ),
      ),
    );
  }
}
