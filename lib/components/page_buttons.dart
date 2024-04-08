import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final String imagePath;
  final String pageTitle;
  final Function()? onTap;

  const PageButton(
      {super.key,
      required this.imagePath,
      required this.pageTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 120,
        // height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.0,
              blurRadius: 5,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                pageTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
