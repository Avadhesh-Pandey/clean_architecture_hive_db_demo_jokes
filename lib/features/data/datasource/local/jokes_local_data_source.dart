import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';

import 'db/jokes.dart';

abstract class JokesLocalDataSource {
  Future<List<JokeEntity>> getCachedJokes();

  Future<bool> saveTheJoke(JokeEntity jokeEntity);
}

class JokesLocalDataSourceImpl implements JokesLocalDataSource {
  final HiveInterface hive;

  JokesLocalDataSourceImpl({
    required this.hive,
  });

  @override
  Future<List<JokeEntity>> getCachedJokes() async {
    if (!hive.isBoxOpen('jokes')) {
      await hive.openBox('jokes');
    }
    final hiveBox = hive.box('jokes');
    List<JokeEntity> jokesList = [];
    if (hiveBox.isNotEmpty) {
      for (int i = 0; i < hiveBox.length; i++) {
        final n = hiveBox.getAt(i) as Jokes;
        jokesList.add(JokeEntity(joke: n.joke ?? "", dateTime: n.dateTime ?? ""));
      }
    }

    return jokesList;
  }

  @override
  Future<bool> saveTheJoke(JokeEntity jokeEntity) async {
    if (!hive.isBoxOpen('jokes')) {
      await hive.openBox('jokes');
    }
    final hiveBox = hive.box('jokes');
    if(hiveBox.length>9)
      {
        debugPrint("deleting 0th index from DB");
        await hiveBox.deleteAt(0);
      }
    Jokes j=Jokes(joke: jokeEntity.joke,dateTime: jokeEntity.dateTime);
    hiveBox.add(j);
    return true;
  }
}
