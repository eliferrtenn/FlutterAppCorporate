// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures, deprecated_member_use, avoid_print, non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/createUser.dart';
import 'package:pro_tekno1/models/RequestModels/LoginRequest/LoginRequest.dart';
import 'package:pro_tekno1/verifyUser.dart';
import 'Services/AccountServices/AccountService.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> with TickerProviderStateMixin {
  late final List<String>? countries;
  late List<Map<String, dynamic>> filteredCountries;
  final inputController = TextEditingController();
  late AnimationController _controllerOpacity;
  late Animation _opacityAnimation;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  late TextEditingController _numberController;
  late String telephoneNumber = "";
  @override
  void initState() {
    _controllerOpacity =
        AnimationController(vsync: this, duration: Duration(seconds: 7));
    _opacityAnimation = CurvedAnimation(
      parent: _controllerOpacity,
      curve: Curves.bounceInOut,
    );
    _numberController = TextEditingController(text: telephoneNumber);
    _numberController.addListener(() {
      setState(() {});
    });
    _controllerOpacity.addListener(() {
      setState(() {});
    });

    _controllerOpacity.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    inputController.dispose();
    _numberController.dispose();
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: generalHeight(context),
                ),
                LogoPosition(context, generalHeight(context)),
                Column(children: [
                  SizedBox(
                    height: generalHeight(context),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width),
                  ),
                  NumberInput(generalHeight(context), inputWidth(context)),
                  SizedBox(
                    height: generalHeight(context) * 2,
                  ),
                  SaveButton(buttonWidth(context), generalHeight(context)),
                  SizedBox(
                    height: generalHeight(context),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Container SaveButton(double buttonWidth, double loginHeight) {
    return Container(
                  width: buttonWidth,
                  height: loginHeight,
                  // ignore: sort_child_properties_last
                  decoration: Constants.buttonDecoration,
                  child: ElevatedButton(
                    style: Constants.raisedButtonStyle,
                    onPressed: loginSubmit,
                    child: Text(
                      'Giriş',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                );
  }

  Card NumberInput(double loginHeight, double inputWidth) {
    return Card(
                  elevation: 0,
                  color: Color.fromARGB(0, 159, 42, 42),
                  child: SizedBox(
                    child: Container(
                      padding: const EdgeInsets.only(left: 9),
                      height: loginHeight * 1.5,
                      width: inputWidth * 1.2,
                      child: IntlPhoneField(
                        dropdownIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                       //controller: controller,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        invalidNumberMessage:
                            'Geçerli telefon numarası giriniz',
                        searchText: 'Arama Yapınız',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        dropdownTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          labelText: 'Telefon Numarası',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          border: Constants.LoginInputBorder,
                          focusedBorder: Constants.LoginInputBorder,
                          enabledBorder: Constants.LoginInputBorder,
                          errorBorder: Constants.LoginInputBorder,
                          disabledBorder: Constants.LoginInputBorder,
                        ),
                        initialCountryCode: 'TR',
                        onChanged: (phone) {
                          controller.text=phone.completeNumber;
                        },
                      ),
                    ),
                  ),
                );
  }

  Opacity LogoPosition(BuildContext context, double loginHeight) {
    return Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: loginHeight * 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/logo/ekinciWhiteLogo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              );
  }

  Positioned BackGround(BuildContext context) {
    return Positioned(
      child: Container(
        height: (MediaQuery.of(context).size.height),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("assets/images/background/loginBackground.jpeg"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }

  void loginSubmit() async {
    final FormState? form = formKey.currentState;
    form!.save();
    LoginRequest request = LoginRequest();
    String words = controller.text;
    String word = words.replaceAll(RegExp(r'[^\w\s]+'),'');
    request.mobilePhone = word;

    var loginResponse = AccountService.Login(request);

    loginResponse.then((data) {
      if (data.data!.isNewUser == true) {
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: CreateUser_Page(
                userNumber: word,
              ),
            ));
      } else if (data.data!.isNewUser == false) {
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: Verify_UserPage(
                userNumber: word,
              ),
            ));
      }
    });
  }

  String validateMobile(String value) {
    if (value.length != 9)
      return 'Telefon numarası maksimum 11 karakterli olmalıdır';
    else
      return '';
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
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
