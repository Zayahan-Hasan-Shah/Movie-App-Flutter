import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/core/network/dio_client.dart';
import 'package:movie_app_flutter/data/auth/repositories/auth.dart';
import 'package:movie_app_flutter/data/auth/sources/auth_api_service.dart';
import 'package:movie_app_flutter/data/movie/repositories/movie.dart';
import 'package:movie_app_flutter/data/movie/sources/movie.dart';
import 'package:movie_app_flutter/data/tv/repositories/tv.dart';
import 'package:movie_app_flutter/data/tv/sources/tv.dart';
import 'package:movie_app_flutter/domain/auth/repositories/auth.dart';
import 'package:movie_app_flutter/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app_flutter/domain/auth/usecases/signin.dart';
import 'package:movie_app_flutter/domain/auth/usecases/signup.dart';
import 'package:movie_app_flutter/domain/movie/repositories/movie.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_flutter/domain/movie/usecases/search_movie.dart';
import 'package:movie_app_flutter/domain/tv/repositories/tv.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_similar_tv.dart';
import 'package:movie_app_flutter/domain/tv/usecases/search_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVServices>(TVApiSeriesImpl());
  // Respositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());
  // Usecase
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetRecommendationTVsUseCase>(GetRecommendationTVsUseCase());
  sl.registerSingleton<GetSimilarTVsUseCase>(GetSimilarTVsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
  sl.registerSingleton<SearchMoviesUseCase>(SearchMoviesUseCase());
  sl.registerSingleton<SearchTVsUseCase>(SearchTVsUseCase());
}
