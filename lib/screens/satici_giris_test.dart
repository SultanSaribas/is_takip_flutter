import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'customer_add.dart';

class SaticiGirisTest extends StatefulWidget {
  @override
  _SaticiGirisTestState createState() => _SaticiGirisTestState();
}

class _SaticiGirisTestState extends State<SaticiGirisTest> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int i = 0;
  List<bool> payment = [];
  var notes = [];
  var customerNames = [];
  var tempCustomerID= [];
  //var customerNames = [];
  //var notes = [];
  //var customersID= [];
  //var tempCustomersName= [];


  String tempCID;
  int countServices;
  //Future<void>_siparisleriGetir() async {
  _siparisleriGetir() async {
    String eklenecek;
    await _firestore
        .collection("/company/company_test_2/services")
        .get()
        .then((querysnapshot) {
      debugPrint("services koleksiyonundaki eleman sayisi:" +
          querysnapshot.docs.length.toString());
      countServices=querysnapshot.docs.length;
      for (int i = 0; i < querysnapshot.docs.length; i++) {
        eklenecek = querysnapshot.docs[i].data()["note"].toString();
        notes.add(eklenecek);
        payment.add(false);
        customerNames.add("ahmet");
        tempCustomerID.add(querysnapshot.docs[i].data()["customersID"].toString());
        //debugPrint(querysnapshot.docs[i].data()["name"].toString()); //tüm dataların sadece name verisini oku
      }
    });
    customerNames.clear();
    await _firestore
        .collection("/company/company_test_2/customers")
        .get()
        .then((querysnapshot) {
      debugPrint("customers koleksiyonundaki eleman sayisi:" +
          querysnapshot.docs.length.toString());
     
      for(int j = 0; j < countServices; j++){
        for (int k = 0; k < querysnapshot.docs.length; k++) {
          if(tempCustomerID[j]==querysnapshot.docs[k].id){
            eklenecek = querysnapshot.docs[k].data()["name"].toString();
            customerNames.add(eklenecek);
          }


          //debugPrint(querysnapshot.docs[i].data()["name"].toString()); //tüm dataların sadece name verisini oku
        }
      }
    });
  }

  //@override
 // void initState() {
   // super.initState();
   // _siparisleriGetir();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Satıcı Giriş Sayfası",
        ),
      ),
      body: FutureBuilder(
          future: _siparisleriGetir(),
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("None");
              case ConnectionState.active:
                return Text("aktif");
              case ConnectionState.waiting:
                return LinearProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                  backgroundColor: Colors.blue,
                );
              case ConnectionState.done:
                return ListView.builder(
                  itemCount: customerNames.length,
                  itemBuilder: (context, position) {
                    return Column(children: <Widget>[
                      Container(
                        color: Colors.yellow.shade50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Divider(height: 46.0),
                                    Text(customerNames[position]),
                                  ]),
                              Column(children: <Widget>[
                                Divider(height: 36.0),
                                Text(
                                  "\nPaça \nDaraltma",
                                ),
                              ]),
                              Column(children: <Widget>[
                                Divider(height: 36.0),
                                Text(
                                  "\n" + notes[position],
                                ),
                                Text(
                                    "Devam Ediyor"), // durum bilgisi çekilecek veritabanından
                              ]),
                              Column(children: <Widget>[
                                Switch(
                                  // BİRİ TIKLANINCA HEPSİ TETİKLENİYOR!!!!!!!!
                                  value: payment[position],
                                  onChanged: (value) {
                                    setState(() {
                                      payment[position] = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                RaisedButton(
                                  child: Text("İLERLE"),
                                  onPressed: () {},
                                  color: Colors.blue.shade100,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                                RaisedButton(
                                  child: Text("dene"),
                                  onPressed: () {
                                    _yazdir();
                                  },
                                  color: Colors.blue.shade100,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ]),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.yellow.shade50,
                        child: ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Text(
                            "Detay",
                            style: TextStyle(color: Colors.teal),
                          ),
                          backgroundColor: Colors.yellow.shade50,
                          //tilePadding: EdgeInsets.all(10),
                          children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Müşteri hakkında bilgiler"),
                                  Text("İletişim Bilgileri"),
                                  IconButton(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {}, // yönlendirme eklenecek
                                  )
                                ])
                          ],
                        ),
                      )
                    ]);
                  },
                );
            }
          }),
    );
  }

  void _yazdir() {
    for (i = 0; i <= payment.length - 1; i++) {
      debugPrint(payment[i].toString());
    }
  }
}
