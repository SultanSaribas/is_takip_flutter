import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Panel';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //  accentColor: Colors.orangeAccent,
      ),
      home: Scaffold(
          appBar: AppBar(

            title: Text(title),
          ),
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Müşteriler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              Container(

                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Yapılacak İşlemler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              Container(

                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Tamamlanan İşlemler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              Container(

                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Süreçler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
              Container(

                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text("Yorum ve Şikayetler",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){},
                ),
              ),
            ],
          )
      ),
    );
  }
}