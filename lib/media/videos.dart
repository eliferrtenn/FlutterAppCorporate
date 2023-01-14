// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:pro_tekno1/Services/VideoServices/VideoService.dart';
import 'package:pro_tekno1/constants/constants.dart';

import '../constants/generalDrawer.dart';
import 'package:link/link.dart';

import '../models/ResponseModels/videosResponses/ListvideoResponse.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FSBStatus drawerStatus = FSBStatus.FSB_CLOSE;

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
                  "Videolar",
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
            margin: EdgeInsets.only(top: loginHeight,right:MediaQuery.of(context).size.width/25,left:MediaQuery.of(context).size.width/25),
            child: videos_(context)),
      ]),
    );
  }

  FutureBuilder<ListVideoResponse> videos_(BuildContext context) {
    return FutureBuilder<ListVideoResponse>(
      future: VideoService.GettVideos(),
      builder: (context, AsyncSnapshot<ListVideoResponse> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 7,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Link(
                      // ignore: sort_child_properties_last
                      child: ListTile(
                        title: Text(
                          snapshot.data!.data![index].title.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.video_call,
                          color: Colors.deepOrange,
                        ),
                      ),
                      url: snapshot.data!.data![index].videoUrl.toString(),
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