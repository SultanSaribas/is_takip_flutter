import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_flutter/screens/login_screen.dart';
import 'package:is_takip_flutter/models/users.dart';
import 'package:is_takip_flutter/validation/login_validation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen>
    with LoginValidationMixin {
  Users user = Users.empyty();
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String gelenMail;
  String gelenSifre;
  String gelenSifreKontrol;

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
                            style: TextStyle(
                                color: Colors.white, fontSize: 25.0),
                          ))),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: 50.0, left: 20.0, right: 20.0),
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
                        createPassWord(),
                        SizedBox(height: 5.0),
                        confirmPassWord(),
                        SizedBox(height: 5.0),
                        buildSubmitButton(),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.blue,
                          child: Text(
                            "     kontrol et    ",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            debugPrint(gelenSifre);
                            debugPrint(gelenMail);
                          },
                        )
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
        labelText: "Mail Adresinizi giriniz: ",
        hintText: "mail@gmail.com",
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: validateEmail,
      onChanged: (String gM) {
        gelenMail = gM;
      },
    );
  }

  Widget createPassWord() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Şifre Oluşturun: ",
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: validatePassword,
      onChanged: (String gS) {
        gelenSifre = gS;
      },
    );
  }

  Widget confirmPassWord() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Şifrenizi Doğrulayın: ",
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: (String gK) {
        gelenSifreKontrol = gK;
      },
    );
  }

  buildSubmitButton() {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.blue,
        child: Text(
          "      Kayıt Ol       ",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (gelenSifre.length>=6) {
            if (gelenSifre == gelenSifreKontrol) {
              _emailSifreRegister(gelenMail, gelenSifre);
            }
            else {
              debugPrint("Şifreler uyuşmuyor");
            }
          }else{debugPrint("Şifre en az 6 karakterden oluşmalı");}
        });
  }

  void _emailSifreRegister(String mailG, String sifreG) async {
    var fireBaseUser = await _auth.createUserWithEmailAndPassword(
        email: mailG, password: sifreG);
  }
}
