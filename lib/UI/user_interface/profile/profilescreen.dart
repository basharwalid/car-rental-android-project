import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditProfileScreen.dart';

class ProfleScreen extends StatelessWidget {
  static const String routeName = 'profile screen';

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<userprovider>(context).user;
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.lightbule,
            MyTheme.white,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:const Text('View Profile'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:const EdgeInsets.all(20),
              padding:const EdgeInsets.all(20),
              height: mediaquery.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-3,3),
                    blurRadius: 10,
                  ),
                ],
                color: MyTheme.white,
              ),
              child: Column(
                children: [

                  // the image
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: mediaquery.height * 0.2,
                    decoration: BoxDecoration(
                      color: MyTheme.primarycolor,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(user.Iamge ),fit:BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 0,
                    color: MyTheme.primarycolor,
                  ),
                  Row(
                    children: [
                      Text(" Name : " , style: Theme.of(context).textTheme.headline1,),
                      Text(user.Name , style: Theme.of(context).textTheme.headline1,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(" Email : " , style: Theme.of(context).textTheme.headline1,),
                      Text(user.Email , style: Theme.of(context).textTheme.headline1,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(" Phone Number : " , style: Theme.of(context).textTheme.headline1,),
                      Text(user.PhoneNumber , style: Theme.of(context).textTheme.headline1,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(" Country : " , style: Theme.of(context).textTheme.headline1,),
                      Text(user.Country , style: Theme.of(context).textTheme.headline1,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, EditProfileScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit_rounded , color: MyTheme.white,),
                        SizedBox(width: 10,),
                        Text("Edit" , style: Theme.of(context).textTheme.headline2,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
