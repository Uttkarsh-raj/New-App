// import 'package:hive/hive.dart';
// import 'package:news/model/news.dart';

// class HiveDatabase {
//   final myDatabase = Hive.box("news_database");

//   void saveData(List<News> allNews) {
//     List<dynamic> storeNews = [];
//     for (var news in allNews) {
//       storeNews.add(news);
//     }
//     myDatabase.put("news", storeNews);
//   }

//   List<News> readData() {
//     List savedExpense = myDatabase.get("news") ?? [];
//     List<News> allStoredNews = [];
//     for (int i = 0; i < savedExpense.length; i++) {
//       allStoredNews.add(News.fromJson(savedExpense[i]));
//     }
//     print(allStoredNews);
//     return allStoredNews;
//   }
// }

import 'package:hive/hive.dart';
import 'package:news/model/news.dart';

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 0; // Unique identifier for the adapter

  @override
  News read(BinaryReader reader) {
    return News.fromJson(reader.readMap());
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer.writeMap(News.toJson(obj));
  }
}

class HiveDatabase {
  final myDatabase = Hive.box("news_database");

  void saveData(List<News> allNews) {
    myDatabase.put("news", allNews);
  }

  List<News> readData() {
    List<News> allStoredNews =
        myDatabase.get("news", defaultValue: [])?.cast<News>() ?? [];
    // print("News: ");
    // print(allStoredNews);
    return allStoredNews;
  }
}
