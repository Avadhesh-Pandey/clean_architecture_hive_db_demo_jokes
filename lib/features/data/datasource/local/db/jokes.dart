import 'package:hive/hive.dart';

part 'jokes.g.dart';

@HiveType(typeId: 1)
class Jokes extends HiveObject {
  @HiveField(0)
  String? joke;
  @HiveField(1)
  String? dateTime;

  Jokes({this.joke, this.dateTime});
}
