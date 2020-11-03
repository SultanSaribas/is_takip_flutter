import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SurecEkleDb extends StatefulWidget {
  @override
  _SurecEkleDbState createState() => _SurecEkleDbState();
}

class _SurecEkleDbState extends State<SurecEkleDb> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String surec = "Surec1";
  int i = 0;
  int adimSayar = 0;
  var surecAdimlar = [];
  var surecAdim = ["test"];
  Map<String, dynamic> eklenen = Map();
  Map<String, dynamic> steps = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Süreç db ekle test"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("db ekle"),
            onPressed: _dbEkle,
            color: Colors.blue.shade100,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          RaisedButton(
            child: Text("yazdir"),
            onPressed: _dbYazdir,
            color: Colors.blue.shade100,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 30),
            child:
                Text("Önce Süreç Adını Daha Sonra Adımları Girerek Kaydedin"),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "Süreç Adını Giriniz",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (s) {
                  eklenen["processName"] = s;
                },
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: surecAdimlar.length,
                  itemBuilder: (context, position) {
                    return Padding(
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          margin: EdgeInsets.only(left: 60, right: 60),
                          child: TextField(
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLength: 50,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "Adım ismini giriniz",
                              labelText: surecAdimlar[position],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (k) {
                              surecAdimlar[position] = k;
                              steps["adim $position"] = k;
                            },
                          ),
                        ));
                  })),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _ekle("yeni adım");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _ekle(String a) {
    debugPrint("floating Button basildi ekle calisti");
    setState(() {
      surecAdimlar.add(a);
      adimSayar++;
    });
  }

  void _dbEkle() async {
    
    int temp; //kontrol için
    eklenen["steps"] = steps;
    _firestore
        .collection("/company/company_test_2/process")
        .get()
        .then((querysnapshot) {
      for (int i = 0; i < querysnapshot.docs.length; i++) {
        if (eklenen["processName"] !=
            querysnapshot.docs[i].data()["processName"].toString()) {
          temp = 1;
        } else {
          temp = 0;
        }
      }
      if (temp == 1) {
        _firestore
            .collection("/company/company_test_2/process")
            .doc()
            .set(eklenen)
            .then((v) => debugPrint("data eklendi"));
        
      } else {
        debugPrint(" sürec ismi kullanılıyor ");
      }
    });
  }

  void _dbYazdir() async {
    DocumentSnapshot docsnap =
        await _firestore.doc("/company/company_test_2/process").get();
    debugPrint(docsnap.data()["processName"].toString());
    debugPrint(docsnap.toString());
  }
}

class DenemeWidget extends StatefulWidget {
  @override
  _DenemeWidgetState createState() => _DenemeWidgetState();
}

class _DenemeWidgetState extends State<DenemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
