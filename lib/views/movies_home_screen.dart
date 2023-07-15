import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movies_home_controller.dart';
import '../utils/constants.dart';
import 'widgets/movies_carousel.dart';
import 'widgets/movies_list.dart';

class MoviesHomeScreen extends GetView<MoviesHomeController> {
  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    final availableHeight = MediaQuery.of(context).size.height -
        appBarHeight -
        statusBarHeight -
        MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          title: Text("Watch"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: availableHeight,
              child: Obx(
                () {
                  if (controller.hasError.value) {
                    return Center(
                      child: Text('Failed to fetch movies'),
                    );
                  } else if (controller.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: MoviesCarousel(
                              controller: controller,
                            )),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "Watch Movies",
                              style: kBoldTitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: MoviesList(
                            controller: controller,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
        ),
    );
  }
}
