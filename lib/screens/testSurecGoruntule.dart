import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/denemeDbProcess.dart';
import 'package:is_takip_flutter/screens/surec_ekle.dart';

class surecTest extends StatefulWidget {
  @override
  _surecTestState createState() => _surecTestState();
}

class _surecTestState extends State<surecTest> {
  int i = 0;
  var surecler = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String processId ="process_test_";

  @override
  initState()  {
    //_surecYenile();
    _tumDocOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test Süreçlerim"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
            child: Text("yenile"),
            onPressed: () {
              setState(() {
                _tumDocOku();
              });
            },
            color: Colors.blue.shade100,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          RaisedButton(
            child: Text("yeni yenile"),
            onPressed: () {
              _tumDocOku();
              setState(() {

              });
            },
            color: Colors.blue.shade100,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey.shade800),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SurecEkle()));
                        } //_yazdir,
                        ),
                  );
                }),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //_ekle();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SurecEkleDb()));
        },
      ),
    );
  }
  void _tumDocOku()  {
    String eklenecek ;
    _firestore.collection("/company/companyTest_2/process").get().then((querysnapshot){
      debugPrint("process koleksiyonundaki eleman sayisi:" + querysnapshot.docs.length.toString());
      for(int i=0 ; i<querysnapshot.docs.length ; i++){
        eklenecek=querysnapshot.docs[i].data()["processName"].toString();
        surecler.add(eklenecek);
        //debugPrint(querysnapshot.docs[i].data()["name"].toString()); //tüm dataların sadece name verisini oku
      }
    });
  }
  /*void _surecYenile() async {

    DocumentSnapshot docsnap = await _firestore.doc("/company/companyTest_2/process/$processId"+"1").get();
   String eklenecek ;

    debugPrint("deneme calisiyor ");
    int i=1;
    while(docsnap.data()["processName"].toString()!= null){

      docsnap=await _firestore.doc("/company/companyTest_2/process/$processId"+i.toString()).get();
      eklenecek = docsnap.data()["processName"].toString();
      surecler.add(eklenecek);
      i++;
    }
    debugPrint("whiledan çıktım ben");
  }*/
}
