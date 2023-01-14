// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names, annotate_overrides, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import '../Services/AnnouncementServices/AnnouncementService.dart';
import '../models/responseModels/announcementResponses/GetAnnouncementResponse.dart';

import '../constants/generalDrawer.dart';
import 'announcement.dart';

class GetAnnouncementPage extends StatefulWidget {
    final int id;

  const GetAnnouncementPage ({ Key? key, required this.id }): super(key: key);
  @override
  _GetAnnouncementPageState createState() => _GetAnnouncementPageState();
}

class _GetAnnouncementPageState extends State<GetAnnouncementPage> {
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
          screenContents: FirstScreen(id:widget.id,),
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

    return SingleChildScrollView(
      child: 
      bodyPartial(pageHeight, pageWidth, context,widget.id),
    );
  }

  Container bodyPartial(double pageHeight, double pageWidth, BuildContext context,int id) {
    return Container(
      child: FutureBuilder(
          future: AnnouncementService.GetAnnouncement(id),
          builder: (context, AsyncSnapshot<GetAnnouncementResponse> snapshot) {
            if (snapshot.hasData) {
           return   Column(children: [
        Container(
          height: pageHeight * 2.2,
          width: pageWidth,
          decoration: BoxDecoration(
            color: Colors.white,
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
                              child: AnnouncementPage(),
                              isIos: true,
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20, color: Color.fromARGB(255, 253, 148, 0))),
                ],
              ),   
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 4),
                child: PageView.builder(
                    itemCount:snapshot.data!.data!.announcementPhotos!.length,
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
                                        image: NetworkImage(snapshot.data!.data!.announcementPhotos![i].photoUrl.toString()),
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
                              image: NetworkImage(snapshot.data!.data!.announcementPhotos![i].photoUrl.toString()),
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
              FutureBuilder(
                future: AnnouncementService.GetAnnouncement(id),
                builder:
                    (context, AsyncSnapshot<GetAnnouncementResponse> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data!.data!.title.toString(),
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
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
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
              color: Constants.generalColor,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FutureBuilder(
                      future: AnnouncementService.GetAnnouncement(id),
                      builder: (context,
                          AsyncSnapshot<GetAnnouncementResponse> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Text(
                                snapshot.data!.data!.description.toString(),
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      ]);
              } else {
              return CircularProgressIndicator();
            }
          },
    ),
    );
  }
  }
