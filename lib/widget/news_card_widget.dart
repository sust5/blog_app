import 'dart:convert';

import 'package:blog_app/podo/postListPodo.dart';
import 'package:blog_app/webservices/apiCall.dart';
import 'package:flutter/material.dart';
class NewsCardWidget extends StatelessWidget {

  const NewsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPostData(),
        builder: (context, AsyncSnapshot  snapshot) {
          if (snapshot.data != null) {
           return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(snapshot.data[index].title.rendered),
                subtitle:Text(snapshot.data[index].excerpt.rendered) ,
                contentPadding: EdgeInsets.only(bottom: 20.0),
              ),
            );

          } else {
            return Text("loading data...");
          }
        });
  }
}