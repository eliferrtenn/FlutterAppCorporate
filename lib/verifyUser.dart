// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names, must_call_super, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/homePage.dart';
import 'package:pro_tekno1/models/RequestModels/LoginRequest/LoginSmsVerificationRequest.dart';

import 'Services/AccountServices/AccountService.dart';
import 'constants/generalToken.dart';

class Verify_UserPage extends StatefulWidget {
  final String userNumber;
  const Verify_UserPage({super.key, required this.userNumber});

  @override
  State<Verify_UserPage> createState() => _Verify_UserPageState();
}

class _Verify_UserPageState extends State<Verify_UserPage>
    with TickerProviderStateMixin {
  GeneralToken generalToken = GeneralToken();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String wrongOnayKod = "";

  @override
  void dispose() {
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        color: Colors.white,
      ),
      BackGround(context),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                LogoPosition(context, generalHeight(context)),
                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: generalHeight(context),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width),
                    ),
                    VerifyCodeInput(generalHeight(context), context),
                    SaveButton(context, generalHeight(context)),
                    //end::button
                    SizedBox(
                      height: generalHeight(context),
                    ),
                  ]),
                ),
                SizedBox(
                  height: generalHeight(context) * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Container SaveButton(BuildContext context, double loginHeight) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) * 1.6,
      height: loginHeight,
      decoration: Constants.buttonDecoration,
      child: ElevatedButton(
        style: Constants.raisedButtonStyle,
        onPressed: loginVerifySubmit,
        child: Text(
          'Onayla',
          style: Constants.buttonStyle,
        ),
      ),
    );
  }

  Container VerifyCodeInput(double loginHeight, BuildContext context) {
    return Container(
      height: loginHeight * 5,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 2) * 1.6,
        child: Column(children: [
          Text("Onay Kodu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 79, 76, 76),
                  fontWeight: FontWeight.bold,
                  fontSize: 19)),
          SizedBox(
            height: loginHeight / 4,
          ),
                  Text(wrongOnayKod,style:TextStyle(
                  color: Color.fromARGB(255, 160, 18, 18),
                  fontWeight: FontWeight.bold,
                  fontSize: 14) ,),
          verifyMessage(widget.userNumber),
          SizedBox(
            height: loginHeight / 2,
          ),
          TextFormField(
            controller: myController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              fillColor: Constants.buttonBorderColor,
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 79, 74, 74),
              ),
              border: Constants.verifyInputBorder,
              focusedBorder: Constants.verifyInputBorder,
              enabledBorder: Constants.verifyInputBorder,
              errorBorder: Constants.verifyInputBorder,
              disabledBorder: Constants.verifyInputBorder,
              hintText: '- - - -',
              hintStyle: TextStyle(
                  letterSpacing: 15,
                  fontSize: 23.0,
                  color: Color.fromARGB(255, 7, 7, 7)),
            ),
            validator: (deger) {
              if (deger!.length != 4) {
                return 'Onay kodu 4 karakter olmalıdır';
              } else {
                return null;
              }
            },
            maxLength: 4,
          ),
        ]),
      ),
    );
  }

  Container LogoPosition(BuildContext context, double loginHeight) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: loginHeight * 3,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/logo/ekinciLogo.png'),
            fit: BoxFit.contain),
      ),
    );
  }

  Positioned BackGround(BuildContext context) {
    return Positioned(
      child: ClipPath(
        clipper: Clipper(),
        child: Container(
          height: (MediaQuery.of(context).size.height / 14) * 9,
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
        ),
      ),
    );
  }

  void loginVerifySubmit() async {
    final FormState? form = formKey.currentState;
    form!.save();
    LoginSmsVerificationRequest? request = LoginSmsVerificationRequest();
    request.mobilePhone = widget.userNumber;
    request.smsCode = myController.text;
    var loginResponse = AccountService.LoginSmsVerification(request);

    loginResponse.then((data) {
      if (data.isSuccess == true) {
        generalToken.setToken(data.data!.accessToken.toString());
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: Home_Page(),
            ));
      } else if (data.isSuccess == false) {
        setState(() {
      wrongOnayKod = "Yanlış onay kodu!"; 
        });
        return Text("");
      }
    });
  }
}

class Clipper extends CustomClipper<Path> {
  final path = Path();

  @override
  Path getClip(Size size) {
    var paint = Paint();
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}
