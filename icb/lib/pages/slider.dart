import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';

class Custom_Slider extends StatefulWidget {
  const Custom_Slider({Key? key}) : super(key: key);

  @override
  State<Custom_Slider> createState() => _Custom_SliderState();
}

class _Custom_SliderState extends State<Custom_Slider> {
  final _imagePaths = [
    'images/mudi_islamic_item.jpg',
    'images/soaking_shoes_islamic_item.jpg',
    'images/soaking_shoes_islamic_item2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Custom_CarouselSlider(imagePaths: _imagePaths),
      ),
    );
  }
}

class Custom_CarouselSlider extends StatelessWidget {
  const Custom_CarouselSlider({
    Key? key,
    required List<String> imagePaths,
  })  : _imagePaths = imagePaths,
        super(key: key);

  final List<String> _imagePaths;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(autoPlay: true),
        items: _imagePaths.map((imagePath) {
          return Builder(builder: (context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ));
          });
        }).toList());
  }
}
