import 'package:flutter_movies/data/models/movies_response.dart';
import 'package:flutter_movies/data/models/pagintaion_filter.dart';
import 'package:flutter_movies/data/models/state_status.dart';
import 'package:flutter_movies/data/repository/api_repository.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController{

  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _movies = <Movies>[].obs;
  final _stateStatus = ''.obs;
  int get limit => _paginationFilter.value.limit?.toInt() ?? 0;
  int get _page => _paginationFilter.value.page?.toInt() ?? 0;
  bool get lastPage => _lastPage.value;
  List<Movies> get movies => _movies.toList();
  String get stateStatus => _stateStatus.value;

  @override
  onInit() {
    _stateStatus.value = StateStatus.Loading;
    ever(_paginationFilter, (_) => _getMovies());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _getMovies() async {
    try {
      MoviesResponse response = await ApiRepository().getMovies( _paginationFilter.value);
      List<Movies> _tempMovies = response.data?.movies ?? [];
      if (_tempMovies.isEmpty) {
        _lastPage.value = true;
      }
      _movies.addAll(_tempMovies);
      _stateStatus.value = StateStatus.Success;
    } catch (e) {
      print(e);
      _stateStatus.value = StateStatus.Error;
    }
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
}