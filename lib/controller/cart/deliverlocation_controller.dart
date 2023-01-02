import 'dart:async';

import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/routes.dart';

abstract class DeliverLocationController extends GetxController {
  goToCheckout();
}

class DeliverLocationControllerImp extends DeliverLocationController {
  // Completer<GoogleMapController> controllerMap = Completer();
  late GoogleMapController gmc;
  late CameraPosition kGooglePlex;
  StatusRequest statusRequest = StatusRequest.none;

  late Position cl;
  var lat;
  var long;
  late List items;
  late int totalPrice;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyDuxc7sfi24vA7alWKaN-CMoop1tDwyrMs";

  late StreamSubscription<Position> positionSteam;
  Set<Marker> myMarker = {};
  googleMapController(GoogleMapController controllerMap) {
    gmc = controllerMap;
  }

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

  // getPolyline() async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       googleAPiKey,
  //       PointLatLng(_originLatitude, _originLongitude),
  //       PointLatLng(_destLatitude, _destLongitude),
  //       travelMode: TravelMode.driving,
  //       wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }
  //   addPolyLine();
  // }

  void changeMarkerLocation(lat, lng) async {
    myMarker.clear();
    // myMarker.remove(const Marker(markerId: MarkerId('1')));
    myMarker
        .add(Marker(markerId: const MarkerId('1'), position: LatLng(lat, lng)));
    print(lat);
    print(lng);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lat', lat.toString());
    preferences.setString('long', lng.toString());

    update();
  }

  Future getPermeation() async {
    bool service;
    LocationPermission per;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false) {
      Get.defaultDialog(
        title: "Service",
        content: const Text("Service not enabled"),
      );
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
    if (per == LocationPermission.whileInUse ||
        per == LocationPermission.always) {
      getLatAndLong();
    }
    print("==========================");
    print(per);
    print("==========================");
    return per;
  }

  Future<void> getLatAndLong() async {
    myMarker.clear();

    statusRequest = StatusRequest.loading;
    update();

    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    print(cl);
    print(lat);
    print(long);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lat', lat.toString());
    preferences.setString('long', long.toString());

    myMarker.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(lat, long),
      ),
    );
    statusRequest = StatusRequest.success;
    update();
  }

  // changeMarker(newLat, newLong) {
  //   myMarker.remove(const Marker(markerId: MarkerId('1')));
  //   myMarker.add(Marker(
  //       markerId: const MarkerId('1'), position: LatLng(newLat, newLong)));
  //   gmc.animateCamera(CameraUpdate.newLatLng(LatLng(newLat, newLong)));
  //   update();
  // }
  confirmLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('lat'));
    print(prefs.getString('long'));
  }

  @override
  void onInit() {
    items = Get.arguments['items'];
    totalPrice = Get.arguments['totalPrice'];
    getPermeation();
    getLatAndLong();
    // positionSteam = Geolocator.getPositionStream().listen((Position? position) {
    //   changeMarker(position!.latitude, position.longitude);
    // });
    super.onInit();
  }

  @override
  goToCheckout() {
    Get.toNamed(AppRoutes.checkout,
        arguments: {'items': items, 'totalPrice': totalPrice});
  }
}
