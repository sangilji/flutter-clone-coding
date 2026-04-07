/// response : {"location":[{"city":"品川区","city_kana":"しながわく","town":"西五反田","town_kana":"にしごたんだ","x":"139.718006","y":"35.624449","distance":122.574882994784,"prefecture":"東京都","postal":"1410031"},{"city":"品川区","city_kana":"しながわく","town":"東五反田","town_kana":"ひがしごたんだ","x":"139.726953","y":"35.627809","distance":794.125772011164,"prefecture":"東京都","postal":"1410022"},{"city":"品川区","city_kana":"しながわく","town":"上大崎","town_kana":"かみおおさき","x":"139.718425","y":"35.63321","distance":869.965876080914,"prefecture":"東京都","postal":"1410021"},{"city":"品川区","city_kana":"しながわく","town":"大崎","town_kana":"おおさき","x":"139.725912","y":"35.619618","distance":916.905532226988,"prefecture":"東京都","postal":"1410032"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ１３階","town_kana":"おおさきしんくぱーくたわー13かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416013"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ地階","town_kana":"おおさきしんくぱーくたわーちかい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416090"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ１階","town_kana":"おおさきしんくぱーくたわー1かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416001"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ２階","town_kana":"おおさきしんくぱーくたわー2かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416002"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ３階","town_kana":"おおさきしんくぱーくたわー3かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416003"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ４階","town_kana":"おおさきしんくぱーくたわー4かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416004"}]}

class AddressPointModel {
  AddressPointModel({
      Response? response,}){
    _response = response;
}

  AddressPointModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
AddressPointModel copyWith({  Response? response,
}) => AddressPointModel(  response: response ?? _response,
);
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// location : [{"city":"品川区","city_kana":"しながわく","town":"西五反田","town_kana":"にしごたんだ","x":"139.718006","y":"35.624449","distance":122.574882994784,"prefecture":"東京都","postal":"1410031"},{"city":"品川区","city_kana":"しながわく","town":"東五反田","town_kana":"ひがしごたんだ","x":"139.726953","y":"35.627809","distance":794.125772011164,"prefecture":"東京都","postal":"1410022"},{"city":"品川区","city_kana":"しながわく","town":"上大崎","town_kana":"かみおおさき","x":"139.718425","y":"35.63321","distance":869.965876080914,"prefecture":"東京都","postal":"1410021"},{"city":"品川区","city_kana":"しながわく","town":"大崎","town_kana":"おおさき","x":"139.725912","y":"35.619618","distance":916.905532226988,"prefecture":"東京都","postal":"1410032"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ１３階","town_kana":"おおさきしんくぱーくたわー13かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416013"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ地階","town_kana":"おおさきしんくぱーくたわーちかい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416090"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ１階","town_kana":"おおさきしんくぱーくたわー1かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416001"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ２階","town_kana":"おおさきしんくぱーくたわー2かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416002"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ３階","town_kana":"おおさきしんくぱーくたわー3かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416003"},{"city":"品川区","city_kana":"しながわく","town":"大崎ＴｈｉｎｋＰａｒｋＴｏｗｅｒ４階","town_kana":"おおさきしんくぱーくたわー4かい","x":"139.7276249","y":"35.618461","distance":1117.84652409654,"prefecture":"東京都","postal":"1416004"}]

class Response {
  Response({
      List<Location>? location,}){
    _location = location;
}

  Response.fromJson(dynamic json) {
    if (json['location'] != null) {
      _location = [];
      json['location'].forEach((v) {
        _location?.add(Location.fromJson(v));
      });
    }
  }
  List<Location>? _location;
Response copyWith({  List<Location>? location,
}) => Response(  location: location ?? _location,
);
  List<Location>? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// city : "品川区"
/// city_kana : "しながわく"
/// town : "西五反田"
/// town_kana : "にしごたんだ"
/// x : "139.718006"
/// y : "35.624449"
/// distance : 122.574882994784
/// prefecture : "東京都"
/// postal : "1410031"

class Location {
  Location({
      String? city, 
      String? cityKana, 
      String? town, 
      String? townKana, 
      String? x, 
      String? y, 
      num? distance, 
      String? prefecture, 
      String? postal,}){
    _city = city;
    _cityKana = cityKana;
    _town = town;
    _townKana = townKana;
    _x = x;
    _y = y;
    _distance = distance;
    _prefecture = prefecture;
    _postal = postal;
}

  Location.fromJson(dynamic json) {
    _city = json['city'];
    _cityKana = json['city_kana'];
    _town = json['town'];
    _townKana = json['town_kana'];
    _x = json['x'];
    _y = json['y'];
    _distance = json['distance'];
    _prefecture = json['prefecture'];
    _postal = json['postal'];
  }
  String? _city;
  String? _cityKana;
  String? _town;
  String? _townKana;
  String? _x;
  String? _y;
  num? _distance;
  String? _prefecture;
  String? _postal;
Location copyWith({  String? city,
  String? cityKana,
  String? town,
  String? townKana,
  String? x,
  String? y,
  num? distance,
  String? prefecture,
  String? postal,
}) => Location(  city: city ?? _city,
  cityKana: cityKana ?? _cityKana,
  town: town ?? _town,
  townKana: townKana ?? _townKana,
  x: x ?? _x,
  y: y ?? _y,
  distance: distance ?? _distance,
  prefecture: prefecture ?? _prefecture,
  postal: postal ?? _postal,
);
  String? get city => _city;
  String? get cityKana => _cityKana;
  String? get town => _town;
  String? get townKana => _townKana;
  String? get x => _x;
  String? get y => _y;
  num? get distance => _distance;
  String? get prefecture => _prefecture;
  String? get postal => _postal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['city_kana'] = _cityKana;
    map['town'] = _town;
    map['town_kana'] = _townKana;
    map['x'] = _x;
    map['y'] = _y;
    map['distance'] = _distance;
    map['prefecture'] = _prefecture;
    map['postal'] = _postal;
    return map;
  }

}