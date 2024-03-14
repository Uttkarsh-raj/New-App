import 'package:flutter/material.dart';
import 'package:news/const/color.dart';

class CustomTextFieldContiner extends StatefulWidget {
  const CustomTextFieldContiner(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomTextFieldContiner> createState() =>
      _CustomTextFieldContinerState();
}

class _CustomTextFieldContinerState extends State<CustomTextFieldContiner> {
  bool show = false;
  void onClick() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.grey,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: (widget.hintText == "Password")
            ? (show)
                ? false
                : true
            : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: (widget.hintText == "Password")
              ? (!show)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye_outlined))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: const Icon(Icons.remove_red_eye))
              : null,
          contentPadding: const EdgeInsets.all(13),
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.grey,
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.white,
        ),
      ),
    );
  }
}
