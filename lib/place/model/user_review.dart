class UserReview {
  String _userName;
  String _userInfo;
  String _userPhoto;
  String _userComment;

  UserReview(this._userName, this._userInfo, this._userPhoto, this._userComment);

  String get userComment => _userComment;

  set userComment(String value) {
    _userComment = value;
  }

  String get userPhoto => _userPhoto;

  set userPhoto(String value) {
    _userPhoto = value;
  }

  String get userInfo => _userInfo;

  set userInfo(String value) {
    _userInfo = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}