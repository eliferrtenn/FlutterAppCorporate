// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names, annotate_overrides, prefer_interpolation_to_compose_strings, unnecessary_null_comparison, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:link/link.dart';
import 'package:pro_tekno1/Services/ContactServices/ContactService.dart';
import 'package:pro_tekno1/constants/constants.dart';

import '../constants/generalDrawer.dart';
import '../models/responseModels/contactResponses/GetContactResponse.dart';

class GetContactPage extends StatefulWidget {
  final int id;

  const GetContactPage({Key? key, required this.id}) : super(key: key);
  @override
  _GetContactState createState() => _GetContactState();
}

class _GetContactState extends State<GetContactPage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        primary: true,
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Color.fromARGB(255, 255, 255, 255),
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
  final int id;
  const FirstScreen({super.key, required this.id});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double pageHeight = MediaQuery.of(context).size.height / 5;
    final double pageWidth = MediaQuery.of(context).size.width;
    return Container(
      child: FutureBuilder(
        future: ContactService.GetContact(widget.id),
        builder: (context, AsyncSnapshot<GetContactResponse> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: pageHeight,
                  width: pageWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: pageHeight /3,
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data!.data!.title.toString(),
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: pageHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Constants.generalColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                      color: Constants.generalColor,
                      width: MediaQuery.of(context).size.width - 20,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Konum : ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) *
                                              1.3,
                                      child: Text(
                                        snapshot.data!.data!.location
                                            .toString(),
                                        style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
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
                                      "Telefon : ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      child: snapshot.data!.data!.mobilePhone
                                                  .toString() ==
                                              null
                                          ? Text(
                                              snapshot.data!.data!.mobilePhone
                                                  .toString(),
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            )
                                          : Text(""),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Telefon: ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      child: snapshot.data!.data!.landPhone
                                                  .toString() ==
                                              null
                                          ? Text(
                                              snapshot.data!.data!.landPhone
                                                  .toString(),
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            )
                                          : Text(""),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Email : ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      child: snapshot.data!.data!.email
                                                  .toString() ==
                                              null
                                          ? Text(
                                              snapshot.data!.data!.email
                                                  .toString(),
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            )
                                          : Text(""),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Facebook : ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      child: Link(
                                        // ignore: sort_child_properties_last
                                        child: ListTile(
                                          title: Text(
                                            'Link için tıkla',
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        url: snapshot.data!.data!.facebookUrl
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Instagram : ",
                                      style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      child: Link(
                                        // ignore: sort_child_properties_last
                                        child: ListTile(
                                          title: Text(
                                            'Link için tıkla',
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        url: snapshot.data!.data!.instagramUrl
                                            .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ]),
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
