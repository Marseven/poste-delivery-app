import 'dart:convert';

import 'package:mighty_delivery/main/models/CountryListModel.dart';

import '../../main/models/PlaceAddressModel.dart';
import '../../main/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_webservice/places.dart';

class GoogleMapScreen extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  final bool isPick;

  GoogleMapScreen({this.isPick = true});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  PickResult? selectedPlace;
  bool showPlacePickerInContainer = false;
  bool showGoogleMapInContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isPick ? language.selectPickupLocation : language.selectDeliveryLocation),
      ),
      body: Column(
        children: [
          Expanded(
            child: PlacePicker(
              apiKey: googleMapAPIKey,
              hintText: language.searchAddress,
              searchingText: language.pleaseWait,
              selectText: widget.isPick ? language.confirmPickupLocation : language.confirmDeliveryLocation,
              autocompleteComponents: [Component(Component.country,CountryModel.fromJson(getJSONAsync(COUNTRY_DATA)).code.validate(value: 'IN'))],
              outsideOfPickAreaText: language.addressNotInArea,
              initialPosition: GoogleMapScreen.kInitialPosition,
              useCurrentLocation: true,
              selectInitialPosition: true,
              usePinPointingSearch: true,
              usePlaceDetailSearch: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              automaticallyImplyAppBarLeading: false,
              autocompleteLanguage: appStore.selectedLanguage,
              onMapCreated: (GoogleMapController controller) {
                //
              },
              onPlacePicked: (PickResult result) {
                setState(() {
                  selectedPlace = result;
                  PlaceAddressModel selectedModel = PlaceAddressModel(
                    placeId: selectedPlace!.placeId!,
                    latitude: selectedPlace!.geometry!.location.lat,
                    longitude: selectedPlace!.geometry!.location.lng,
                    placeAddress: selectedPlace!.formattedAddress,
                  );
                  List<PlaceAddressModel> list = (getStringListAsync(RECENT_ADDRESS_LIST) ?? []).map((e) => PlaceAddressModel.fromJson(jsonDecode(e))).toList();
                  bool isExist = list.any((element) => element.placeId == selectedPlace!.placeId);
                  if (!isExist) {
                    list.add(selectedModel);
                    setValue(RECENT_ADDRESS_LIST, list.map((element) => jsonEncode(element)).toList());
                  }
                  finish(context, selectedModel);
                });
              },
              onMapTypeChanged: (MapType mapType) {
                //
              },
            ),
          ),
          Container(
            color: Colors.red.shade50,
            padding: EdgeInsets.all(8),
            child: Text('NOTE: Drag-drop address place search is disable for demo user',style: secondaryTextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
