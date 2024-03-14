import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/database/hive_database.dart';
import 'package:news/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:news/utils/app_functions.dart';

class NewsHandler {
  static Future<List<News>> getNews(BuildContext context) async {
    try {
      var uri = Uri.parse(
        'https://news67.p.rapidapi.com/v2/trending',
      );
      var source = await http.get(
        uri,
        headers: <String, String>{
          'X-RapidAPI-Key':
              '52da2f9918msha1289bc9587d0e9p14bd67jsn15aa621a8d85',
          'X-RapidAPI-Host': 'news67.p.rapidapi.com'
        },
      );
      // var uri = Uri.parse(
      //   'https://newsnow.p.rapidapi.com/',
      // );
      // var source = await http.post(
      //   uri,
      //   headers: <String, String>{
      //     'content-type': 'application/json',
      //     'X-RapidAPI-Key':
      //         '52da2f9918msha1289bc9587d0e9p14bd67jsn15aa621a8d85', // add to the .env file but here for demo pourpose
      //     'X-RapidAPI-Host': 'newsnow.p.rapidapi.com'
      //   },
      //   body: jsonEncode({
      //     "text": 'Top news',
      //     "region": 'wt-wt',
      //     "max_results": 25,
      //   }),
      // );
      var data = jsonDecode(source.body);
      if (source.statusCode == 200) {
        // List<News> news = News.newsFromSnapshot(data['news']);
        List<News> news = News.newsFromSnapshot(data['news'][0]["News"]);
        // print(news);
        return news;
      } else if (source.statusCode >= 500) {
        return HiveDatabase().readData();
      }
      return [];
    } catch (e) {
      AppFunctions.showSnackbar(e.toString(), context);
      return HiveDatabase().readData();
    }
  }
}
