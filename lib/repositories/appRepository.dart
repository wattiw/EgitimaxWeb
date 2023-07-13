import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/utils/constant/constants.dart';
import 'package:egitimax/utils/helper/api.dart';
import 'package:flutter/material.dart';

class AppRepository {

  Future<List<WeatherForecast>> getWeather() async {

    var jsonDecodeResult=await Api.request('WeatherForecast/Get',method: HttpMethod.get);
    List<WeatherForecast> forecasts = [];
    for (var jsonItem in jsonDecodeResult) {
      forecasts.add(WeatherForecast.fromJson(jsonItem));
    }
    return forecasts;
  }

}
extension AppRepositoryExtension on AppRepository {

}




