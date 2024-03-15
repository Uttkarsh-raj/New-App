import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/database/hive_database.dart';
import 'package:news/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:news/utils/app_functions.dart';

class NewsHandler {
  static Future<List<News>> getNews(BuildContext context) async {
    try {
      // var uri = Uri.parse(
      //   'https://news67.p.rapidapi.com/v2/trending',
      // );
      // var source = await http.get(
      //   uri,
      //   headers: <String, String>{
      //     'X-RapidAPI-Key':
      //         '5edaeb19ffmsh203a7d4273be688p144a71jsn617a61c00756',
      //     'X-RapidAPI-Host': 'news67.p.rapidapi.com'
      //   },
      // );
      var uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=2f68a2109d59445bbf20341c02a6e99d',
      );
      var source = await http.get(
        uri,
      );
      var data = jsonDecode(source.body);
      print(data);
      if (source.statusCode == 200) {
        // List<News> news = News.newsFromSnapshot(data['news']);
        List<News> news = News.newsFromSnapshot(data['articles']);
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
