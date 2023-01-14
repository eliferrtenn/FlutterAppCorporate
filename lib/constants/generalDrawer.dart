// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/HomeTechnicalServiceDemand.dart';
import 'package:pro_tekno1/corporate/generalCorporatePage.dart';
import 'package:pro_tekno1/member/GetMember.dart';

import '../commercialArea/homeCommercialArea.dart';
import '../contact/homeContact.dart';
import '../homePage.dart';
import 'constants.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 150,
              color: Constants.generalColor,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    "assets/images/logo/ekinciWhiteLogo.png",
                    width: 190,
                    height: 60,
                  ),
                  Text(
                    "bilgi@ekinciinsaat.com.tr",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
          ListTile(
            onTap: () {
                        Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: GetMemberPage(),
                  ));
            },
            leading: Icon(Icons.person),
            title: Text(
              "Profilim",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text(
              'Anasayfa',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: Home_Page(),
                  ));
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.corporate_fare),
            title: const Text(
              'Kurumsal',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: GeneralCorporatePage(),
                  ));
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ), ListTile(
            leading: Icon(Icons.mediation_rounded),
            title: const Text(
              'Ticari Alanlar',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: HomeCommercialAreaPage(),
                  ));
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.contactless),
            title: const Text(
              'İletişim',
              style: TextStyle(fontSize: 15),
            ),
                onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: HomeContactPage(),
                  ));
            },
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),

          ListTile(
            leading: Icon(Icons.design_services_rounded),
            title: const Text(
              'Teknik Servis',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    opaque: true,
                    isIos: true,
                    type: PageTransitionType.leftToRight,
                    alignment: Alignment.bottomCenter,
                    duration: Constants.pageDuration,
                    child: HomeTechnicalServicePage(resultMesssage:"",),
                  ));
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
