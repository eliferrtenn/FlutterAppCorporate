// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/ProjectStatusServices/ProjectStatusService.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/projects/getProjects.dart';
import '../constants/generalDrawer.dart';
import '../media/homeMedia.dart';

class General_Project_Page extends StatefulWidget {
  @override
  _General_Project_PageState createState() => _General_Project_PageState();
}

class _General_Project_PageState extends State<General_Project_Page> {
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
      color:Colors.white,
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

class _FirstScreenState extends State<FirstScreen>with TickerProviderStateMixin{
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        final double loginHeight = (MediaQuery.of(context).size.height / 14);
    final double sizedBoxWidth = (MediaQuery.of(context).size.width / 2) * 1.95;
    final double sizedBoxHeight = (MediaQuery.of(context).size.height / 14) * 3;
    return  Stack(
        children: <Widget>[          
          Container(
            width:MediaQuery.of(context).size.width,
            height: loginHeight*2,            
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 198, 106, 61),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                    bottomLeft:Radius.circular(200)
                  )),   
            child: Align(
              alignment: Alignment(0.0, -1.0),
              child: Container(
                      margin:EdgeInsets.only(top:30),
                width: (MediaQuery.of(context).size.width / 3) * 1.2,
                height: loginHeight * 3,
                child: Text(
                  "Projelerimiz",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color:Colors.white),
                ),
              ),
            ),
          ),     
          Container(
            margin:EdgeInsets.only(top:loginHeight*3),
            child: SingleChildScrollView(
                child: bodyPartial(loginHeight, sizedBoxWidth, sizedBoxHeight, context)),
          ),
      
        ],
      ); 
  }

  FutureBuilder bodyPartial(double loginHeight, double sizedBoxWidth, double sizedBoxHeight, BuildContext context) {
    return FutureBuilder(
      future: ProjectStatusService.GetProjectStatus(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return     
    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 0,
              color: Colors.transparent,
              child: SizedBox(
                width: sizedBoxWidth,
                height: sizedBoxHeight,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        PageTransition(
                          opaque: true,
                          type: PageTransitionType.leftToRight,
                          alignment: Alignment.bottomCenter,
                          duration: Constants.pageDuration,
                          child: GetProjectsPage(id:snapshot.data!.data![index].id!),
                          isIos: true,
                        )),
                  },
                  child: Card(
                    elevation: 0,
                    shape: Constants.homePageCardShape,
                    child: ClipRRect(
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          child: Image.network(
                            width: (MediaQuery.of(context).size.width / 2) *
                                1.95,
                            height:
                                (MediaQuery.of(context).size.height / 14) *
                                    2,
                           snapshot.data!.data![index].photoUrl.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.data![index].name.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),

          ],
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