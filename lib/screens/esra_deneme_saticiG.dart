import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'customer_add.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Satıcı Giriş Sayfası",
      ),
    ),
    body: EkranOlustur(),
  );
}

class EkranOlustur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("/company/company_test_2/services")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text("Loading....");
            default:
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot user = snapshot.data.docs[index];
                    return ListTile(
                      title: Text(user.data()["note"]),
                    );
                  });
          }
        });
  }
}
