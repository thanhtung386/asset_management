import 'package:flutter/material.dart'; 

import 'package:flutter/services.dart'; 

import 'nhap_data.dart'; 

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; 

import 'ket_qua.dart'; 

 

class quan_li_tai_san extends StatefulWidget{ 

  @override 

  quan_li_tai_sanState createState() => quan_li_tai_sanState(); 

} 

class quan_li_tai_sanState extends State<quan_li_tai_san>{ 

        String _scanBarcode_check = ''; 

  Future<void> scanQR() async { 

    String barcodeScanRes; 

    try { 

      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( 

          '#ff6666', 'Cancel', true, ScanMode.BARCODE); 

    } on PlatformException { 

      barcodeScanRes = 'Failed to get platform version.'; 

    } 

 

    if (!mounted) return ; 

 

    setState(() {  

      _scanBarcode_check = barcodeScanRes;  

      Navigator.push(  

                context, 

                MaterialPageRoute( 

                  builder: ((context){ 

                    return ket_qua(barcode: _scanBarcode_check,); 

                  }) 

                ), 

              ); 

    }); 

  } 

 

  @override 

  Widget build(BuildContext context){ 

    return Scaffold( 

      appBar: AppBar( 

        title: const Text("Trần Thanh Tùng - 20119386"), 

        centerTitle: true, 

      ), 

      body: Column( 

        mainAxisAlignment: MainAxisAlignment.center, 

        children: [ 

          Image.asset('img/qlts.png',width: 250,height: 250,), 

          Row( 

            mainAxisAlignment: MainAxisAlignment.spaceAround, 

            children: [ 

              SizedBox( 

                height: 50, 

                width: 120, 

              child: ElevatedButton( 

              onPressed: () { 

                Navigator.push( 

                  context, 

                  MaterialPageRoute( 

                    builder: ((context){ 

                      return nhap_data(); 

                    }) 

                  ), 

                ); 

              }, 

              child: const Text("Nhập Data"), 

            ), 

              ), 

 

          SizedBox( 

            height: 50, 

            width: 120, 

            child: ElevatedButton.icon( 

            onPressed: () => scanQR(), 

            icon: const Icon(Icons.qr_code_scanner_outlined,size: 30,), 

            label: const Text('Check'), 

          ), 

          ),  

 

            ], 

          ), 

       

        ], 

      ), 

    ); 

  } 

} 