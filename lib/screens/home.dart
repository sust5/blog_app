import 'dart:math';

import 'package:blog_app/webservices/apiCall.dart';
import 'package:blog_app/widget/widget2.dart';
import 'package:blog_app/widget/widget3.dart';
import 'package:blog_app/widget/widget4.dart';
import 'package:blog_app/widget/widget5.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/widget/news_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
// List<Widget> tabs=[];

  final List<Tab> tabs = <Tab>[];
  //  List<Tab> tabs = <Tab>[Tab(text:"home")];

  _asyncMethod() async {
    var cats = await getCatList();
    for(var ids in cats){
      print(ids);
    }
    setState(() {
      tabs.add(Tab(text:" cats[0]"));
    });

    // for(var cat in cats) {
    //   tabs.add(Tab(text: cat));
    // }
  }
  @override
  void initState()  {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      _asyncMethod();
    });


  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getCatList(),
      builder: (c, s) {
        if (s.hasData) {
          List<Tab> tabs = <Tab>[];
          for (int i = 0; i < s.data!.length; i++) {
            tabs.add(Tab(
              child: Text(
                s.data![i],
                style: TextStyle(color: Colors.white),
              ),
            ));
          }
          return DefaultTabController(
            length: s.data!.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("This is Thakku blog"),
                backgroundColor: Colors.grey[900],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
          );
        }
        if (s.hasError) print(s.error.toString());
        return Scaffold(
          body: Container(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: TabBarView(
                        children: tabs.map((Tab tab) {
                          final String label = tab.text.toString();
                          if (label == "Cloud Computing") {
                            return Center(
                              child: Text("this is first"),
                            );
                          } else if (label == "Business") {
                            return Center(
                              child: Widget2(),
                            );
                          } else if (label == "Entertainment") {
                            return Center(
                              child: Widget3(),
                            );
                          } else if (label == "Sports") {
                            return Center(
                              child: Widget4(),
                            );
                          } else {
                            return Center(
                              child: Widget5(),
                            );
                          }
                        }).toList(),

                        // children: tabs.map((Technology) => NewsCardWidget()).toList()
                        //   .map((Business) => Widget2()).toList()

                        // NewsCardWidget()
                      ),
                    ),
                    );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //       length: tabs.length,
  //       child: SafeArea(
  //           child: Scaffold(
  //         appBar: AppBar(
  //           backgroundColor: Colors.white,
  //           title: Text(
  //             'Thakku Blogs- A Complete Blog App',
  //             style: TextStyle(color: Colors.black),
  //           ),
  //           elevation: 0,
  //           bottom: TabBar(
  //             tabs: tabs,
  //             isScrollable: true,
  //             labelColor: Colors.red,
  //             unselectedLabelColor: Colors.black,
  //             indicatorSize: TabBarIndicatorSize.label,
  //             indicatorColor: Colors.red,
  //           ),
  //           actions: <Widget>[
  //             Icon(Icons.search, color: Colors.black),
  //             SizedBox(width: 20),
  //             Icon(
  //               Icons.notifications,
  //               color: Colors.black,
  //             ),
  //             SizedBox(width: 20),
  //           ],
  //         ),
  //         body: Container(
  //           padding: EdgeInsets.only(left: 20, top: 20),
  //           child: TabBarView(
  //             children: tabs.map((Tab tab) {
  //               final String label = tab.text.toString();
  //               if (label == "Technology") {
  //                 return Center(
  //                   child: NewsCardWidget(),
  //                 );
  //               } else if (label == "Business") {
  //                 return Center(
  //                   child: Widget2(),
  //                 );
  //               } else if (label == "Entertainment") {
  //                 return Center(
  //                   child: Widget3(),
  //                 );
  //               } else if (label == "Sports") {
  //                 return Center(
  //                   child: Widget4(),
  //                 );
  //               } else {
  //                 return Center(
  //                   child: Widget5(),
  //                 );
  //               }
  //             }).toList(),
  //
  //             // children: tabs.map((Technology) => NewsCardWidget()).toList()
  //             //   .map((Business) => Widget2()).toList()
  //
  //             // NewsCardWidget()
  //           ),
  //         ),
  //       )));
  // }

  Widget tab(String tabName) {
    return Tab(text: tabName);
  }
}
