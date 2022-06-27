import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rorty_flutter/app/utils/constants.dart';
import 'package:rorty_flutter/data/remote/dio/dio_factory.dart';
import 'package:rorty_flutter/data/remote/service/character/character_service.dart';
import 'package:rorty_flutter/data/remote/service/episode/episode_service.dart';
import 'package:rorty_flutter/data/remote/service/location/location_service.dart';
import 'package:rorty_flutter/data/repository/character_repository.dart';
import 'package:rorty_flutter/data/repository/episode_repository.dart';
import 'package:rorty_flutter/data/repository/location_repository.dart';
import 'package:rorty_flutter/domain/character/get_character_detail.dart';
import 'package:rorty_flutter/domain/character/get_characters.dart';
import 'package:rorty_flutter/domain/episode/get_episode_detail.dart';
import 'package:rorty_flutter/domain/episode/get_episodes.dart';
import 'package:rorty_flutter/domain/location/get_location_detail.dart';
import 'package:rorty_flutter/domain/location/get_locations.dart';
import 'package:rorty_flutter/presentation/characters/detail/character_detail_view_model.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(DioFactory(rBaseUrl).create());

  // Data - Remote
  injector.registerSingleton<CharacterService>(CharacterService(injector()));
  injector.registerSingleton<EpisodeService>(EpisodeService(injector()));
  injector.registerSingleton<LocationService>(LocationService(injector()));

  // Data - Local

  // Data - Repository
  injector.registerSingleton<CharacterRepository>(CharacterRepository(injector()));
  injector.registerSingleton<EpisodeRepository>(EpisodeRepository(injector()));
  injector.registerSingleton<LocationRepository>(LocationRepository(injector()));

  // Domain
  injector.registerSingleton<GetCharacters>(GetCharacters(injector()));
  injector.registerSingleton<GetCharacterDetail>(GetCharacterDetail(injector(), injector()));

  injector.registerSingleton<GetEpisodes>(GetEpisodes(injector()));
  injector.registerSingleton<GetEpisodeDetail>(GetEpisodeDetail(injector(), injector()));

  injector.registerSingleton<GetLocations>(GetLocations(injector()));
  injector.registerSingleton<GetLocationDetail>(GetLocationDetail(injector(), injector()));

  // ViewModel
  //injector.registerFactory(() => CharactersViewModel());
  injector.registerFactory(() => CharacterDetailViewModel());
}
