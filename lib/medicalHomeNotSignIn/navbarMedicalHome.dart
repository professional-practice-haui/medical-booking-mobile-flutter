import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class NavbarMedicalHome extends StatefulWidget {
  final double imageWidth;
  final double imageHeight;

  const NavbarMedicalHome({Key? key, required this.imageWidth, required this.imageHeight})
      : super(key: key);

  @override
  State<NavbarMedicalHome> createState() => _NavbarMedicalHomeState();
}

class _NavbarMedicalHomeState extends State<NavbarMedicalHome> {
  final List<String> listImagesOfLogo = [
    "assets/images/logo1.png",
    "assets/images/logo2.png",
    "assets/images/logo3.png",
    "assets/images/logo4.png"
  ];
  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: CarouselSlider.builder(
        itemCount: listImagesOfLogo.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              listImagesOfLogo[index],
              fit: BoxFit.cover,
              width:widget.imageWidth,
              height: widget.imageHeight,
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2.0,
        ),
      ),
    );
  }
}
