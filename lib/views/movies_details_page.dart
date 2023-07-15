import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/movies_detail_controller.dart';
import 'widgets/movies_detail_header.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  final String? backdropPath;
  final String? overview;
  final String? posterPhoto;
  final String? title;
  final String? mediaType;
  final double? rating;
  final String? release;

  const MovieDetailsScreen(
      {super.key,
      this.backdropPath,
      this.release,
      this.mediaType,
      this.overview,
      this.title,
      this.posterPhoto,
      this.rating});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MovieDetailHeader(
                backdropPath: backdropPath!,
                posterPhoto: posterPhoto!,
                rating: rating!,
                mediatype: mediaType!,
                title: title!,
                release: release!,
              ),
              SizedBox(height: 20.0),
              ActorScroller(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Storyline(overview!),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
