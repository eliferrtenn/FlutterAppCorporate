// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, file_names, unused_field, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/ContactServices/ContactService.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/contact/getContact.dart';
import 'package:pro_tekno1/contact/getGoogleMap.dart';
import '../constants/generalDrawer.dart';
import '../projects/generalProjectPage.dart';
import '../media/homeMedia.dart';
import '../models/responseModels/contactResponses/ListContactResponse.dart';

class HomeContactPage extends StatefulWidget {
  const HomeContactPage({super.key});

  @override
  State<HomeContactPage> createState() => _HomeContactPageState();
}

class _HomeContactPageState extends State<HomeContactPage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        FoldableSidebarBuilder(
          drawerBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(),
          status: drawerStatus,
        );
        setState(() {
          drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
              ? FSBStatus.FSB_CLOSE
              : FSBStatus.FSB_OPEN;
        });
        break;
      case 1:
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: General_Project_Page(),
            ));
        break;
      case 2:
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: HomeMediaPage(),
            ));
        setState(() {
          drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
              ? FSBStatus.FSB_CLOSE
              : FSBStatus.FSB_OPEN;
        });
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Color.fromARGB(255, 255, 255, 255),
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
        bottomNavigationBar: bottomNavbar(context),
      ),
    );
  }

  Container bottomNavbar(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 65,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        unselectedItemColor: Constants.generalColor,
        unselectedLabelStyle: TextStyle(
          color: Constants.generalColor,
        ),
        selectedItemColor: Color.fromARGB(255, 231, 90, 20),
        selectedLabelStyle: TextStyle(
          color: Constants.generalColor,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.menu,
            ),
            label: 'Menü',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.precision_manufacturing_sharp),
            label: 'Projeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media_outlined),
            label: 'Medya',
          ),
        ],
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SectionTitle(),
                ],
              ),
            ),
            bodyPartial(context),
          ]),
        ),
      ),
    );
  }

  Center SectionTitle() {
    return Center(
      child: Text(
        "İletişim",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color.fromARGB(255, 253, 148, 0)),
      ),
    );
  }

  Center bodyPartial(BuildContext context) {
    const CameraPosition kGooglePlex =
        CameraPosition(target: LatLng(39.927040, 32.834350), zoom: 14.4746);
    return Center(
      child: FutureBuilder<ListContactResponse>(
        future: ContactService.GetContacts(),
        builder: (context, AsyncSnapshot<ListContactResponse> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 30),
                    height: (MediaQuery.of(context).size.height / 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 35,
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            opaque: true,
                                            isIos: true,
                                            type:
                                                PageTransitionType.leftToRight,
                                            alignment: Alignment.bottomCenter,
                                            duration: Constants.pageDuration,
                                            child: GetGoogleMap(
                                                id: snapshot.data!.data![index]
                                                        .id ??
                                                    1)));
                                  },
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Icon(Icons.location_on,
                                              size: 30,
                                              color: Constants.generalColor),
                                          Text(
                                            "Yol Tarifi",
                                            style: TextStyle(
                                                color: Constants.generalColor),
                                          )
                                        ],
                                      )),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            opaque: true,
                                            isIos: true,
                                            type:
                                                PageTransitionType.leftToRight,
                                            alignment: Alignment.bottomCenter,
                                            duration: Constants.pageDuration,
                                            child: GetContactPage(id:snapshot.data!.data![index]
                                                        .id ??
                                                    1)));
                                  },
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                snapshot
                                                    .data!.data![index].title
                                                    .toString(),
                                                style: TextStyle(
                                                    color:
                                                        Constants.generalColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_circle_right_sharp,
                                          size: 24,
                                          color:
                                              Color.fromARGB(255, 253, 148, 0)),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  );
                }); // Safe
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return Text("");
        },
      ),
    );
  }
}
