import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/FireBase_FireStore_DataBase/car/rent.dart';
import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:app/UI/user_interface/taps/QRpage.dart';
import 'package:app/userprovider.dart';
import 'package:app/utils/Dialogs_utils_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../FireBase_FireStore_DataBase/My_DataBase.dart';

class PaymentPage extends StatefulWidget {
  static const String routeName = 'payment method';

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController NameOnCard = TextEditingController();

  TextEditingController NumberOncard = TextEditingController();

  TextEditingController cvvCode = TextEditingController();

  TextEditingController expiryDate = TextEditingController();

  TextEditingController Duration = TextEditingController();

  Rent rent = Rent(Rentid: '', Carid: '', Userid: '', Departmentid: '' , payment: 0);

  @override
  Widget build(BuildContext context) {
    Car car = ModalRoute.of(context)?.settings.arguments as Car ;
    User user = Provider.of<userprovider>(context).user;
    var mediaquery  =MediaQuery.of(context).size;
    rent.Carid = car.CarID;
    rent.Departmentid = car.DepartmentID;
    rent.Userid = user.id;
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("${car.ManufacturCompany} ${car.CarModel}"),),
        body: Column(
          children: [
            CreditCardWidget(
                cardNumber: NumberOncard.text,
                expiryDate: expiryDate.text,
                cardHolderName: NameOnCard.text,
                cvvCode: cvvCode.text,
                showBackView: false,
                onCreditCardWidgetChange: (value) {},
            ),
            CreditCardForm(
              cardHolderName: NameOnCard.text,
              cardNumber: NumberOncard.text,
              cvvCode: cvvCode.text,
              expiryDate:expiryDate.text ,
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              themeColor: MyTheme.primarycolor ,
              onCreditCardModelChange: (creditCardModel) {
                setState((){

                  NumberOncard.text = creditCardModel!.cardNumber;
                  expiryDate.text = creditCardModel!.expiryDate;
                  NameOnCard.text = creditCardModel!.cardHolderName;
                  cvvCode.text = creditCardModel!.cvvCode;
                });
              },
              cardHolderDecoration:InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label: Text( "Card Holder ",
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
              cardNumberDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label: Text( "Card Number ",
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
              cvvCodeDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label: Text( "cvv ",
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
              expiryDateDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label: Text( "Expiry Date ",
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

            ),
            // Age
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
              child: TextFormField(
                controller: Duration,
                keyboardType:const TextInputType.numberWithOptions(decimal: false , signed: false),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide( width: 1, color: MyTheme.primarycolor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text( "Duration",
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

                  setState(() {
                  });
                },
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () async{
                    rent.payment = calcduration(car.Price);
                    DialogUtils.showDialogeMessage(Message: "Loading...", context: context);
                    try{
                      await insertdata();
                      car.isAvilable = false;
                      await MyDataBase.updatecar(car);
                      DialogUtils.hideDialogMessage(context: context);
                      DialogUtils.showMessage(message: "Payment Done", context: context ,
                          posActiontitle: "Ok" ,
                          posAction: (){
                            Navigator.popAndPushNamed(context, QRPage.routeName , arguments: rent);
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

                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(MyTheme.primarycolor),
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(mediaquery.width)),
                  ),
                  child: Text('Complete Payment' , style: Theme.of(context).textTheme.headline2,)
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> insertdata () async{
    await MyDataBase.insertRentData(rent);
  }
  double calcduration (double price){
    double duration = double.parse(Duration.text);
    double total =  duration * price;
    return total ;
  }
  }
