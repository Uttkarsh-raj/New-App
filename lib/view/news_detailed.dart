import 'package:flutter/material.dart';
import 'package:news/const/color.dart';
import 'package:news/model/news.dart';
import 'package:news/utils/app_functions.dart';

class NewsDetailedPage extends StatelessWidget {
  const NewsDetailedPage({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
            child: Column(
          children: [
            if (news.image != null && news.image != "")
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(news.image!)),
              ),
            SizedBox(height: size.height * 0.04),
            Text(
              news.title ?? "",
              maxLines: 13,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 22,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              news.source ?? news.body ?? "",
              maxLines: 13,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            if (news.url != null && news.url != "")
              TextButton(
                onPressed: () {
                  AppFunctions.launchURL(news.url!);
                },
                child: const Text(
                  "Link to full article here 🔗",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
          ],
        )),
      ),
    );
  }
}
