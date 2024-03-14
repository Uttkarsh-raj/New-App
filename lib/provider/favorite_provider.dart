import 'package:flutter/material.dart';
import 'package:news/handler/firebase_handler.dart';
import 'package:news/model/news.dart';

class FavProvider extends ChangeNotifier {
  List<News> favs = [];
  bool isGridView = false;
  void addToFav(News news) async {
    favs.add(news);
    await FirebaseHandler.storeData(news);
  }

  void toggleGridView() {
    isGridView = !isGridView;
  }

  void initialize() async {
    favs = await FirebaseHandler.getData();
  }

  bool isPresent(News news) {
    if (favs.contains(news)) return true;
    return false;
  }
}
