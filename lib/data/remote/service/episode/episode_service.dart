import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rorty_flutter/data/model/remote/episode/EpisodeInfo.dart';
import 'package:rorty_flutter/data/model/remote/episode/EpisodeResponse.dart';

part 'episode_service.g.dart';

@RestApi()
abstract class EpisodeService {
  factory EpisodeService(Dio dio) = _EpisodeService;

  @GET("/episode")
  Future<HttpResponse<EpisodeResponse>> getEpisodes(
    @Query("page") int page,
    @Queries() Map<String, String>? options,
  );

  @GET("/episode/{id}")
  Future<HttpResponse<EpisodeInfo>> getEpisode(@Path("id") int id);
}
