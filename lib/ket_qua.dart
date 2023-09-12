import 'package:barcode_widget/barcode_widget.dart'; 

import 'package:flutter/material.dart'; 

import 'package:firebase_database/firebase_database.dart'; 

 

class ket_qua extends StatelessWidget { 

 

   const ket_qua({required this.barcode}); 

   final String barcode; 

 

Future <String> get_result({required String path}) async{ 

    final ref = FirebaseDatabase.instance.ref('QL_tai_san/$barcode/$path'); 

    DatabaseEvent event = await ref.once(); 

      return event.snapshot.value.toString();  

  }  

 

  @override 

  Widget build(BuildContext context) { 

 

    return Scaffold( 

        appBar: AppBar( 

          title: const Text('Kết quả'), 

          centerTitle: true, 

        ), 

        body: Column( 

          children: [ 

            Row( 

              mainAxisAlignment: MainAxisAlignment.center, 

              children: [ 

                BarcodeWidget( 

            data: barcode, 

            barcode: Barcode.code128(), 

            width: 300, 

            height: 100, 

            ), 

              ], 

            ), 

            Row( 

              children: [ 

          Column( 

            children: [ 

              SizedBox( 

                height: 300, 

                width: 170, 

                child: Column( 

                  children:  [ 

                    Row( 

                      children: const [ 

                        Padding(padding: EdgeInsets.all(20), 

                          child: Icon(Icons.inventory_2_outlined),), 

                        Text("Name", style: TextStyle(fontSize: 20),),],), 

                    Row( 

                      children: const [ 

                        Padding(padding: EdgeInsets.all(20), 

                          child: Icon(Icons.date_range_outlined),), 

                        Text("Date", style: TextStyle(fontSize: 20),),],), 

                    Row( 

                      children: const [ 

                        Padding(padding: EdgeInsets.all(20), 

                          child: Icon(Icons.money),), 

                        Text("Cost", style: TextStyle(fontSize: 20),),],), 

                    Row( 

                      children: const [ 

                        Padding(padding: EdgeInsets.all(20), 

                          child: Icon(Icons.place_outlined),), 

                        Text("Address", style: TextStyle(fontSize: 20),),],),                                                                                            

                  ], 

                ), 

              ),                       

            ], 

          ), 

          Column( 

            crossAxisAlignment: CrossAxisAlignment.end, 

            children: [ 

              SizedBox( 

                height: 300, 

                width: 170, 

                child: Column( 

                  crossAxisAlignment: CrossAxisAlignment.start, 

                  children: [ 

                    Row( 

                      mainAxisAlignment: MainAxisAlignment.start, 

                      children: [ 

                        Padding( 

                          padding: const EdgeInsets.all(20), 

                          //FutureBuilder tạo 1 widget với giá trị lấy từ Future 

                          child: FutureBuilder( 

                                future: get_result(path: 'name' ), 

                                builder: (BuildContext context,AsyncSnapshot <String> snapshot) { 

                                    if(snapshot.hasData && snapshot.data != 'null') { 

                                      return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 20),); 

                                    }  else if(snapshot.data == 'null') { 

                                      return const Text('No Data',style: TextStyle(fontSize: 20),); 

                                    } 

                                    else if(snapshot.hasError) { 

                                      return const Text('Error',style: TextStyle(fontSize: 20),); 

                                    } else { 

                                      return const Text('Loading',style: TextStyle(fontSize: 20),); 

                                    } 

                                }, 

            ), 

                        ), 

                      ], 

                    ), 

                    Row( 

                      children: [ 

                        Padding( 

                          padding: const EdgeInsets.all(20), 

                          child: FutureBuilder( 

                                future: get_result(path: 'date' ), 

                                builder: (BuildContext context,AsyncSnapshot <String> snapshot) { 

                                    if(snapshot.hasData && snapshot.data != 'null') { 

                                      return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 20),); 

                                    }  else if(snapshot.data == 'null') { 

                                      return const Text('No Data',style: TextStyle(fontSize: 20),); 

                                    } else if(snapshot.hasError) { 

                                      return const Text('Error',style: TextStyle(fontSize: 20),); 

                                    } else { 

                                      return const Text('Loading',style: TextStyle(fontSize: 20),); 

                                    } 

                                }, 

            ), 

                        ), 

                      ], 

                    ),  

                    Row( 

                      children: [ 

                        Padding( 

                          padding: const EdgeInsets.all(20), 

                          child: FutureBuilder( 

                                future: get_result(path: 'price' ), 

                                builder: (BuildContext context,AsyncSnapshot <String> snapshot) { 

                                    if(snapshot.hasData && snapshot.data != 'null') { 

                                      return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 20),); 

                                    }  else if(snapshot.data == 'null') { 

                                      return const Text('No Data',style: TextStyle(fontSize: 20),); 

                                    } else if(snapshot.hasError) { 

                                      return const Text('Error',style: TextStyle(fontSize: 20),); 

                                    } else { 

                                      return const Text('Loading',style: TextStyle(fontSize: 20),); 

                                    } 

                                }, 

            ), 

                        ), 

                      ], 

                    ),  

                    Row( 

                      children: [ 

                        Padding( 

                          padding: const EdgeInsets.all(20), 

                          child: FutureBuilder( 

                                future: get_result(path: 'place' ), 

                                builder: (BuildContext context,AsyncSnapshot <String> snapshot) { 

                                    if(snapshot.hasData && snapshot.data != 'null') { 

                                      return Text(snapshot.data.toString(),style: const TextStyle(fontSize: 20),); 

                                    }  else if(snapshot.data == 'null') { 

                                      return const Text('No Data',style: TextStyle(fontSize: 20),); 

                                    } else if(snapshot.hasError) { 

                                      return const Text('Error',style: TextStyle(fontSize: 20),); 

                                    } else { 

                                      return const Text('Loading',style: TextStyle(fontSize: 20),); 

                                    } 

                                }, 

            ), 

                        ), 

                      ], 

                    ),   

                         

                  ], 

                ), 

              ), 

            ], 

          ), 

 

              ], 

            ), 

          ], 

        ) 

   ); 

   } 

} 