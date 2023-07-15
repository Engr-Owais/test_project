import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailHeader extends StatelessWidget {
  final String backdropPath;
  final String posterPhoto;
  final String title;
  final double rating;
  final String mediatype;
  final String? release;

  const MovieDetailHeader(
      {super.key,
      required this.backdropPath,
      required this.title,
      required this.posterPhoto,
      this.release,
      required this.rating,
      required this.mediatype});

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i <= rating ? Colors.amber : Colors.white;
      var star = Icon(
        Icons.star,
        size: 14,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var theme = Theme.of(context);

    var ratingCaptionStyle =
        textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15);

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRatingBar(theme),
        SizedBox(
          height: 8.0,
        ),
        Text(
          "2017 - $mediatype",
          style: ratingCaptionStyle,
        ),
        Text(
          "$release",
          style: ratingCaptionStyle,
        ),
      ],
    );

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge,
        ),
        SizedBox(height: 8.0),
        starRating,
        SizedBox(height: 12.0),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: BannerImage(backdropPath),
        ),
        Positioned(
          left: 0.0,
          top: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                  iconSize: 15,
                  color: Colors.white,
                ),
              ),
              radius: 14,
              backgroundColor: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                posterPhoto,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                  child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  movieInformation,
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}

class BannerImage extends StatelessWidget {
  BannerImage(this.imageUrl);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Image.network(
        imageUrl!,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(
    this.posterUrl, {
    this.height = 100.0,
  });

  final String? posterUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    var width = POSTER_RATIO * height;

    return Material(
      borderRadius: BorderRadius.circular(4.0),
      elevation: 2.0,
      child: Image.network(
        posterUrl!,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}

class Storyline extends StatelessWidget {
  Storyline(this.storyline);
  final String? storyline;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Story line',
          style: textTheme.titleMedium!
              .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.0),
        Text(
          storyline!,
          textAlign: TextAlign.justify,
          style: textTheme.bodyMedium!.copyWith(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class ActorScroller extends StatelessWidget {
  Widget _buildActor(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/user1.jpg'),
            radius: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("OWAIS"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 15.0),
          child: Text(
            'Directed By - Unknown ',
            style: textTheme.titleMedium!
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'The Cast',
            style: textTheme.titleMedium!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}
