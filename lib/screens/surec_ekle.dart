import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SurecEkle extends StatefulWidget {
  @override
  _SurecEkleState createState() => _SurecEkleState();
}

class _SurecEkleState extends State<SurecEkle> {
  String surec = "Surec1";
  int i = 0;
  int adimSayar = 0;
  var surecAdimlar = [];
  var surecAdim = ["test"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Süreç Ekle/Düzenleee"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
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
    /* for(i=0;i <=surecler.length ; i++){
      debugPrint("for calisiyor");
      debugPrint(surecler[i]);

    }*/
    setState(() {
      surecAdimlar.add(a);
      adimSayar++;
    });
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
