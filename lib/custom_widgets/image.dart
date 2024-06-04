import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    //var hold the image
    AssetImage myImage = AssetImage('images/bulb1.png');
    Image image = Image(
      image: myImage,
      fit: BoxFit.fill,
    );
    return Container(
      padding: const EdgeInsets.all(25),
      child: image,
    );
  }
}
