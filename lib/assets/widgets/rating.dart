import 'package:flutter/cupertino.dart';

Widget buildRatingStars(double rating) {
  int filledStars = rating.round();
  int emptyStars = 5 - filledStars;
  return Row(
    children: [
      ...List.generate(filledStars, (index) => Row(
        children: [
          Image.asset(
            "lib/assets/images/consultation/rating.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 1),
        ],
      )),

      ...List.generate(emptyStars, (index) => Row(
        children: [
          Image.asset(
            "lib/assets/images/consultation/ratingOff.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          if (index != emptyStars - 1) const SizedBox(width: 4),
        ],
      )),
    ],
  );
}
