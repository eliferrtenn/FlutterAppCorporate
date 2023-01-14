// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/ProjectServices/ProjectService.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/media/homeMedia.dart';
import 'package:pro_tekno1/projects/project_details.dart';
import '../constants/generalDrawer.dart';
import 'generalProjectPage.dart';
import '../models/ResponseModels/ProjectResponses/GetProjectResponse.dart';
import '../models/ResponseModels/ProjectResponses/ListProjectResponse.dart';

class GetProjectsPage extends StatefulWidget {
  int id;
  GetProjectsPage({super.key, required this.id});
  @override
  _GetProjectPageState createState() => _GetProjectPageState();
}

class _GetProjectPageState extends State<GetProjectsPage> {
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
          screenContents: FirstScreen(
            statusID: widget.id,
          ),
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
          screenContents: FirstScreen(
            statusID: widget.id,
          ),
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
  int statusID;
  FirstScreen({super.key, required this.statusID});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  late Future<GetProjectResponse> getProjectStatus;
  late Future<ListProjectResponse> listProjectResponse;
  @override
  void initState() {
    super.initState();
    getProjectStatus = ProjectService.GetProject(1);
    listProjectResponse = ProjectService.GetProjects(widget.statusID);
  }

  @override
  Widget build(BuildContext context) {
    final double loginHeight = (MediaQuery.of(context).size.height / 14);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          bodyStack(loginHeight, context),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2 * 1.3),
              child: bodyPartial(context)),
        ],
      ),
    );
  }

  FutureBuilder<GetProjectResponse> bodyStack(
      double loginHeight, BuildContext context) {
    return FutureBuilder(
      future: getProjectStatus,
      builder: (context, AsyncSnapshot<GetProjectResponse> snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: <Widget>[
              Positioned(
                right: 25,
                child: SizedBox(
                  height: loginHeight * 2,
                  child: Image.asset(
                    width: (MediaQuery.of(context).size.width / 3) * 0.9,
                    height: (MediaQuery.of(context).size.height / 14) * 2,
                    'assets/images/logo/ekinciLogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: loginHeight * 1.5, left: 12),
                height: loginHeight * 2,
                child: Text(
                  snapshot.data!.data!.statusName.toString(),
                  style: GoogleFonts.assistant(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: loginHeight * 3, left: 12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height / 4) * 1.2,
                  child: PageView.builder(
                      itemCount: 4,
                      pageSnapping: true,
                      onPageChanged: (page) {
                        setState(() {});
                      },
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot
                                  .data!.data!.projectPhotos![i].photoUrl
                                  .toString()),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        );
                      }),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: loginHeight * 7.3, left: 12),
                child: Row(
                  children: [
                    Container(
                        height: loginHeight,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 213, 213, 213),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.note_add,
                              color: Color.fromARGB(255, 128, 129, 131),
                            ),
                            onPressed: () {})),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        height: loginHeight,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 213, 213, 213),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.precision_manufacturing_outlined,
                              color: Color.fromARGB(255, 128, 129, 131),
                            ),
                            onPressed: () {})),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        height: loginHeight,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 213, 213, 213),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.present_to_all_rounded,
                              color: Color.fromARGB(255, 128, 129, 131),
                            ),
                            onPressed: () {})),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          );
        }
        return Text("");
      },
    );
  }

  FutureBuilder bodyPartial(BuildContext context) {
    return FutureBuilder(
      future:listProjectResponse,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return Text("");
                }
                if (index != 0 && index % 2 != 0) {
                  return Text("");
                }
                if(snapshot.data!.data!.length==(index+1)){
                  return Text("");
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Project_DetailsPage(
                            id: snapshot.data!.data![index].id ?? 1),
                      ),
                    );
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
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
                          width: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(snapshot
                                    .data!.data![index + 1].thumbUrl
                                    .toString()),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
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
