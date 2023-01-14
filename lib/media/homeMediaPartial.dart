// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last, must_call_super, file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/projects/generalProjectPage.dart';
import 'package:pro_tekno1/media/announcement.dart';
import 'package:pro_tekno1/media/blog.dart';
import 'package:pro_tekno1/media/identityGuide.dart';
import 'package:pro_tekno1/media/press.dart';
import 'package:pro_tekno1/media/videos.dart';

List<Map<String, dynamic>> items = [
  {
    "icon": Icon(Icons.ac_unit),
    "name": "Haberler Duyurular",
    "photo": "assets/images/media/haberler.jpg",
    "number": "1",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Blog",
    "photo": "assets/images/media/blog.jpg",
    "number": "2",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Basında Ekinci",
    "photo": "assets/images/media/pressEkinci.jpg",
    "number": "3",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Kurumsal Kimlik Rehberi",
    "photo": "assets/images/media/kurumsalKimlik.jpg",
    "number": "4",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Videolar",
    "photo": "assets/images/media/resimyok.jpg",
    "number": "5",
  },
];

class HomePagePartialPage extends StatefulWidget {
  const HomePagePartialPage({super.key});
  @override
  State<HomePagePartialPage> createState() => _HomePagePartialPageState();
}

class _HomePagePartialPageState extends State<HomePagePartialPage>
    with TickerProviderStateMixin {
  int pageIndex = 0;

  final pages = [
    General_Project_Page(),
  ];
  List<List<Widget>> buttonlar = [[]];
  late Widget gorunum;
  List<Widget> rows = [];
  @override
  void initState() {
    for (int i = 0; i < items.length; i++) {
      if (buttonlar[buttonlar.length - 1].length == 2) {
        buttonlar.add([]);
      }
      buttonlar[buttonlar.length - 1].add(MenuItem(itemData: items[i]));
    }
    for (int i = 0; i < buttonlar.length; i++) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buttonlar[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double loginHeight = (MediaQuery.of(context).size.height / 14);

    return Container(
      margin: EdgeInsets.only(top: loginHeight * 2.5),
      child: Column(
        children: rows,
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({Key? key, required this.itemData}) : super(key: key);

  final Map<String, dynamic> itemData;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: (MediaQuery.of(context).size.width / 3),
          child: GestureDetector(
            onTap: () => {
              {NavigatePages(widget.itemData["number"])}
            },
            child: Container(
              child: Center(
                child: Text(
                  widget.itemData["name"],
                  style: GoogleFonts.acme(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(widget.itemData["photo"].toString()),
                    fit: BoxFit.cover),
              ),
            ),
            
          ),
        ),
      ),
    );
  }

  void NavigatePages(String data) {
    if (data == "1") {
      Navigator.push(
          context,
          PageTransition(
            opaque: true,
            isIos: true,
            type: PageTransitionType.leftToRight,
            alignment: Alignment.bottomCenter,
            duration: Constants.pageDuration,
            child: AnnouncementPage(),
          ));
    } else if (data == "2") {
      Navigator.push(
          context,
          PageTransition(
            opaque: true,
            isIos: true,
            type: PageTransitionType.leftToRight,
            alignment: Alignment.bottomCenter,
            duration: Constants.pageDuration,
            child: BlogPage(),
          ));
    } else if (data == "3") {
      Navigator.push(
          context,
          PageTransition(
            opaque: true,
            isIos: true,
            type: PageTransitionType.leftToRight,
            alignment: Alignment.bottomCenter,
            duration: Constants.pageDuration,
            child: PressPage(),
          ));
    } else if (data == "4") {
      Navigator.push(
          context,
          PageTransition(
            opaque: true,
            isIos: true,
            type: PageTransitionType.leftToRight,
            alignment: Alignment.bottomCenter,
            duration: Constants.pageDuration,
            child: IdentityGuidePage(),
          ));
    } else if (data == "5") {
      Navigator.push(
          context,
          PageTransition(
            opaque: true,
            isIos: true,
            type: PageTransitionType.leftToRight,
            alignment: Alignment.bottomCenter,
            duration: Constants.pageDuration,
            child: VideoPage(),
          ));
    }
  }
}
