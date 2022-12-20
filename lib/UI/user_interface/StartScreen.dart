
import 'package:app/FireBase_FireStore_DataBase/My_DataBase.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/regestration/createaccount.dart';
import 'package:app/UI/user_interface/regestration/loginpage.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String routeName= '/' ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/bg.jpg", ),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70,),
            Text("Are You Ready ?" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 30 , color: Colors.black87 ),textAlign: TextAlign.center, ),
            SizedBox(height: 20,),
            Text("Time To Pick You Car" , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24 , color: Colors.black87 ),textAlign: TextAlign.center, ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child:  ElevatedButton(
                        onPressed: (){
                          Navigator.popAndPushNamed(context, CreateAccount.routeName);
                        },
                        child: Text('Sign up' , style: Theme.of(context).textTheme.headline2,),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                        ),
                      ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child:  ElevatedButton(
                        onPressed: (){

                          Navigator.popAndPushNamed(context, LoginPage.routeName);
                        },
                        child: Text('Sign in' , style: Theme.of(context).textTheme.headline2,),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)))
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
