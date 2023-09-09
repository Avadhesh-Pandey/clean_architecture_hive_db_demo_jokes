import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jokes/core/constants/color_constants.dart';
import 'package:jokes/core/utils/extensions/date_time_ext.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:google_fonts/google_fonts.dart';


class JokeListItemWidget extends StatelessWidget {
  final JokeEntity joke;

  const JokeListItemWidget(this.joke, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColour,
      margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 8.h),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.joke,
              style: TextStyle(fontSize: 16.sp, color: Colors.black87,),
            ),
            const SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateTime.parse(joke.dateTime).format("h:mm a"),
                style: TextStyle(fontSize: 10.sp, color: Colors.black54,letterSpacing: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
