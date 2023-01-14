// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/TechnicServiceDemandServices/TechnicServiceDemandService.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/CreateTechnicalServiceDemand.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/GetTechnicalServiceDemand.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/models/ResponseModels/TechnicalServiceDemandResponses/ListTechnicalServiceDemandResponse.dart';
import '../constants/generalDrawer.dart';

class HomeTechnicalServicePage extends StatefulWidget {
 final String resultMesssage;
  const HomeTechnicalServicePage({super.key, required this.resultMesssage});
  @override
  _HomeTechnicalServicePageState createState() =>
      _HomeTechnicalServicePageState();
}

class _HomeTechnicalServicePageState extends State<HomeTechnicalServicePage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 92, 91, 91),
        primary: true,
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Color.fromARGB(255, 44, 44, 44),
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(resultMesssage:widget.resultMesssage,),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
 final String resultMesssage;

  FirstScreen({super.key,required this.resultMesssage});

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
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 155, 150, 148),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Teknik Servis Taleplerin",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),
           Text(
             widget.resultMesssage,
             style: TextStyle(
                 fontSize: 17,
                 color: Color.fromARGB(255, 255, 255, 255)),
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
                      child:CreateTechnicalServiceDemandPage()
                    ));
              },
              child: Text(
                'Teknik Servis Talebi Oluştur',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          
            Column(children: [sectionBody(context)]),
          ]),
        ),
      ),
    );
  }

  FutureBuilder<ListTechnicalServiceDemandResponse> sectionBody(
      BuildContext context) {
    return FutureBuilder<ListTechnicalServiceDemandResponse>(
      future: TechnicServiceDemandService.ListTechnicDemandServices(),
      builder: (context,
          AsyncSnapshot<ListTechnicalServiceDemandResponse> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 7,
                  margin: EdgeInsets.only(
                      top: 30,
                      right: MediaQuery.of(context).size.width / 30,
                      left: MediaQuery.of(context).size.width / 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: ListTile(
                      title: Text(
                        snapshot.data!.data![index].title.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.deepOrange,
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
                              child: GetTechnicalServiceDemandPage(id:snapshot.data!.data![index].id??1,),
                            ));
                      },
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
