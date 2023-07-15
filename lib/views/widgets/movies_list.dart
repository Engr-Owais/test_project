import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movies_home_controller.dart';
import '../movies_details_page.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.controller,
  });

  final MoviesHomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.moviesData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.to(MovieDetailsScreen(
                backdropPath: controller.moviesData[index].backdropPath!,
                posterPhoto: controller.moviesData[index].posterPath!,
                overview: controller.moviesData[index].overview!,
                rating: 8.0,
                release: controller.moviesData[index].releaseDate!,
                mediaType: controller.moviesData[index].mediaType!,
                title: controller.moviesData[index].originalTitle != null
                    ? controller.moviesData[index].originalTitle!
                    : "No Title",
              ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "${controller.moviesData[index].posterPath}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: 120,
                  child: Text(
                    controller.moviesData[index].title != null
                        ? controller.moviesData[index].title!
                        : "No Title",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 120,
                  child: Text(
                      controller.moviesData[index].mediaType != null
                          ? controller.moviesData[index].mediaType!
                          : "None",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
