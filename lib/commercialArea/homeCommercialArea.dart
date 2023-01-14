// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/CommercialAreaService/CommercialAreaService.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/media/homeMedia.dart';

import '../constants/generalDrawer.dart';
import '../projects/generalProjectPage.dart';
import '../models/responseModels/commercialAreaResponses/ListCommercialAreaResponse.dart';
import 'getCommercialArea.dart';

class HomeCommercialAreaPage extends StatefulWidget {
  @override
  _HomeCommercialAreaPageState createState() => _HomeCommercialAreaPageState();
}

class _HomeCommercialAreaPageState extends State<HomeCommercialAreaPage> {
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: loginHeight * 1.5,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 198, 106, 61),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                    bottomLeft: Radius.circular(200))),
            child: Align(
              alignment: Alignment(0.0, -1.0),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: (MediaQuery.of(context).size.width / 3) * 1.4,
                height: loginHeight,
                child: Text(
                  "Ticari Alanlar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          
          Container(
              margin: EdgeInsets.only(top: loginHeight*2),
              child: sectionBody(context)),
        ],
      ),
    );
  }

  FutureBuilder<ListCommercialAreaResponse> sectionBody(BuildContext context) {
    return FutureBuilder<ListCommercialAreaResponse>(
      future: CommercialAreaService.GetCommercialAreas(),
      builder: (context, AsyncSnapshot<ListCommercialAreaResponse> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            snapshot.data!.data![index].photoUrl.toString()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        snapshot.data!.data![index].title.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 4,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
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
                                child: GetCommercialArea(
                                  id: snapshot.data!.data![index].id,
                                ),
                              ));
                        },
                        child: Text(
                          'Keşfet',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                );
              }); // Safe
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Text("");
      },
    );
  }
}
