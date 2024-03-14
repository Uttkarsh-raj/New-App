import 'package:flutter/material.dart';
import 'package:news/const/color.dart';

class CustomOutlinedContainer extends StatelessWidget {
  const CustomOutlinedContainer(
      {super.key,
      required this.padding,
      required this.label,
      required this.fontsize});
  final EdgeInsets padding;
  final String label;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.cyan,
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
