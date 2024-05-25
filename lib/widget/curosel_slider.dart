import 'package:dinnerdive/items/datamap.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../pages/description/description.dart';

class CustomImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const CustomImageCarousel({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        animateToClosest: true,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 0,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index, realIndex) {
        final dats = recipes[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Description(
                      datas: dats,
                      imageUrls: imageUrls[index],
                    ),
                  ));
            },
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(imageUrls[index]),
              ),
            ));
      },
    );
  }
}
