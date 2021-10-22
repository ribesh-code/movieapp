import 'package:flutter/material.dart';
import '../../common/extension/size_extension.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://www.pinclipart.com/picdir/middle/4-48708_film-background-cliparts-movie-logo-without-background-png.png',
      color: Colors.white,
      height: height.h.toDouble(),
    );
  }
}
