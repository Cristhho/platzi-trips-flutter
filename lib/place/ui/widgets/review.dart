import 'package:flutter/material.dart';
import 'review_detail.dart';
import 'package:platzi_trips/place/model/user_review.dart';

class Review extends StatelessWidget {

  final UserReview review;

  Review(this.review);

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(this.review.userPhoto)
          )
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        Flexible(
          child: new ReviewDetail(this.review.userName,
            this.review.userInfo, this.review.userComment
          )
        ),
      ],
    );
  }

}