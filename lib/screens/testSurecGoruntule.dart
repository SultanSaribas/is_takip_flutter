import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/denemeDbProcess.dart';
import 'package:is_takip_flutter/screens/process_add.dart';
import 'package:is_takip_flutter/screens/surecDuzenle_test.dart';

class surecTest extends StatefulWidget {
  @override
  _surecTestState createState() => _surecTestState();
}

class _surecTestState extends State<surecTest> {
  int i = 0;
  var surecler = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String processId = "process_test_";
  Future<String> _readDoc;

  @override
  void initState() {
    super.initState();
    _readDoc = _tumDocOku();
    //_surecYenile();
    //_tumDocOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test Süreçlerim"),
        actions: <Widget>[
          IconButton(
            tooltip: "Düzenlemek için tıklayın",
            highlightColor: Colors.cyan,
            icon: Icon(Icons.create), 
            onPressed: (){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => SurecDuzenleTest()));
              
            })
            ],
      ),
      body: FutureBuilder(
          future: _readDoc,
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
                return Center(
                  child: Column(children: <Widget>[
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
                                        fontSize: 16.0,
                                        color: Colors.grey.shade800),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProcessAdd()));
                                  } //_yazdir,
                                  ),
                            );
                          }),
                    ),
                    RaisedButton(
                        color: Colors.blue.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                        onPressed: () {},
                        child: Text(
                          "Süreçleri Düzenle",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ]),
                );
            }
          }),
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

  // ignore: missing_return
  Future<String> _tumDocOku() async {
    String eklenecek;
    await _firestore
        .collection("/company/company_test_2/process")
        .get()
        .then((querysnapshot) {
      debugPrint("process koleksiyonundaki eleman sayisi:" +
          querysnapshot.docs.length.toString());
      for (int i = 0; i < querysnapshot.docs.length; i++) {
        eklenecek = querysnapshot.docs[i].data()["processName"].toString();
        surecler.add(eklenecek);
        //debugPrint(querysnapshot.docs[i].data()["name"].toString()); //tüm dataların sadece name verisini oku
      }
    });
  }
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


// EKRANDAKİ YENİLE BUTONLARI KODLARI,  KARIŞIKLIĞI ÖNLEMEK ADINA BURAYA ALINDI!

/*              RaisedButton(
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
                        setState(() {
                          _tumDocOku();
                        });
                      },
                      color: Colors.blue.shade100,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    */
