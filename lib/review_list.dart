import 'package:flutter/material.dart';
import 'widgets/review.dart';
import 'models/user_review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Review(
          new UserReview('Crishtian', '1 review 8 photos',
              'assets/img/people.jpg',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Maecenas commodo.')
        ),
        new Review(
            new UserReview('Robert', '3 review 22 photos',
                'assets/img/people.jpg',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Maecenas commodo.')
        ),
        new Review(
            new UserReview('Lizz', '1 review 2 photos',
                'assets/img/people.jpg',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Maecenas sagittis.')
        )
      ],
    );
  }

}