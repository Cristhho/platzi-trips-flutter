import 'package:flutter/material.dart';

class ReviewDetail extends StatelessWidget {

  final String userName;
  final String details;
  final String comment;

  ReviewDetail(this.userName, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    final userName = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),
      child: Text(
        this.userName,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Lato'
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.details,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 12.0,
            fontFamily: 'Lato',
            color: Colors.black38
        ),
      ),
    );

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),
      child: Text(
        this.comment,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w800
        ),
      ),
    );
    
    final detail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment
      ],
    );

    return detail;
  }

}