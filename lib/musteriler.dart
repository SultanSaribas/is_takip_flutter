import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppOne extends StatefulWidget {
  @override
  _MyAppOneState createState() => _MyAppOneState();
}

class _MyAppOneState extends State<MyAppOne> {
  var customerNames = [
    "Sultan",
    "Esra",
    "Atakan",
    "Eylül",
    "Emre",
    "Burak",
    "Sultan",
    "Esra",
  ];

  var lastDates = [
    "26/10/2020",
    "29/10/2020",
    "30/10/2020",
    "02/11/2020",
    "05/11/2020",
    "10/11/2020",
  ];

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 48.0,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                child: Text(
                  customerNames[position],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                child: Text(
                  lastDates[position],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
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
                        lastDates[position];
                      },
                      icon: Icon(Icons.call),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              )
            ],
          );
        },
        itemCount: lastDates.length,
      ),
    );
  }
}
