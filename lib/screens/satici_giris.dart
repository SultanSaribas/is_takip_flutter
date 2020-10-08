import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaticiGiris extends StatefulWidget {
  @override
  _SaticiGirisState createState() => _SaticiGirisState();
}

class _SaticiGirisState extends State<SaticiGiris> {
  //bool isSwitched = false;
  var customerID = "12";
  List<bool> payment = [true, false, true, true, true, false];
  var customerNames = [
    "Sultan",
    "Esra",
    "Atakan",
    "Eylül",
    "Emre",
    "Burak",
  ];
  var lastDates = [
    "26/10/2020",
    "29/10/2020",
    "30/10/2020",
    "02/11/2020",
    "05/11/2020",
    "10/11/2020",
  ];

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
        itemCount: lastDates.length,
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
                          Text(customerID),
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
                      Text("\n" + lastDates[position]),
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
                backgroundColor: Colors.yellow.shade100,
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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
