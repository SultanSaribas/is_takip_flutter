import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/screens/surec_ekle.dart';

class Surec extends StatefulWidget {
  @override
  _SurecState createState() => _SurecState();
}

class _SurecState extends State<Surec> {
  String surecAdi = "Surec1";
  int i = 0;
  var surecler = [
    "Paca Daraltma",
    "Boy Kısaltma",
    "Elbise Dikme",
    "Gömlek Dikme",
    "Elbise Daraltma"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıtlı Süreçlerim"),
      ),
      body: ListView.builder(
          itemCount: surecler.length,
          itemBuilder: (context, position) {
            return Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 0, top: 10),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  color: Colors.blue.shade50,
                  child: Text(
                    surecler[position],
                    style:
                        TextStyle(fontSize: 16.0, color: Colors.grey.shade800),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SurecEkle()));
                  } //_yazdir,
                  ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //_ekle();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SurecEkle()));
        },
      ),
    );
  }
/*
  void _yazdir() {
    debugPrint("tiklandi");
  }

  void _ekle() {
    debugPrint("floating Button basildi ekle calisti");
    /* for(i=0;i <=surecler.length ; i++){
      debugPrint("for calisiyor");
      debugPrint(surecler[i]);

    }*/
    setState(() {
      surecler.add("yeni sürec/ böyle calismayacak");
    });
  }
  */

}
