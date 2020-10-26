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
  //bool isSwitched = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  int i = 0;
  List<bool> payment = [false, false, false, false, false, false];
  var customerNames = [
    "Sultan",
    "Esra",
    "Atakan",
    "Eylül",
    "Emre",
    "Burak",
  ];
  var siparisler = [
  ];
  String eklenecek;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Satıcı Giriş Sayfası",
        ),
      ),
      body: ListView.builder(
        itemCount: siparisler.length,
        itemBuilder: (context, position) {
          return Column(children: <Widget>[
            Container(
              color: Colors.yellow.shade50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text("\n" + siparisler[position]),
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
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      RaisedButton(
                        child: Text("dene"),
                        onPressed: () {
                          _yazdir();
                        },
                        color: Colors.blue.shade100,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _siparisleriGetir();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _yazdir() {
    for (i = 0; i <= payment.length - 1; i++) {
      debugPrint(payment[i].toString());
    }
  }
  void _siparisleriGetir()  {
    String eklenecek ;
    _firestore.collection("/company/company_test_2/services").get().then((querysnapshot){
      debugPrint("services koleksiyonundaki eleman sayisi:" + querysnapshot.docs.length.toString());
      for(int i=0 ; i<querysnapshot.docs.length ; i++){
        eklenecek=querysnapshot.docs[i].data()["note"].toString();
        siparisler.add(eklenecek);
        //debugPrint(querysnapshot.docs[i].data()["name"].toString()); //tüm dataların sadece name verisini oku
      }
    });
  }
}
