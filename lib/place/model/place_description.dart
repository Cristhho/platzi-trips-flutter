class PlaceDescription {
  String _name;
  double _stars;
  String _description;

  PlaceDescription(this._name, this._stars, this._description);

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get stars => _stars;

  set stars(double value) {
    _stars = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

}