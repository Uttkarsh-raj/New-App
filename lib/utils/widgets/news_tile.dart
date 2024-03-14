import 'package:flutter/material.dart';
import 'package:news/const/color.dart';
import 'package:news/model/news.dart';
import 'package:news/view/news_detailed.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key, required this.news, required this.onTap, required this.fav});
  final News news;
  final Function() onTap;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // AppFunctions.launchURL(news.url!);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDetailedPage(news: news),
          ),
        );
      },
      child: Container(
        height: size.height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: NetworkImage(news.image ?? ''),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: (fav)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  Text(
                    news.title ?? "",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.backgroundDark,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    news.body ?? "",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.backgroundDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
