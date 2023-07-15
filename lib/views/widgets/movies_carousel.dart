import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../controllers/movies_home_controller.dart';

class MoviesCarousel extends StatelessWidget {
  const MoviesCarousel({
    super.key,
    required this.controller,
  });

  final MoviesHomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: controller.moviesData.map((movie) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/placholder.png",
            image: movie.posterPath!,
            fit: BoxFit.fill,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: double.infinity,
        autoPlay: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          controller.changeMovieIndex(index);
        },
      ),
    );
  }
}
