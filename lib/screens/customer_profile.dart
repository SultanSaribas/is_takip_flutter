import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:is_takip_flutter/screens/processes.dart';

class CustomerProfile extends StatefulWidget {
  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    var customerName = "Sultan";
    var servingNames = [
      "Hizmet 1",
      "Hizmet 2",
      "Hizmet 3",
      "Hizmet 4",
      "Hizmet 5",
      "Hizmet 6",
      "Hizmet 7",
      "Hizmet 8",
      "Hizmet 9",
    ];

    var lastDates = [
      "26/10/2020",
      "29/10/2020",
      "30/10/2020",
      "02/11/2020",
      "05/11/2020",
      "10/11/2020",
      "02/11/2020",
      "05/11/2020",
      "10/11/2020",
    ];

    final title = 'Müşteri Profili';

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
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            child: Card(
              elevation: 10,
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "SULTAN SARIBAŞ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.zillaSlab(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            /*Text(
                "SULTAN SARIBAŞ",
                textAlign: TextAlign.center,
                style: GoogleFonts.zillaSlab(
                    color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),

                ),*/
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Processes(),
                    ));
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, i) {
                  return Container(
                    height: 130,
                    child: Card(
//                color: Colors.blue,
                      elevation: 10,

                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 15.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.blue,
                                        width: 5,
                                      )
                                    ),
                                ),
                                child: Text(
                                  servingNames[i],
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
                                padding: EdgeInsets.only(left: 15.0),
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
                        ],
                      ),
                    ),
                  );
                },
                itemCount: lastDates.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
