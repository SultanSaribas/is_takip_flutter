import 'package:flutter/material.dart';
import 'package:is_takip_flutter/models/users.dart';
import 'package:is_takip_flutter/screens/panel.dart';
import 'package:is_takip_flutter/screens/register_screen.dart';
import 'package:is_takip_flutter/validation/login_validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginValidationMixin {
  Users user = Users.empyty();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş"),
      ),
      body: Padding(
          padding: EdgeInsets.all(75.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildEmail(),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                buildPassWord(),
                buildSubmitButton(),
                RaisedButton(
                  child: Text("Yeni Kayıt Oluştur"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                )
              ],
            ),
          )),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Mail Adresinizi giriniz:", hintText: "mail@gmail.com"),
      validator: validateEmail,
      onSaved: (String v) {
        this.user.email = v;
      },
    );
  }

  Widget buildPassWord() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Şifreniz:",
      ),
      validator: validatePassword,
      onSaved: (String p) {
        this.user.password = p;
      },
    );
  }

  buildSubmitButton() {
    return RaisedButton(
        child: Text("Giriş"),
        onPressed: () {
          /* if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(user.email + " " + user.password);
          } */
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Panel()));
        });
  }
}
