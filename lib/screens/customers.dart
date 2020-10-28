import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/screens/customer_add.dart';
import 'package:is_takip_flutter/screens/customer_profile.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> customers = Map();

  @override
  Widget build(BuildContext context) {

    Stream company = FirebaseFirestore.instance.collection('company').snapshots();
    var customerNames = [
      "Sultan",
      "Esra",
      "Atakan",
      "Eylül",
      "Emre",
      "Burak",
      "Sultan",
      "Esra",
      "Atakan",
      "Eylül",
      "Emre",
      "Burak",
    ];

    var lastDates = [
      "26/10/2020",
      "29/10/2020",
      "30/10/2020",
      "02/11/2020",
      "05/11/2020",
      "10/11/2020",
      "26/10/2020",
      "29/10/2020",
      "30/10/2020",
      "02/11/2020",
      "05/11/2020",
      "10/11/2020",
    ];

    final title = 'Müşteriler';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerAdd(),
              ));},
        child: Icon(
          Icons.add,
          size: 48.0,
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerProfile(),
              ));
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, i) {
            return Container(
              height: 130,
              child: Card(
                //        color: Colors.blue,
                elevation: 10,

                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                  color: Colors.blue,
                                  width: 5,
                                )
                            ),
                          ),
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            customerNames[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),

                          /*   shadowColor: Colors.blue,
                                backgroundColor: Colors.transparent,
                              elevation: 5,
                              autofocus: true,*/
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            lastDates[i],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),

                          /*   shadowColor: Colors.blue,
                                backgroundColor: Colors.transparent,
                              elevation: 5,
                              autofocus: true,*/
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                            },
                            icon: Icon(Icons.call),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: lastDates.length,
        ),
      ),
    );
  }
}

void getFromFb() async{

}
