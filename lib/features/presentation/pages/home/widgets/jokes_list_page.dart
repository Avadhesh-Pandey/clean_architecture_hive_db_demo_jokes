import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jokes/core/constants/color_constants.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:jokes/features/presentation/pages/home/widgets/joke_list_item_widget.dart';

class JokesListPage extends StatelessWidget {
  final List<JokeEntity> jokesList;

  const JokesListPage(this.jokesList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (jokesList.isEmpty) {
      return Center(
        child: SizedBox(
          width: 24.r,
          height: 24.r,
          child: const CircularProgressIndicator(
            backgroundColor: kTextBackgroundGrey,
          ),
        ),
      );
    } else {
      return ListView.builder(
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
          itemBuilder: (context, index) {
            return JokeListItemWidget(jokesList[index]);
          },
          itemCount: jokesList.length);
    }
  }
}
