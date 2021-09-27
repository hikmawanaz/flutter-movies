import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/controller/movies_controller.dart';
import 'package:flutter_movies/data/models/state_status.dart';
import 'package:flutter_movies/utils/config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  _buildGenres(List<String> genres) {
    String _tempGenres = "";
    if (genres.isNotEmpty) {
      for (int i = 0; i < genres.length; i++) {
        if (i == genres.length - 1) {
          _tempGenres = _tempGenres + genres[i];
        } else {
          _tempGenres = _tempGenres + genres[i] + " | ";
        }
      }
    }
    return Text(_tempGenres, style: TextStyle(color: Colors.blue),);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
        init: MoviesController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade200,
              title: Text("Movie Turbo", style: TextStyle(color: Colors.blue)),
            ),
            body: Obx(() {
              switch (controller.stateStatus) {
                case StateStatus.Success:
                  return controller.movies.isNotEmpty
                      ? LazyLoadScrollView(
                          onEndOfPage: controller.loadNextPage,
                          isLoading: controller.lastPage,
                          child: ListView.builder(
                            itemCount: controller.movies.length,
                            itemBuilder: (context, index) {
                              final _movie = controller.movies[index];
                              return Card(
                                margin: const EdgeInsets.fromLTRB(16, 10, 16, 6),
                                child: Container(
                                  height: 140,
                                  width: 100,
                                  child: Row(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                          imageUrl: _movie.largeCoverImage ??
                                              Config.imagePlaceholder,
                                          height: 140,
                                          width: 100,
                                          fit: BoxFit.fill,
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  "assets/bg_images.jpeg")),
                                      SizedBox(width: 10),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                _movie.title ?? "-",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500),
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              SizedBox(height: 10),
                                              RatingBarIndicator(
                                                rating: double.parse(
                                                    _movie.rating?.toString() ??
                                                        "0.0"),
                                                itemBuilder: (_, __) {
                                                  return Icon(
                                                    Icons.star,
                                                    color: Colors.amberAccent,
                                                  );
                                                },
                                                itemSize: 30,
                                              ),
                                              SizedBox(height: 10),
                                              _buildGenres(_movie.genres ?? [])
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // color: Colors.white,
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text("Oops not found"),
                        );
                case StateStatus.Loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case StateStatus.Error:
                  return Center(
                    child: Text("Oops error occured"),
                  );
                default:
                  return Center(
                    child: Text("Oops error occured"),
                  );
              }
            }),
          );
        });
  }
}
