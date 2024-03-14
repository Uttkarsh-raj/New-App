import 'package:flutter/material.dart';
import 'package:news/const/color.dart';
import 'package:news/database/hive_database.dart';
import 'package:news/handler/firebase_handler.dart';
import 'package:news/handler/news_handler.dart';
import 'package:news/model/news.dart';
import 'package:news/provider/favorite_provider.dart';
import 'package:news/utils/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<News> news;
  bool isLoading = true;

  void getNews() async {
    setState(() {
      isLoading = true;
    });
    news = await NewsHandler.getNews(context);
    HiveDatabase()
        .saveData(news.sublist(0, (news.length > 7) ? 7 : news.length));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    Provider.of<FavProvider>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Provider.of<FavProvider>(context, listen: false).toggleGridView();
            setState(() {});
          },
          child: const Padding(
            padding: EdgeInsets.all(14.0),
            child: Icon(
              Icons.grid_on_rounded,
              size: 32,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseHandler.logOut();
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.logout,
                size: 26,
              ),
            ),
          ),
        ],
        title: const Text(
          "News App",
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonBlue,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Consumer<FavProvider>(
                builder: (context, favModel, child) => RefreshIndicator(
                  onRefresh: () async {
                    getNews();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: (favModel.isGridView == true)
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: news.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              // crossAxisCount: 2,
                              // mainAxisSpacing: size.height*0.001,
                              crossAxisCount: 2,
                              crossAxisSpacing: size.width * 0.02,
                              mainAxisSpacing: size.height * 0.009,
                              childAspectRatio: size.height * 0.0007,
                            ),
                            itemBuilder: (context, index) => NewsTile(
                              news: news[index],
                              onTap: () {
                                favModel.addToFav(news[index]);
                                setState(() {});
                              },
                              fav: favModel.isPresent(news[index]),
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewsTile(
                                news: news[index],
                                onTap: () {
                                  favModel.addToFav(news[index]);
                                  setState(() {});
                                },
                                fav: favModel.isPresent(news[index]),
                              ),
                            ),
                            itemCount: news.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                  ),
                ),
              ),
            ),
    );
  }
}
