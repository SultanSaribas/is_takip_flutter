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
  var processSteps = [];
  String tempProcess;

  @override
  void initState() {
    super.initState();
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
                  value: snap.data()["processID"],
                ));
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton(
                    items: currencyItems,
                    onChanged: (currencyValue) {
                      final snackbar = SnackBar(
                          content: Text(
                        "Düzenleme için seçilen süreç \"$currencyValue\"",
                        style: TextStyle(color: Colors.blue),
                      ));
                      Scaffold.of(context).showSnackBar(snackbar);
                      setState(() {
                        selectedCurrency = currencyValue;
                        tempProcess = selectedCurrency;
                        debugPrint("Process ID :" + tempProcess);
                        _readDocs();
                      });
                    },
                    value: selectedCurrency,
                    isExpanded: false,
                    hint: new Text(
                      "Düzenlenecek Süreci Seçiniz",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Expanded(child: _buildListView()),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  _readDocs() async {
    DocumentSnapshot docsnap = await _firestore
        .collection("/company/company_test_2/process")
        .doc(tempProcess)
        .get();
    processSteps = (docsnap.data()["steps"]);
    debugPrint(docsnap.data()["steps"].toString());
    debugPrint("processStep kontrolü" + processSteps.toString());
    debugPrint("adım sayısı " + processSteps.length.toString());
    return _buildListView();
  }

  Widget _buildListView() {
    debugPrint("hellooo " + processSteps.length.toString());
    return ListView.builder(
        itemCount: processSteps.length,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[Text(processSteps[index])],
              ));
        });
  }
}
