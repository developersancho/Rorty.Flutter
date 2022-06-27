import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rorty_flutter/data/model/remote/character/CharacterInfo.dart';
import 'package:rorty_flutter/data/model/remote/character/CharacterResponse.dart';

part 'character_service.g.dart';

@RestApi()
abstract class CharacterService {
  factory CharacterService(Dio dio) = _CharacterService;

  @GET("/character")
  Future<HttpResponse<CharacterResponse>> getCharacters(
    @Query("page") int page,
    @Queries() Map<String, String>? options,
  );

  @GET("/character/{id}")
  Future<HttpResponse<CharacterInfo>> getCharacter(@Path("id") int id);
}
