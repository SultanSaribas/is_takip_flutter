import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomerAdd extends StatefulWidget {
  @override
  _CustomerAddState createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  var customerID = "12";
  String name = "";
  String phoneNumber = " ";
  String note = " ";
  double tutar = 0;
  Map<String, dynamic> mapCustomer = Map();

  List<String> surec = [
    "Paça Daraltma",
    "Boy Kısaltma",
    "Elbise Dikimi",
    "Bel Daraltma"
  ];
  String secilenSurec = "Paça Daraltma";
  bool checBoxState = false;
  @override
  Widget build(BuildContext context) {
/*
    DateTime now = DateTime.now();
    DateTime ayOnce = DateTime(2019, now.month - 12);
    DateTime yilSonra = DateTime(2035, 1, now.month + 20);
*/
    return Scaffold(
        appBar: AppBar(
          title: Text("Müşteri Ekleme Sayfası"),
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
                  onSubmitted: (s) {
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
                  onSubmitted: (s) {
                    debugPrint("alınan telefon numarası $s");
                    name = s;
                    mapCustomer['phone'] = phoneNumber;
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
                  onSubmitted: (s) {
                    debugPrint("alınan Not $s");
                    name = s;
                    mapCustomer['note'] = note;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                //padding: const EdgeInsets.only(left: 3,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
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
                                });
                              },
                              value: secilenSurec,
                            ),
                          ),
                        )),
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
                    Icons.money,
                    color: Colors.lightBlue,
                  ),
                  value: checBoxState,
                  onChanged: (secildi) {
                    setState(() {
                      checBoxState = secildi;
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
                  onSubmitted: (s) {
                    debugPrint("alınan tutar $s");
                    name = s;
                    mapCustomer['cost'] = tutar;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  // TOAST MESSAGE YAPILABİLİR
                  child: Text("KAYDET"),
                  color: Colors.blue.shade50,
                  onPressed: () {}),
            ],
          ),
        ));
  }
}

///////             EKRANA SIĞMAMA SORUNU OLUŞTU!!!!!!!!