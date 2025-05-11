import 'package:flutter/material.dart';

class MySeason extends StatelessWidget {
  final String url;
  final String text;
  const MySeason(this.url, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // to print text on image
      alignment: Alignment.bottomCenter, // make text at center on the image
      children: [
        Image.asset(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          url,
        ), //give size to image & (fit.cover) to fill this size
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ), //put color & size on text
      ],
    );
  }
}
