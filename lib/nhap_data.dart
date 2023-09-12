import 'package:flutter/material.dart'; 

import 'package:flutter/services.dart'; 

import 'package:firebase_database/firebase_database.dart'; 

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; 

 

class nhap_data extends StatefulWidget{ 

  @override 

  nhap_dataState createState() => nhap_dataState(); 

} 

class nhap_dataState extends State<nhap_data>{ 

    TextEditingController controller_name = TextEditingController(); 

    TextEditingController controller_date = TextEditingController(); 

    TextEditingController controller_price = TextEditingController(); 

    TextEditingController controller_address = TextEditingController(); 

    String _scanBarcode = ''; 

  

Future <void> _write_data(String id, String name, String date, String price, String address) async{ 

DatabaseReference ref = FirebaseDatabase.instance.ref('QL_tai_san/$id'); 

await ref.set({  

  "name": name, 

  "date": date, 

  "price": price, 

  "place": address, 

}); 

} 

 

  Future<void> scanQR() async { 

    String barcodeScanRes; 

    try { 

      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( 

          '#ff6666', 'Cancel', true, ScanMode.QR); 

    } on PlatformException { 

      barcodeScanRes = 'Failed to get platform version.'; 

    } 

    if (!mounted) return; 

 

    setState(() { 

      _scanBarcode = barcodeScanRes; 

    }); 

  } 

   @override 

  Widget build(BuildContext context){ 

    return Scaffold( 

      appBar: AppBar( 

        title: const Text("Nhập dữ liệu"), 

        centerTitle: true, 

      ), 

          resizeToAvoidBottomInset: false,   

      body: Column( 

        crossAxisAlignment: CrossAxisAlignment.center, 

        children: [ 

          Container( 

            margin: const EdgeInsets.all(10), 

            child: TextField( 

              controller: controller_name, 

              decoration: const InputDecoration( 

                border: OutlineInputBorder(), labelText: "Tên", 

              ), 

            ), 

          ), 

 

          Container( 

            margin: const EdgeInsets.all(10), 

            child: TextField( 

              controller: controller_date, 

              decoration: const InputDecoration( 

                border: OutlineInputBorder(), labelText: "Ngày mua", 

              ), 

            ), 

          ), 

          Container( 

            margin: const EdgeInsets.all(10), 

            child: TextField( 

              controller: controller_price, 

              decoration: const InputDecoration( 

                border: OutlineInputBorder(), labelText: "Giá", 

              ), 

            ), 

          ), 

 

          Container( 

            margin: const EdgeInsets.all(10), 

            child: TextField( 

              controller: controller_address, 

              decoration: const InputDecoration( 

                border: OutlineInputBorder(), labelText: "Địa chỉ", 

              ), 

            ), 

          ), 

          Row( 

            crossAxisAlignment: CrossAxisAlignment.center, 

            mainAxisAlignment: MainAxisAlignment.center, 

            children: [ 

          ElevatedButton.icon( 

            onPressed: () => scanQR(), 

            icon: const Icon(Icons.qr_code, size: 40), 

            label: const Text("Quét mã"), 

          ),    

          Text('  $_scanBarcode',style: const TextStyle( 

            fontSize: 20 

          ),)            

            ], 

          ), 

          ElevatedButton.icon( 

            onPressed: () {_write_data(_scanBarcode,controller_name.text,controller_date.text,controller_price.text,controller_address.text);}, 

            icon: const Icon(Icons.done_all_outlined, size: 50,), 

            label: const Text("Xác nhận"), 

          ), 

        ], 

      ), 

    ); 

  } 

}