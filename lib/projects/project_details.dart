// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, camel_case_types, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/ProjectServices/ProjectService.dart';
import 'package:pro_tekno1/projects/generalProjectPage.dart';
import '../../constants/constants.dart';

class Project_DetailsPage extends StatefulWidget {
  int id;
  Project_DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<Project_DetailsPage> createState() => _Project_DetailsPageState();
}

class _Project_DetailsPageState extends State<Project_DetailsPage> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double pageHeight = MediaQuery.of(context).size.height / 5;
    final double pageWidth = MediaQuery.of(context).size.width;
    final Color denemeTextColor = Color.fromARGB(255, 255, 255, 255);

    List<String> images = [
      "assets/images/projects/endProjects/senfoni1.jpeg",
      "assets/images/projects/endProjects/senfoni2.jpeg",
      "assets/images/projects/endProjects/senfoni3.jpeg",
      "assets/images/projects/endProjects/senfoni4.jpeg",
    ];
    return Scaffold(
      backgroundColor: Constants.generalColor,
      primary: true,
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: bodyPartial(
            pageHeight, pageWidth, context, images, denemeTextColor),
      ),
    );
  }

  FutureBuilder bodyPartial(double pageHeight, double pageWidth,
      BuildContext context, List<String> images, Color denemeTextColor) {
    return FutureBuilder(
      future: ProjectService.GetProject(widget.id),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(children: [
            Container(
              height: pageHeight * 2.8,
              width: pageWidth,
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
                                  child: General_Project_Page(),
                                  isIos: true,
                                ));
                          },
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20,
                              color: Color.fromARGB(255, 253, 148, 0))),
                    ],
                  ),
                  Text(
                    snapshot.data!.data!.title.toString(),
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
        SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 4),
              child: PageView.builder(
                  itemCount:snapshot.data!.data!.projectPhotos!.length,
                  //itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {});
                  },
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () => showDialog(
                          builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(2),
                                title: Container(
                                  height:MediaQuery.of(context).size.width/2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!.data!.projectPhotos![i].photoUrl.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                          context: context),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!.data!.projectPhotos![i].photoUrl.toString()),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    );
                  }
                  ), 
            ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Constants.generalColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "Proje Tarihi : " +
                                snapshot.data!.data!.projectDate.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: denemeTextColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Constants.generalColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                // ignore: unnecessary_null_comparison
                child: snapshot.data!.data!.deliveryDate.toString() ==
                                              null
                                          ? Text(
                            "Teslim Tarihi : " +
                                snapshot.data!.data!.deliveryDate.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: denemeTextColor,
                            ),
                          ):Text(""),
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
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.apartment,
                              color: Constants.generalColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Center(
                              child: Text(
                                snapshot.data!.data!.apartmentCount
                                        .toString() +
                                    "Daire",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.generalColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 155,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              Icons.landscape_rounded,
                              color: Constants.generalColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Center(
                                child: snapshot.data!.data!.squareMeter
                                                  .toString() == null
                                          ?  Text(
                                snapshot.data!.data!.squareMeter.toString() +
                                    "m2 yaşam alanı",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.generalColor,
                                ),
                              ):Text(""),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data!.data!.description.toString(),
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          ]);
        } else {
          return Text("");
        }
      },
    );
  }
}