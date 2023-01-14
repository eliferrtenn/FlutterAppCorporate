// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, file_names, unused_field

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import '../constants/generalDrawer.dart';
import '../projects/generalProjectPage.dart';
import 'homeMediaPartial.dart';

class HomeMediaPage extends StatefulWidget {
  const HomeMediaPage({super.key});

  @override
  State<HomeMediaPage> createState() => _HomeMediaPageState();
}

class _HomeMediaPageState extends State<HomeMediaPage> {

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

class _FirstScreenState extends State<FirstScreen>with TickerProviderStateMixin{
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
      late AnimationController _opacityController;
  late Animation _opacityAnimation;
  
    @override
  void initState() {
    _opacityController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _opacityAnimation = CurvedAnimation(
      parent: _opacityController,
      curve: Curves.bounceInOut,
    );

    _opacityController.addListener(() {
      setState(() {});
    });
    _opacityController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        final double loginHeight = (MediaQuery.of(context).size.height / 14);
    return  SingleChildScrollView(
      child: Stack(
          children: <Widget>[          
            Container(
              width:MediaQuery.of(context).size.width,
              height: loginHeight*1.8,            
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 198, 106, 61),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                      bottomLeft:Radius.circular(200)
                    )),   
              child: Center(
                child: Text(
                  "Medya Merkezi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color:Colors.white),
                ),
              ),
            ),  
             HomePagePartialPage(),
          ],
        ),
    );
  
  }
}


