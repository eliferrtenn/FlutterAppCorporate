// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/TechnicServiceDemandServices/TechnicServiceDemandService.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/EditTechnicalServiceDemand.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/HomeTechnicalServiceDemand.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/models/RequestModels/TechnicalServiceDemandRequests/DeleteTechnicalServiceDemandRequest.dart';
import 'package:pro_tekno1/models/ResponseModels/TechnicalServiceDemandResponses/GetTechnicalServiceDemandResponse.dart';
import '../constants/generalDrawer.dart';

class GetTechnicalServiceDemandPage extends StatefulWidget {
  final int id;

  const GetTechnicalServiceDemandPage({super.key, required this.id});
  @override
  _GetTechnicalServiceDemandPageState createState() =>
      _GetTechnicalServiceDemandPageState();
}

class _GetTechnicalServiceDemandPageState
    extends State<GetTechnicalServiceDemandPage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.generalColor,
        primary: true,
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Constants.generalColor,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(id: widget.id),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  int id;
  FirstScreen({super.key, required this.id});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    final double pageHeight = MediaQuery.of(context).size.height / 5;
    final double pageWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: pageHeight,
          width: pageWidth - 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: pageHeight / 8,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              opaque: true,
                              type: PageTransitionType.leftToRight,
                              alignment: Alignment.bottomCenter,
                              duration: Constants.pageDuration,
                              child: HomeTechnicalServicePage(resultMesssage:"",),
                              isIos: true,
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20, color: Color.fromARGB(255, 253, 148, 0))),
                ],
              ),
              SectionTitle(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SectionDescription(),
      ]),
    );
  }

  Container SectionDescription() {
    return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder(
              future: TechnicServiceDemandService.GetTechnicDemandService(
                  widget.id),
              builder: (context,
                  AsyncSnapshot<GetTechnicalServiceDemandResponse> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "İstek Tipi: ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 2) * 1.3,
                            child: Text(
                              snapshot.data!.data!.demandType.toString(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Aciliyet Durumu: ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data!.demandType.toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tanımı : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 2) * 1.3,
                            child: Text(
                              snapshot.data!.data!.description.toString(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Site Adı : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 2) * 1.3,
                            child: Text(
                              snapshot.data!.data!.siteName.toString(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Apartman Adı/No : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data!.apartmentName.toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Kat : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data!.apartmentFloor.toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Daire No : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data!.apartmentNo.toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "İletişim Bilgileri : ",
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.data!.contactInform.toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: Constants.raisedButtonStyle,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  opaque: true,
                                  isIos: true,
                                  type: PageTransitionType.leftToRight,
                                  alignment: Alignment.bottomCenter,
                                  duration: Constants.pageDuration,
                                  child: EditTechnicalServiceDemandPage(
                                      id: snapshot.data!.data!.id!)));
                        },
                        child: Text(
                          'Düzenle',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      ElevatedButton(
                        style: Constants.raisedButtonStyle,
                         onPressed: loginVerifySubmit,
                        child: Text(
                          'Sil',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text("");
                }
              },
            ),
          ],
        ));
  }

  void loginVerifySubmit() async {
    DeleteTechnicalServiceDemandRequest? request =
        DeleteTechnicalServiceDemandRequest();
    request.id=widget.id;
    var loginResponse = TechnicServiceDemandService.DeleteTechnicalServiceDemand(request);

    loginResponse.then((data) {
      if (data.isSuccess == true) {
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: HomeTechnicalServicePage(resultMesssage:data.message.toString(),),
            ));
      } else if (data.isSuccess == false) {
        return 'Güncellenemedi lütfen tekrar deneyin';
      }
    });
  }



  FutureBuilder<GetTechnicalServiceDemandResponse> SectionTitle() {
    return FutureBuilder(
      future: TechnicServiceDemandService.GetTechnicDemandService(widget.id),
      builder:
          (context, AsyncSnapshot<GetTechnicalServiceDemandResponse> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(
                snapshot.data!.data!.title.toString(),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          );
        } else {
          return Text("");
        }
      },
    );
  }
}
