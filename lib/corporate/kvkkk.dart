// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/corporate/generalCorporatePage.dart';

import '../Services/CommonServices/CommonService.dart';
import '../constants/generalDrawer.dart';
import '../models/responseModels/kvkkResponses/GetKvkkResponse.dart';

class KvkkPage extends StatefulWidget {
  @override
  _KvkkPageState createState() => _KvkkPageState();
}

class _KvkkPageState extends State<KvkkPage> {
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
          screenContents: FirstScreen(),
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
  const FirstScreen({super.key});

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
          height: pageHeight * 2,
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
                              child: GeneralCorporatePage(),
                              isIos: true,
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20, color: Color.fromARGB(255, 253, 148, 0))),
                ],
              ),
              SectionTitile(),
              SizedBox(
                height: 10,
              ),
              SectionImage(),
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
                future: CommonService.getKvkk(),
                builder: (context, AsyncSnapshot<GetKvkkResponse> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data!.data!.description.toString(),
                          style: GoogleFonts.quicksand(
                              fontSize: 15, color: Colors.white),
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

  Container SectionImage() {
    return Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/corporate/CorporateSustainability.jpeg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(35))));
  }

  FutureBuilder<GetKvkkResponse> SectionTitile() {
    return FutureBuilder(
              future: CommonService.getKvkk(),
              builder: (context, AsyncSnapshot<GetKvkkResponse> snapshot) {
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
                  return Text(
                    "Kvkk",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  );
                }
              },
            );
  }
}
