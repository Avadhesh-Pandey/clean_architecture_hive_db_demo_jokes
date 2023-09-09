import 'dart:async';
import 'dart:convert';

import 'package:jokes/core/error/failure.dart';
import 'package:jokes/core/utils/extensions/date_time_ext.dart';
import 'package:jokes/features/data/datasource/remote/network/api_services.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';

abstract class JokesRemoteDataSource {
  Future<JokeEntity> getTheJoke();
}

class JokesRemoteDataSourceImpl implements JokesRemoteDataSource {
  final ApiServices apiServices;

  JokesRemoteDataSourceImpl({
    required this.apiServices,
  });

  @override
  Future<JokeEntity> getTheJoke() async {
    try {
      var response = await apiServices.getJokes();
      return JokeEntity(joke: response.data["joke"], dateTime: DateTime.now().format());
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
