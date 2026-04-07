import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:practice/data/address_model.dart';
import 'package:practice/data/address_point_model.dart' hide Location;
import 'package:practice/screens/start/address_service.dart';
import 'package:practice/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;
  AddressPointModel? _addressPointModel;
  bool isPoint = false;
  bool _isGettingLocation = false;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onFieldSubmitted: (text) async {
                _addressModel = null;
                _addressPointModel = null;
                _addressModel = await AddressService().searchAddressByStr(text);
                setState(() {
                  isPoint = false;
                });
              },
              controller: _addressController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: '郵便番号を書いてください。',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextButton.icon(
                onPressed: () async {
                  _addressModel = null;
                  _addressPointModel = null;
                  setState(() {
                    _isGettingLocation = true;
                    isPoint = true;
                  });
                  Location location = Location();

                  bool serviceEnabled;
                  PermissionStatus permissionGranted;
                  LocationData locationData;

                  serviceEnabled = await location.serviceEnabled();
                  if (!serviceEnabled) {
                    serviceEnabled = await location.requestService();
                    if (!serviceEnabled) {
                      return;
                    }
                  }

                  permissionGranted = await location.hasPermission();
                  if (permissionGranted == PermissionStatus.denied) {
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != PermissionStatus.granted) {
                      return;
                    }
                  }

                  locationData = await location.getLocation();
                  logger.d(locationData);
                  _addressPointModel = await AddressService()
                      .findAddressByCoordinate(
                        log: locationData.longitude!,
                        lat: locationData.latitude!,
                      );
                  logger.d(_addressPointModel?.response?.location);
                  setState(() {
                    _isGettingLocation = false;
                  });
                },
                icon: _isGettingLocation
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Icon(CupertinoIcons.compass, color: Colors.white),
                label: Text(
                  _isGettingLocation ? '検索中...' : '現在位置',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 12),
                itemCount: isPoint
                    ? _addressPointModel == null ||
                              _addressPointModel!.response == null ||
                              _addressPointModel!.response!.location == null
                          ? 0
                          : _addressPointModel!.response!.location!.length
                    : _addressModel == null || _addressModel!.results == null
                    ? 0
                    : _addressModel!.results!.length,
                itemBuilder: (context, index) {
                  String address;
                  if (isPoint) {
                    if (_addressPointModel == null ||
                        _addressPointModel!.response == null ||
                        _addressPointModel!.response!.location == null ||
                        _addressPointModel!.response!.location![index].town ==
                            null)
                      return Container();
                    address =
                        '${_addressPointModel!.response!.location![index].prefecture} ${_addressPointModel!.response!.location![index].city} ${_addressPointModel!.response!.location![index].town}';
                    return ListTile(
                      onTap: () {
                        _saveAddressOnSharedPreference(address);
                      },
                      title: Text(address),
                      subtitle: Text(
                        '${_addressPointModel!.response!.location![index].postal}',
                      ),
                    );
                  }
                  if (_addressModel == null ||
                      _addressModel!.results == null ||
                      _addressModel!.results![index].zipcode == null)
                    return Container();

                  address =
                      '${_addressModel!.results![index].address1} ${_addressModel!.results![index].address2} ${_addressModel!.results![index].address3}';
                  return ListTile(
                    onTap: () {
                      _saveAddressOnSharedPreference(address);
                    },
                    title: Text(address),
                    subtitle: Text('${_addressModel!.results![index].zipcode}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _saveAddressOnSharedPreference(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);

    context.read<PageController>().animateToPage(
      2,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeOut,
    );
  }
}
