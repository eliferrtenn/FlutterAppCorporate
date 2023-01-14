// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/AnnouncementServices/AnnouncementService.dart';
import 'package:pro_tekno1/constants/constants.dart';

import '../constants/generalDrawer.dart';
import '../models/responseModels/announcementResponses/ListAnnouncementResponse.dart';
import 'getAnnouncement.dart';
import 'homeMedia.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 92, 91, 91),
        primary: true,
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Color.fromARGB(255, 44, 44, 44),
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
            backgroundColor: Constants.generalColor,
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

        final double loginHeight = (MediaQuery.of(context).size.height / 14);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:loginHeight*2,
            child: Row(
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
                              child: HomeMediaPage(),
                              isIos: true,
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20, color: Color.fromARGB(255, 253, 148, 0))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 11,
                  ),
                  SectionTitle(),
              ],
            ),
          ),

          Container(
              margin: EdgeInsets.only(top: loginHeight*2),
              child: bodyPartial(context)),
        ],
      ),
    );
  }

  Align SectionTitle() {
    return Align(
              alignment: Alignment(0.0, -1.0),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: (MediaQuery.of(context).size.width / 3) * 2,
                height: MediaQuery.of(context).size.height / 14,
                child: Text(
                  "Haberler/Duyurular",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 253, 148, 0)),
                ),
              ),
            );
  }

  FutureBuilder<ListAnnouncementResponse> bodyPartial(BuildContext context) {
    return FutureBuilder<ListAnnouncementResponse>(
      future: AnnouncementService.GetAnnouncements(),
      builder: (context, AsyncSnapshot<ListAnnouncementResponse> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white,
                       shadowColor: Colors.transparent,
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          opaque: true,
                          isIos: true,
                          type: PageTransitionType.leftToRight,
                          alignment: Alignment.bottomCenter,
                          duration: Constants.pageDuration,
                          child: GetAnnouncementPage(id:snapshot.data!.data![index].id??1),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 30),
                    height: (MediaQuery.of(context).size.height / 5),
                    
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data!.data![index].thumbUrl
                                        .toString()),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 40,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    snapshot.data!.data![index].title
                                        .toString(),
                                    style: TextStyle(
                                        color: Constants.generalColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /20) * 4.8,
                                    ),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  20) *
                                              6,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 197, 197, 197),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Center(
                                            child: Text(
                                              "10.03.2021",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 15,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                );     
             }); // Safe
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default show a loading spinner.
        return Text("");
      },
    );
  }


}

