// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/homePage.dart';
import 'package:pro_tekno1/models/RequestModels/MemberRequests/UpdateMemberRequest.dart';
import 'package:pro_tekno1/models/ResponseModels/MemberResponses/GetMemberResponse.dart';

import '../Services/MemberServices/MemberService.dart';
import '../constants/generalToken.dart';

class GetMemberPage extends StatefulWidget {
  const GetMemberPage({super.key});

  @override
  State<GetMemberPage> createState() => _GetMemberPageState();
}

class _GetMemberPageState extends State<GetMemberPage> {
        GeneralToken generalToken = GeneralToken();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();



@override
  void initState() {
         MemberService.GetMember().then((response) {
      setState(() {
             GetMemberResponse model=response;
             nameController.text=model.data!.firstname.toString();
             surnameController.text=model.data!.lastname.toString();
             emailController.text=model.data!.email.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double loginHeight = (MediaQuery.of(context).size.height / 14);
    final double inputWidth = (MediaQuery.of(context).size.width / 2) * 1.7;

    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: loginHeight / 2,
        ),
        Row(
          children: [
            TextButton(
                style: ButtonStyle(alignment: Alignment(0, -1)),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        opaque: true,
                        type: PageTransitionType.leftToRight,
                        alignment: Alignment.bottomCenter,
                        duration: Constants.pageDuration,
                        child: Home_Page(),
                        isIos: true,
                      ));
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    size: 20, color: Color.fromARGB(255, 253, 148, 0)))
          ],
        ),
        SizedBox(
          height: loginHeight,
        ),
        Center(
          child: SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  backgroundImage:
                      AssetImage("assets/images/logo/ekinciLogo.png"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: loginHeight,
        ),
        FutureBuilder(
          future: MemberService.GetMember(),
          builder: (context, AsyncSnapshot<GetMemberResponse> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    width: inputWidth,
                    child: TextFormField(
                      key:formKey,
                     controller: nameController,
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
                  SizedBox(
                    width: inputWidth,
                    child: TextFormField(
                     controller: surnameController,
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
                        labelText: 'Soyad',
                        hintText: 'Soyad',
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
                  SizedBox(
                    width: inputWidth,
                    child: TextFormField(
                     controller: emailController,
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
                        errorStyle:
                            TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: loginHeight,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 2)*1.3,
                    height: loginHeight,
                    decoration: Constants.buttonDecoration,
                    child: ElevatedButton(
                      style: Constants.raisedButtonStyle,
                      onPressed: loginVerifySubmit,
                      child: Text('Kaydet', style: Constants.buttonStyle),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ]),
    );
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
        return 'Güncellenemedi lütfen tekrar deneyin';
       }
    });
  }


}
