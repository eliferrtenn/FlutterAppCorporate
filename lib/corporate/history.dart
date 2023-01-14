// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types, prefer_interpolation_to_compose_strings, dead_code

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/corporate/generalCorporatePage.dart';
import '../Services/HistoryServices/HistoryService.dart';
import '../constants/generalDrawer.dart';
import '../models/responseModels/historyResponses/ListHistoryResponse.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.generalColor,
        primary: true,
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Constants.generalColor,
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 253, 148, 0),
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
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;
  List<dynamic>? data;
  Future<ListHistoryResponse>? model;

  @override
  void initState() {
    super.initState();
    model = HistoryService.GetHistories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Constants.generalColor,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              opaque: true,
                              type: PageTransitionType.leftToRight,
                              alignment: Alignment.bottomCenter,
                              duration: Constants.pageDuration,
                              child: GeneralCorporatePage(),
                              isIos: true,
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20, color: Color.fromARGB(255, 253, 148, 0))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  Center(
                    child: Text(
                      "Tarihçe",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          listItems(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
  FutureBuilder<ListHistoryResponse> listItems() {
    return FutureBuilder<ListHistoryResponse>(
                          future: HistoryService.GetHistories(),
                          builder: (context,
                              AsyncSnapshot<ListHistoryResponse> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      height: 75,
                                      width: 320,
                                      color: Colors.white,
                                      child: Center(
                                        child: snapshot.data!.data![index].photoUrl!=null?FadeInImage(
                                        image: NetworkImage(snapshot.data!.data![index]
                                                    .photoUrl
                                                    .toString()),
                                        placeholder: AssetImage(
                                            'assets/images/history/AkademiAdres.jpeg'),
                                      ) : Text("deeneme")
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
