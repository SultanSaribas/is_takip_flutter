import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomerAddTest extends StatefulWidget {
  @override
  _CustomerAddTestState createState() => _CustomerAddTestState();
}

class _CustomerAddTestState extends State<CustomerAddTest> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedCurrency;
  String customerID;
  String name = "";
  String phoneNumber = " ";
  String note = " ";
  var tutar;
  Map<String, dynamic> mapCustomer = Map();
  Map<String, dynamic> serviceMap = Map();

  List<String> surec = [
    "Paça Daraltma",
    "Boy Kısaltma",
    "Elbise Dikimi",
    "Bel Daraltma"
  ];
  String secilenSurec = "Paça Daraltma";
  bool checkBoxState = false;

  @override
  Widget build(BuildContext context) {
/*
    DateTime now = DateTime.now();
    DateTime ayOnce = DateTime(2019, now.month - 12);
    DateTime yilSonra = DateTime(2035, 1, now.month + 20);
*/
    return Scaffold(
        appBar: AppBar(
          title: Text("Müşteri Ekleme Test Sayfasıdır"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Müşteri Adı-Soyadı",
                      hintText: "Ad-Soyad",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onChanged: (s) {
                    debugPrint("alınan isim $s");
                    name = s;
                    mapCustomer['name'] = name;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Müşteri Telefon Numarası",
                    hintText: "0(5XX) XXX XX XX",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (s) {
                    debugPrint("alınan telefon numarası $s");
                    phoneNumber = s;
                    mapCustomer['phoneNumber'] = phoneNumber;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "NOT EKLE",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (s) {
                    debugPrint("alınan Not $s");
                    note = s;
                    serviceMap['note'] = note;
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
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
                    //debugPrint("-------------"+ snap.data()["processName"].toString());
                      currencyItems.add(DropdownMenuItem(
                        child: Text(
                          snap.data()["processName"],
                          // BURADA ID DEĞİL DE O PROCESSİN ADINI ALMASI LAZIM AMA NASIL YAPACAM ANLAMADIM
                          style: TextStyle(color: Colors.blue),
                        ),
                        value:
                            "${snap.id}", // AYNI ŞEYİ BURADA DA DÜZELTMEK LAZIM
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
                              "Seçilen Süreç $currencyValue",
                              style: TextStyle(color: Colors.blueGrey),
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
              Padding(
                padding: const EdgeInsets.all(10),
                //padding: const EdgeInsets.only(left: 3,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /* Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.lightBlue,
                                style: BorderStyle.solid,
                                width: 1.80)),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: DropdownButton<String>(
                              items: surec.map((e) {
                                return DropdownMenuItem<String>(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (s) {
                                setState(() {
                                  secilenSurec = s;
                                  serviceMap['process'] = secilenSurec;
                                });
                              },
                              value: secilenSurec,
                            ),
                          ),
                        )
                        ),*/
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.blue.shade50,
                        child: Text("Yeni Süreç Oluştur"),
                        onPressed: () {})
                  ],
                ),
              ),
              CheckboxListTile(
                  activeColor: Colors.lightBlue,
                  title: Text("Ödeme Durumu"),
                  subtitle: Text("Ödeme Alındı/ Alınmadı"),
                  secondary: Icon(
                    FontAwesome5.lira_sign,
                    color: Colors.lightBlue,
                  ),
                  value: checkBoxState,
                  onChanged: (secildi) {
                    setState(() {
                      checkBoxState = secildi;
                      serviceMap['paymentState'] = checkBoxState;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Tutar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onChanged: (s) {
                    debugPrint("alınan tutar $s");
                    tutar = s;
                    serviceMap['cost'] = tutar;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  // TOAST MESSAGE YAPILABİLİR
                  child: Text("KAYDET"),
                  color: Colors.blue.shade50,
                  onPressed: _dbEkle1),
            ],
          ),
        ));
  }

  void _dbEkle1() async {
    int temp = 0;
    String tempID;
    String tempCustomerID; //kontrol için
    _firestore
        .collection("/company/company_test_2/customers")
        .get()
        .then((querysnapshot) {
      for (int i = 0; i < querysnapshot.docs.length; i++) {
        if (mapCustomer["phoneNumber"] !=
            querysnapshot.docs[i].data()["phoneNumber"].toString()) {
          temp = 1;
        } else {
          temp = 0;
        }
      }
      if (temp == 1) {
        tempID =
            _firestore.collection("/company/company_test_2/customers").doc().id;
        mapCustomer["customersID"] = tempID;
        serviceMap["customersID"] = tempID;
        _firestore
            .collection("/company/company_test_2/customers")
            .doc(tempID)
            .set(mapCustomer)
            .then((v) => debugPrint("telefon numarası yoktu eklendi"));
      } else {
        debugPrint(" telefon numarası kullanılıyor ");
        for (int j = 0; j < querysnapshot.docs.length; j++) {
          if (mapCustomer["phoneNumber"] ==
              querysnapshot.docs[j].data()["phoneNumber"].toString()) {
            tempID = querysnapshot.docs[j].id;
            debugPrint("if ici tempID $tempID");
            serviceMap["customersID"] = tempID;
            debugPrint("if ici map " + serviceMap["customersID"]);
          }
        }
      }
      debugPrint("if dısı map " + serviceMap["customersID"]);
      debugPrint("if dısı map " + tempID);

      _firestore
          .collection("/company/company_test_2/services")
          .doc()
          .set(serviceMap)
          .then((v) => debugPrint("service data eklendi"));
    });
  }

  void _ekle() async {
    debugPrint("İKİNCİ FONKSİYON CALISTI");
    String tempID =
        _firestore.collection("/company/company_test_2/customers").doc().id;
    mapCustomer["customersID"] = tempID;
    _firestore
        .collection("/company/company_test_2/customers")
        .doc(tempID)
        .set(mapCustomer)
        .then((v) => debugPrint("telefon numarası yoktu eklendi"));
  }
}

///////             EKRANA SIĞMAMA SORUNU OLUŞTU!!!!!!!!
