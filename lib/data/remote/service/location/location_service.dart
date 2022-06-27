import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rorty_flutter/data/model/remote/location/LocationInfo.dart';
import 'package:rorty_flutter/data/model/remote/location/LocationResponse.dart';

part 'location_service.g.dart';

@RestApi()
abstract class LocationService {
  factory LocationService(Dio dio) = _LocationService;

  @GET("/location")
  Future<HttpResponse<LocationResponse>> getLocations(
    @Query("page") int page,
    @Queries() Map<String, String>? options,
  );

  @GET("/location/{id}")
  Future<HttpResponse<LocationInfo>> getLocation(@Path("id") int id);
}
