import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:practice/data/address_point_model.dart';
import 'package:practice/data/address_model.dart';
import 'package:practice/utils/logger.dart';

class AddressService {
  Future<AddressModel> searchAddressByStr(String text) async {
    final formData = {
      'zipcode': text,
      'callback': '',
      'limit': '20',
    };

    final response = await Dio()
        .get(
          'https://zipcloud.ibsnet.co.jp/api/search',
          queryParameters: formData,
        )
        .catchError((e) {
          logger.e(e);
        });
    logger.d(response);

    AddressModel addressModel = AddressModel.fromJson(
      response.data is String ? jsonDecode(response.data) : response.data,
    );
    return addressModel;
  }

  Future<AddressPointModel> findAddressByCoordinate({required double log, required double lat}) async{
    final formData = {
      'method': 'searchByGeoLocation',
      'x': log,
      'y': lat,
    };

    final response = await Dio()
        .get(
      'https://geoapi.heartrails.com/api/json',
      queryParameters: formData,
    )
        .catchError((e) {
      logger.e(e);
    });
    logger.d(response);

    AddressPointModel addressLocationModel = AddressPointModel.fromJson(
      response.data is String ? jsonDecode(response.data) : response.data,
    );
    return addressLocationModel;
  }
}
