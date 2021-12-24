import 'dart:convert';
import 'package:blog_app/podo/catListPodo.dart';
import 'package:blog_app/podo/postListPodo.dart';
import 'package:blog_app/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<List<PostList>> getPostData() async {
  List<PostList> list = [];
  var res = await http.get(Uri.parse(baseUrl + postLink),
      headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    list = data.map<PostList>((json) => PostList.fromJson(json)).toList();
  }
  // print("List Size: ${list.toString()}");
  return list;
}

Future<List<String>> getCatList() async {
  List<CatListPodo> list = [];
  List<String> titles=[];
  var res = await http.get(Uri.parse(baseUrl + catLink),
      headers: {"Accept": "application/json"});
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    list = data.map<CatListPodo>((json) => CatListPodo.fromJson(json)).toList();
  }
  for(var item in list){
    titles.add(item.name);
  }
  // for(var title in titles){
  //   print("category: $title");
  // }
  return titles;
}
