// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/homePage.dart';
import 'package:pro_tekno1/login.dart';

import 'Services/MemberServices/MemberService.dart';
import 'models/RequestModels/MemberRequests/UpdateMemberRequest.dart';


class CreateUser_Page extends StatefulWidget {
  final String userNumber;
  const CreateUser_Page({super.key, required this.userNumber});
  @override
  State<CreateUser_Page> createState() => _CreateUser_Page();
}

class _CreateUser_Page extends State<CreateUser_Page>
    with TickerProviderStateMixin {
        final nameController = TextEditingController( text:"Your initial value");
  final surnameController = TextEditingController(text:"Your initial value");
  final emailController = TextEditingController(text:"Your initial value");
@override
  void initState() {
   setState(() {
             nameController.text="Ad";
             surnameController.text="Soyad";
             emailController.text="email";
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double loginHeight = (MediaQuery.of(context).size.height / 14);
    final double inputWidth = (MediaQuery.of(context).size.width / 2) * 1.5;
    final double cardWidth = ((MediaQuery.of(context).size.width) / 2) * 1.7;

    return Stack(children: [
      Container(
        width: double.infinity,
        color: Colors.white,
      ),
      Positioned(
        child: ClipPath(
          clipper: Clipper(),
          child: Container(
            height: (MediaQuery.of(context).size.height / 14) * 9,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/projects/end_of_project.jpg"),
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
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //begin::logo
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: loginHeight * 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo/ekinciLogo.png'),
                      fit: BoxFit.contain),
                ),
              ),
              //end::logo
              Card(
                elevation: 0,
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Column(children: [
                  SizedBox(
                    height: loginHeight,
                  ),
                  Container(
                    width: cardWidth,
                  ),
                  //begin::input
                  Container(
                    height: loginHeight * 5.5,
                    child: Column(children: [
                      //begin::nameinput
                      SizedBox(
                        width: inputWidth,
                        child: TextFormField(
                          controller:nameController,
                          style: Constants.formFieldStyleCreate,
                          decoration: InputDecoration(
                            contentPadding: Constants.inputcontentPadding,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 201, 201, 201),
                            ),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.transparent,
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            labelText: 'Ad',
                            hintText: 'Ad',
                            border: Constants.generalInputBorder,
                            focusedBorder: Constants.generalInputBorder,
                            enabledBorder: Constants.generalInputBorder,
                            errorBorder: Constants.generalInputBorder,
                            disabledBorder: Constants.generalInputBorder,
                            errorStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                
                      SizedBox(
                        height: loginHeight / 2,
                      ),
                      //begin::usernameinpnut
                      SizedBox(
                        width: inputWidth,
                        child: TextFormField(
                          controller:surnameController,
                          style: Constants.formFieldStyleCreate,
                          decoration: InputDecoration(
                            contentPadding: Constants.inputcontentPadding,
                            prefixIcon: Icon(
                              Icons.person_add_alt_rounded,
                              color: Color.fromARGB(255, 201, 201, 201),
                            ),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.transparent,
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            labelText: 'Soyad',
                            hintText: 'Soyad',
                            border: Constants.generalInputBorder,
                            focusedBorder: Constants.generalInputBorder,
                            enabledBorder: Constants.generalInputBorder,
                            errorBorder: Constants.generalInputBorder,
                            disabledBorder: Constants.generalInputBorder,
                            errorStyle: TextStyle(
                                color: Color.fromARGB(255, 72, 71, 71)),
                          ),
                        ),
                      ),
                      //end::usernameipnut
                      SizedBox(
                        height: loginHeight / 2,
                      ),
                      //begin::mailinput
                      SizedBox(
                        width: inputWidth,
                        child: TextFormField(
                          controller:emailController,
                          style: Constants.formFieldStyleCreate,
                          decoration: InputDecoration(
                            contentPadding: Constants.inputcontentPadding,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 201, 201, 201),
                            ),
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.transparent,
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            labelText: 'Mail',
                            hintText: 'Mail',
                            border: Constants.generalInputBorder,
                            focusedBorder: Constants.generalInputBorder,
                            enabledBorder: Constants.generalInputBorder,
                            errorBorder: Constants.generalInputBorder,
                            disabledBorder: Constants.generalInputBorder,
                            errorStyle: TextStyle(
                                color: Color.fromARGB(255, 72, 71, 71)),
                          ),
                        ),
                      ),
              
                      //end::mailinput
                    ]),
                  ),
                  //end::input
                  //begin::button
                  Container(
                    width: (MediaQuery.of(context).size.width / 2)*1.3,
                    height: loginHeight,
                    decoration: Constants.buttonDecoration,
                    child: ElevatedButton(
                      style: Constants.raisedButtonStyle,
                      onPressed: loginVerifySubmit,
                      child: Text('Hesap Oluştur', style: Constants.buttonStyle),
                    ),
                  ),

                  SizedBox(
                    height: loginHeight * 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              opaque: true,
                              type: PageTransitionType.leftToRight,
                              alignment: Alignment.bottomCenter,
                              duration: Constants.pageDuration,
                              child: Login_Page(),
                              isIos: true,
                            ));
                      },
                      child: Text(
                        "Geri Dön",
                        style: TextStyle(
                          height: 2,
                          fontFamily: "Netflix",
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color.fromARGB(255, 20, 105, 154),
                        ),
                      ),
                    ),
                  ),
        
        
        
                ]),
              ),
              SizedBox(
                height: loginHeight,
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  void loginVerifySubmit() async {

    UpdateMemberRequest? request = UpdateMemberRequest();
    request.firstName = nameController.text;
    request.lastName = surnameController.text;
    request.email = emailController.text;
    var loginResponse= MemberService.UpdateMember(request);

    loginResponse.then((data) {
       if(data.isSuccess == true){
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
       }else if(data.isSuccess == false){
        return 'Oluşturulamadı lütfen tekrar deneyin';
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
