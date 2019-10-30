
class RouteDraw {
  int _id;
  double _latitude;
  double _longitude;
  int _indexPos;
  int _idLine;

  RouteDraw(this._id, this._latitude, this._longitude, this._indexPos,
      this._idLine);

  RouteDraw.fromJson(Map json)
      : _id = json['id'],
      _latitude = json['latitude'],
      _longitude = json['longitude'],
      _indexPos = json['indexPos'],
      _idLine = json['idLine'];

  Map toJson(){
    return {'id' : _id,
      'latitude' : _latitude,
      'longitude' : _longitude,
      'indexPos' : _indexPos,
      'idLine' : _idLine};
  }

  int get idLine => _idLine;

  set idLine(int value) {
    _idLine = value;
  }

  int get indexPos => _indexPos;

  set indexPos(int value) {
    _indexPos = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}