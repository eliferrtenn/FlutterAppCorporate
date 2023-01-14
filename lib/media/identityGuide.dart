// ignore_for_file: file_names
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:pro_tekno1/Services/IdentityGuideServices/IdentityGuideService.dart';
import 'package:pro_tekno1/constants/constants.dart';

import '../constants/generalDrawer.dart';
import '../models/ResponseModels/IdentityGuideResponses/GetIdentityGuideResponse.dart';

class IdentityGuidePage extends StatefulWidget {
  @override
  _IdentityGuidePageState createState() => _IdentityGuidePageState();
}

class _IdentityGuidePageState extends State<IdentityGuidePage> {
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
          screenContents: FirstScreen(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Constants.generalColor,
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
  var path =
      "https://cdn.pixabay.com/photo/2021/12/29/19/08/christmas-6902574_1280.jpg";
  void saveImage() async {
    await GallerySaver.saveImage(path, toDcim: true);
  }

  @override
  Widget build(BuildContext context) {
    final double loginHeight = (MediaQuery.of(context).size.height / 14);

    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Constants.generalColor,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Kurumsal Kimlik Rehberi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: loginHeight*2),
            child: bodyPartial(context)),
      ]),
    );
  }

  FutureBuilder<GetIdentityGuideResponse> bodyPartial(BuildContext context) {
    return FutureBuilder<GetIdentityGuideResponse>(
      future: IdentityGuideService.GetIdentityGuide(),
      builder: (context, AsyncSnapshot<GetIdentityGuideResponse> snapshot) {
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
                  onTap: () => showDialog(
                      builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(2),
                            title: Container(
                              height:
                                  MediaQuery.of(context).size.height / 2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(snapshot
                                      .data!.data![index].photoUrl
                                      .toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                      context: context),
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
                                    .data!.data![index].photoUrl
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
                                    .data!.data![index + 1].photoUrl
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
