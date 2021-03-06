import 'package:flutter/material.dart';
import 'package:is_takip_flutter/models/users.dart';
import 'package:is_takip_flutter/screens/customer_add_test.dart';
import 'package:is_takip_flutter/screens/satici_giris_test.dart';
import 'package:is_takip_flutter/screens/panel.dart';
import 'package:is_takip_flutter/screens/register_screen.dart';
import 'package:is_takip_flutter/screens/testSayfasi.dart';
import 'package:is_takip_flutter/screens/testSurecGoruntule.dart';
import 'package:is_takip_flutter/validation/login_validation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginValidationMixin {
  Users user = Users.empyty();
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String gelenSifre;
  String gelenMail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: CircleAvatar(
                      maxRadius: 50.0,
                      backgroundColor: Colors.lightBlue,
                      child: Text(
                        "ITS",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ))),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    buildEmail(),
                    SizedBox(height: 15.0),
                    buildPassWord(),
                    SizedBox(height: 5.0),
                    buildSubmitButton(),
                    SizedBox(height: 5.0),
                    buildTestButton(),
                    FlatButton(
                      //color: Colors.blue,
                      child: Text(
                        "   surec goruntule teste git    ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => surecTest()));
                      },
                    ),
                    FlatButton(
                      //color: Colors.blue,
                      child: Text(
                        "  aktif siparisleri test   ",
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SaticiGirisTest()));
                      },
                    ),
                    FlatButton(
                      //color: Colors.blue,
                      child: Text(
                        "   Müşteri ekleme test sayfasına gider   ",
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerAddTest()));
                      },
                    ),
                    /*
                    FlatButton(
                      //color: Colors.blue,
                      child: Text(
                        "   ESra denemeeee   ",
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DenemeEsra()));
                      },
                    ),
                    */
                      Row(
                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(("Hesap Oluştur!")),
                              Expanded(
                                child: FlatButton(
                                  //color: Colors.blue,
                                  child: Text(
                                    "    Kayıt Ol    ",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegisterScreen()));
                                  },
                                  //shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              Expanded(
                                child: FlatButton(
                                  //color: Colors.blue,
                                  child: Text(
                                    "   surec ekle teste git    ",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SurecEkleDb()));
                                  },
                                ),
                              ),

                            ]),
                  ],
                ),
              ),
            ),
          ]),
    ));
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Mail Adresinizi giriniz:",
        hintText: "mail@gmail.com",
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: (String gM) {
        gelenMail = gM;
      },
    );
  }

  Widget buildPassWord() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Şifreniz:",
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: (String gS) {
        gelenSifre = gS;
      },
    );
  }

  buildTestButton() {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.blue,
        child: Text(
          "      Kontrol       ",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _oturumAc(gelenMail, gelenSifre);
        });
  }

  buildSubmitButton() {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.blue,
        child: Text(
          "      Giriş       ",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Panel()));
        });
  }

  void _oturumAc(String mailGelen, String sifreGelen) {
    _auth
        .signInWithEmailAndPassword(email: mailGelen, password: sifreGelen)
        .then((value) => debugPrint("giriş basarili"));
  }
}
