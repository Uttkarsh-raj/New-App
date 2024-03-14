import 'package:flutter/material.dart';
import 'package:news/const/color.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  static Future<void> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static showSnackbar(String error, BuildContext context) {
    var snackbar = SnackBar(
      backgroundColor: AppColors.backgroundLight,
      content: Text(
        error,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
