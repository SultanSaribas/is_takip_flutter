import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/denemeDbProcess.dart';
import 'package:is_takip_flutter/screens/process_add.dart';
import 'package:is_takip_flutter/screens/satici_giris_test.dart';

class SurecDuzenleTest extends StatefulWidget {
  @override
  _SurecDuzenleTestState createState() => _SurecDuzenleTestState();
}

class _SurecDuzenleTestState extends State<SurecDuzenleTest> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> _readProcess;
  var selectedCurrency;

  @override
  void initState() {
    super.initState();
    _readProcess = _readDocs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Süreç Düzenleme"),
        ),
        body: Container(
          padding: EdgeInsets.all(35),
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection("/company/company_test_2/process")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                Text("Yükleniyor!");
              } else {
                List<DropdownMenuItem> currencyItems = [];
                for (int i = 0; i < snapshot.data.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data.docs[i];
                  currencyItems.add(DropdownMenuItem(
                    child: Text(
                      snap.data()["processName"],
                      style: TextStyle(color: Colors.blue),
                    ),
                    value: snap.data()["processName"],
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      items: currencyItems,
                      onChanged: (currencyValue) {
                        final snackbar = SnackBar(
                            content: Text(
                          "Seçilen süreç $currencyValue ",
                          style: TextStyle(color: Colors.blue),
                        ));
                        Scaffold.of(context).showSnackBar(snackbar);
                        setState(() {
                          selectedCurrency = currencyValue;
                        });
                      },
                      value: selectedCurrency,
                      isExpanded: false,
                      hint: new Text(
                        "Süreç Seçiniz",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ));
  }

  Future<String> _readDocs() async {}
}
