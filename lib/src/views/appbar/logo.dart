import 'package:flutter/material.dart';

class GiphyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const basePath = "assets/img/";
    final logoPath = Theme.of(context).brightness == Brightness.light
        ? "GIPHY_light.png"
        : "GIPHY_dark.png";
    return Center(
      child: Image.asset(
        "$basePath$logoPath",
        width: 100.0,
      ),
    );
  }
}
