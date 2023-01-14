// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/CommercialAreaService/CommercialAreaService.dart';
import 'package:pro_tekno1/commercialArea/homeCommercialArea.dart';
import 'package:pro_tekno1/constants/constants.dart';

import '../models/responseModels/commercialAreaResponses/GetCommercialAreaResponse.dart';

class GetCommercialArea extends StatelessWidget {
  final int id;
  const GetCommercialArea({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            _buildMarginTop(),
            _buildMainWidget(context),
            _buildFooterWidget(context),
          ],
        ));
  }

  Widget _buildMarginTop() {
    return Container(
      margin: EdgeInsets.only(top: 20),
    );
  }

  Container _buildMainWidget(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: CommercialAreaService.GetCommercialArea(id),
        builder: (context, AsyncSnapshot<GetCommercialAreaResponse> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: Constants.generalColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height / 11,
                child: Center(
                  child: Text(snapshot.data!.data!.title.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height - 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              snapshot.data!.data!.photoUrl.toString()),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
            ]);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildFooterWidget(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.white, shadowColor: Colors.transparent);
    double size = 40.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: style,
        onPressed: () {
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
        child: CircleAvatar(
          backgroundColor: Constants.generalColor,
          // ignore: sort_child_properties_last
          child: Icon(
            size: 25,
            Icons.turn_left,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          radius: size,
        ),
      ),
    );
  }
}
