// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, sort_child_properties_last, must_call_super, unnecessary_new, file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/corporate/descCompany.dart';
import 'package:pro_tekno1/corporate/history.dart';
import 'package:pro_tekno1/corporate/humanResource.dart';
import 'package:pro_tekno1/corporate/kvkkk.dart';
import 'package:pro_tekno1/corporate/sustainability.dart';
import 'package:pro_tekno1/projects/generalProjectPage.dart';

import '../models/responseModels/introResponses/GetIntroResponse.dart';

import '../Services/CommonServices/CommonService.dart';
import '../models/responseModels/kvkkResponses/GetKvkkResponse.dart';
import '../models/responseModels/sustainabilityResponses/GetSustainabilityResponse.dart';

List<Map<String, dynamic>> items = [
  {
    "icon": Icon(Icons.ac_unit),
    "name": "Biz Kimiz ?",
    "photo": "assets/images/corporate/CorporateBizKimiz.jpeg",
    "number": "1",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Tarihçe",
    "photo": "assets/images/corporate/CorporateHistory.jpg",
    "number": "2",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Sürdürülebilirlik",
    "photo": "assets/images/corporate/CorporateSustainability.jpeg",
    "number": "3",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "İnsan Kaynakları",
    "photo": "assets/images/corporate/CorporateHumanResource.jpg",
    "number": "4",
  },
  {
    "icon": Icon(Icons.access_alarms),
    "name": "Kvkk",
    "photo": "assets/images/corporate/CorporateKvkk.jpg",
    "number": "5",
  },
];
String? photoUrl;

class GeneralCorporatePagePartial extends StatefulWidget {
  const GeneralCorporatePagePartial({super.key});
  @override
  State<GeneralCorporatePagePartial> createState() =>
      _GeneralCorporatePagePartialState();
}

class _GeneralCorporatePagePartialState
    extends State<GeneralCorporatePagePartial> with TickerProviderStateMixin {
  int pageIndex = 0;
  final pages = [
    General_Project_Page(),
  ];
  List<List<Widget>> buttonlar = [[]];
  late Widget gorunum;
  List<Widget> rows = [];
  @override
  void initState() {
    CommonService.getIntro().then((response) {
      setState(() {
        GetIntroResponse model = response;
        photoUrl = model.data!.photoUrl;
      });
    });
    super.initState();

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
    return SectionBody(context);
  }

  SingleChildScrollView SectionBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: (MediaQuery.of(context).size.width / 3),
          child: GestureDetector(
            onTap: () => {
              {NavigatePages(widget.itemData["number"])}
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 2,
              color: Colors.white,
              child: SectionPage(widget.itemData["number"]),
            ),
          ),
        ),
      ),
    );
  }

  Center SectionPage(String data) {
    if (data == "1") {
      return Center(
        child: FutureBuilder(
          future: CommonService.getIntro(),
          builder: (context, AsyncSnapshot<GetIntroResponse> snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                height: MediaQuery.of(context).size.height / 5,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: new NetworkImage(
                          snapshot.data!.data!.photoUrl.toString()),
                      fit: BoxFit.cover,
                    )),
              );
            } else {
              return Center(
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
              );
            }
          },
        ),
      );
    } else if (data == "2") {
      return Center(
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
      );
    } else if (data == "3") {
      return Center(
        child: FutureBuilder(
          future: CommonService.getSustainability(),
          builder:
              (context, AsyncSnapshot<GetSustainabilityResponse> snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                height: MediaQuery.of(context).size.height / 5,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: new NetworkImage(
                          snapshot.data!.data!.photoUrl.toString()),
                      fit: BoxFit.cover,
                    )),
              );
            } else {
              return Center(
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
              );
            }
          },
        ),
      );
    } else if (data == "4") {
      return Center(
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
      );
    } else {
      return Center(
        child: FutureBuilder(
          future: CommonService.getKvkk(),
          builder:
              (context, AsyncSnapshot<GetKvkkResponse> snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                height: MediaQuery.of(context).size.height / 5,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: new NetworkImage(
                          snapshot.data!.data!.photoUrl.toString()),
                      fit: BoxFit.cover,
                    )),
              );
            } else {
              return Center(
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
              );
            }
          },
        ),
      );
    }
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
            child: Description_Page(),
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
            child: HistoryPage(),
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
            child: SustainabilityPage(),
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
            child: HumanResourcePage(),
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
            child: KvkkPage(),
          ));
    }
  }
}
