// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static final Color generalColor = Color.fromARGB(255, 55, 123, 172);
  static Container backgroundImage = Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/projects/end_of_project.jpg"),
          fit: BoxFit.cover),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
      ),
    ),
  );
  static BoxDecoration buttonDecoration = BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 24, 21, 21),
          Color.fromARGB(255, 14, 13, 13)
          /*Color.fromARGB(255, 155, 88, 88),
                            Color.fromARGB(255, 151, 21, 21))*/
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(40.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 72, 72, 72).withOpacity(0.5),
          spreadRadius: 4,
          blurRadius: 10,
          offset: Offset(0, 6),
        )
      ]);
  static Color formFieldTextColor = Color.fromARGB(255, 128, 115, 115);

  static RoundedRectangleBorder homePageCardShape = RoundedRectangleBorder(
    side: BorderSide(
      color: generalColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomRight: Radius.circular(40),
    ),
  );
  static Color basicBackColor = Color.fromARGB(255, 129, 160, 160);
  static const inputColor = Colors.white;
  static BorderRadius inputBorderRadius = BorderRadius.circular(25.0);
  static const buttonBorderColor = Color.fromARGB(79, 170, 170, 170);

  static final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 0, 105, 180),
    shadowColor: Color.fromARGB(255, 64, 135, 207),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  static final TextStyle formFieldStyle = TextStyle(fontSize: 14,
  color:Colors.white,
  fontWeight: FontWeight.bold);

  static final TextStyle formFieldStyleCreate = TextStyle(fontSize: 14,
  color:Color.fromARGB(255, 114, 114, 114),
  fontWeight: FontWeight.bold);

  static final TextStyle buttonStyle = TextStyle(
    fontFamily: "Netflix",
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static final Duration pageDuration = Duration(milliseconds: 600);
  static final EdgeInsetsGeometry inputcontentPadding =
      EdgeInsets.symmetric(vertical: 10);

  static final OutlineInputBorder generalInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: Constants.inputBorderRadius,
  );

  static final OutlineInputBorder LoginInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 2.0),
    borderRadius: Constants.inputBorderRadius,
  );

  static final UnderlineInputBorder verifyInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: Color.fromARGB(255, 195, 195, 195),
    ),
  );
}

Text verifyMessage(String telephoneNumber) {
  String messageText = 'Lütfen mesaj kutunuzu kontrol ediniz ve ' +
      telephoneNumber +
      ' numaralı cep telefonunuza gelen doğrulama kodunu giriniz';
  return Text(messageText,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: Color.fromARGB(255, 101, 100, 100), fontSize: 15));
}

SafeArea drawerMenu(BuildContext context) {
  return SafeArea(
    child: Drawer(
      child: ListView(children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 4),
          child: DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: (MediaQuery.of(context).size.height / 25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/proteknoLogo.png'),
                      fit: BoxFit.contain),
                ),
              ),
            ],
          )),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            bottomLeft: const Radius.circular(40.0),
          )),
          child: ListTile(
            /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Color.fromARGB(255, 129, 160, 160)),
            ),*/
            leading: Icon(
              Icons.home,
              color: Color.fromARGB(255, 90, 88, 88),
              size: 18,
            ),
            title: Text(
              "Anasayfa",
              style: TextStyle(
                  color: Color.fromARGB(255, 90, 88, 88),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.pushNamed(context, "/Anasayfa"),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Color.fromARGB(255, 90, 88, 88),
            size: 18,
          ),
          title: Text(
            "İkinci Sayfa",
            style:
                TextStyle(color: Color.fromARGB(255, 90, 88, 88), fontSize: 15),
          ),
          onTap: () => Navigator.pushNamed(context, "/Anasayfa"),
        ),
      ]),
    ),
  );
}

double generalHeight(BuildContext context){
    return (MediaQuery.of(context).size.height / 14);
}

double inputWidth(BuildContext context){
    return (MediaQuery.of(context).size.width / 2) * 1.8;
}

double buttonWidth(BuildContext context){
    return (MediaQuery.of(context).size.width / 2) * 1.43;
}
