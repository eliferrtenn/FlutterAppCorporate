// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/media/homeMedia.dart';

import 'Services/CommonServices/CommonService.dart';
import 'constants/generalDrawer.dart';
import 'corporate/descCompany.dart';
import 'projects/generalProjectPage.dart';
import 'models/responseModels/introResponses/GetIntroResponse.dart';

class Home_Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home_Page> {
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
            icon: Icon(
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
    final double loginHeight = (MediaQuery.of(context).size.height / 14);
    final double loginWidth = (MediaQuery.of(context).size.width);
    final Color denemeTextColor = Color.fromARGB(255, 255, 255, 255);
    return SingleChildScrollView(
      child: bodyPartial(context, loginHeight, denemeTextColor, loginWidth),
    );
  }

  Container bodyPartial(BuildContext context, double loginHeight,
      Color denemeTextColor, double loginWidth) {
    return Container(
      child: FutureBuilder(
        future: CommonService.getIntro(),
        builder: (context, AsyncSnapshot<GetIntroResponse> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Container(
                  color: Constants.generalColor,
                  width: MediaQuery.of(context).size.width,
                  height: loginHeight * 1.2,
                  child: Center(
                    child: Text(
                      "Ekinci",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  height: loginHeight / 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: loginHeight * 3,
                  decoration: BoxDecoration(
                      color: Constants.generalColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Solaris",
                          style: TextStyle(
                              color: denemeTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                        Text(
                          "Yeni komşularınız; Güneşin Enerjisi, Rüzgârın Sesi,",
                          style: TextStyle(
                            color: denemeTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: denemeTextColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "Güneş",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.generalColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: denemeTextColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "Enerji",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.generalColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: denemeTextColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                "Rüzgar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Constants.generalColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: loginHeight * 4.6,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              width: loginWidth / 2 - 25,
                              height: loginHeight * 4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                       snapshot.data!.data!.photoUrl.toString()),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: loginWidth / 2 - 25,
                              height: loginHeight * 4,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 207, 207, 207),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    color: Constants.generalColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.data!.yearCount.toString()+" Yıl",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(
                                    Icons.area_chart_sharp,
                                    color: Constants.generalColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                   snapshot.data!.data!.squareMeter.toString()+ " m2",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: loginHeight * 4.2,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 170, 168, 168),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(snapshot.data!.data!.title.toString()),
                            Text(
                                "${snapshot.data!.data!.description.toString().substring(0, 200)}..."),
                          ],
                        ),
                        SizedBox(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    opaque: true,
                                    type: PageTransitionType.leftToRight,
                                    alignment: Alignment.bottomCenter,
                                    duration: Constants.pageDuration,
                                    child: Description_Page(),
                                    isIos: true,
                                  ));
                            },
                            child: Text(
                              "Keşfet",
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
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Text("");
          }
        },
      ),
    );
  }
}
