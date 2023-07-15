import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app/models/movies.dart';

import '../utils/constants.dart';

class MoviesHomeController extends GetxController {
  var moviesData = <Movies>[].obs;
  var hasError = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAutoCarousel();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('${kThemoviedbURL}api_key=${kApiKey}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData['results'];

        print(results[0]);

        final List<Movies> fetchedMovies = results
            .map(
              (item) => Movies(
                id: item['id'],
                overview: item['overview'],
                voteAverage: item['vote_average'],
                originalTitle: item['original_title'],
                releaseDate: item['release_date'],
                backdropPath: "${kThemoviedbImageURL}${item['backdrop_path']}",
                title: item['title'],
                mediaType: item['media_type'],
                posterPath: "${kThemoviedbImageURL}${item['poster_path']}",
              ),
            )
            .toList();

        moviesData.assignAll(fetchedMovies);
        print(moviesData.first);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      hasError.value = true;
      isLoading.value = false;
    }
  }

  final _currentMovieIndex = 0.obs;

  int get currentMovieIndex => _currentMovieIndex.value;

  void changeMovieIndex(int index) {
    _currentMovieIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
    stopAutoCarousel();
  }

  void startAutoCarousel() {
    Future.delayed(Duration(seconds: 10)).then((value) {
      if (_currentMovieIndex.value + 1 >= moviesData.length) {
        _currentMovieIndex.value = 0;
      } else {
        _currentMovieIndex.value++;
      }
      startAutoCarousel();
    });
  }

  void stopAutoCarousel() {
    // No action needed in this case
  }
}
