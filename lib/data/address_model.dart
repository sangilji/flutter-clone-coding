/// message : null
/// results : [{"address1":"北海道","address2":"美唄市","address3":"上美唄町協和","kana1":"ﾎｯｶｲﾄﾞｳ","kana2":"ﾋﾞﾊﾞｲｼ","kana3":"ｶﾐﾋﾞﾊﾞｲﾁｮｳｷｮｳﾜ","prefcode":"1","zipcode":"0790177"},{"address1":"北海道","address2":"美唄市","address3":"上美唄町南","kana1":"ﾎｯｶｲﾄﾞｳ","kana2":"ﾋﾞﾊﾞｲｼ","kana3":"ｶﾐﾋﾞﾊﾞｲﾁｮｳﾐﾅﾐ","prefcode":"1","zipcode":"0790177"},{"address1":"北海道","address2":"美唄市","address3":"上美唄町","kana1":"ﾎｯｶｲﾄﾞｳ","kana2":"ﾋﾞﾊﾞｲｼ","kana3":"ｶﾐﾋﾞﾊﾞｲﾁｮｳ","prefcode":"1","zipcode":"0790177"}]
/// status : 200

class AddressModel {
  AddressModel({
      dynamic message,
      List<Results>? results,
      num? status,}){
    _message = message;
    _results = results;
    _status = status;
}

  AddressModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _status = json['status'];
  }
  dynamic _message;
  List<Results>? _results;
  num? _status;
AddressModel copyWith({  dynamic message,
  List<Results>? results,
  num? status,
}) => AddressModel(  message: message ?? _message,
  results: results ?? _results,
  status: status ?? _status,
);
  dynamic get message => _message;
  List<Results>? get results => _results;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// address1 : "北海道"
/// address2 : "美唄市"
/// address3 : "上美唄町協和"
/// kana1 : "ﾎｯｶｲﾄﾞｳ"
/// kana2 : "ﾋﾞﾊﾞｲｼ"
/// kana3 : "ｶﾐﾋﾞﾊﾞｲﾁｮｳｷｮｳﾜ"
/// prefcode : "1"
/// zipcode : "0790177"

class Results {
  Results({
      String? address1,
      String? address2,
      String? address3,
      String? kana1,
      String? kana2,
      String? kana3,
      String? prefcode,
      String? zipcode,}){
    _address1 = address1;
    _address2 = address2;
    _address3 = address3;
    _kana1 = kana1;
    _kana2 = kana2;
    _kana3 = kana3;
    _prefcode = prefcode;
    _zipcode = zipcode;
}

  Results.fromJson(dynamic json) {
    _address1 = json['address1'];
    _address2 = json['address2'];
    _address3 = json['address3'];
    _kana1 = json['kana1'];
    _kana2 = json['kana2'];
    _kana3 = json['kana3'];
    _prefcode = json['prefcode'];
    _zipcode = json['zipcode'];
  }
  String? _address1;
  String? _address2;
  String? _address3;
  String? _kana1;
  String? _kana2;
  String? _kana3;
  String? _prefcode;
  String? _zipcode;
Results copyWith({  String? address1,
  String? address2,
  String? address3,
  String? kana1,
  String? kana2,
  String? kana3,
  String? prefcode,
  String? zipcode,
}) => Results(  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  address3: address3 ?? _address3,
  kana1: kana1 ?? _kana1,
  kana2: kana2 ?? _kana2,
  kana3: kana3 ?? _kana3,
  prefcode: prefcode ?? _prefcode,
  zipcode: zipcode ?? _zipcode,
);
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get address3 => _address3;
  String? get kana1 => _kana1;
  String? get kana2 => _kana2;
  String? get kana3 => _kana3;
  String? get prefcode => _prefcode;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['address3'] = _address3;
    map['kana1'] = _kana1;
    map['kana2'] = _kana2;
    map['kana3'] = _kana3;
    map['prefcode'] = _prefcode;
    map['zipcode'] = _zipcode;
    return map;
  }

}