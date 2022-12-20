import 'package:app/FireBase_FireStore_DataBase/car/rent.dart';
import 'package:app/UI/theme/themedatafile.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class QRPage extends StatelessWidget {
  static const String routeName = 'Qr page';

  @override
  Widget build(BuildContext context) {
    Rent rent = ModalRoute.of(context)?.settings.arguments as Rent ;

    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfBarcodeGenerator(
            value: rent.Rentid,
            backgroundColor: Colors.white,
            textAlign: TextAlign.center,
            barColor: MyTheme.primarycolor,
            showValue: false,
            symbology: QRCode(),
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Text("Save this QR Code to Complete the Rent " , style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 22),textAlign: TextAlign.center,)
          )
        ],
      )
    );
  }
}
