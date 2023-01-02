import 'dart:async';

import 'package:ecommerceapp/controller/cart/deliverlocation_controller.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/imageassets.dart';

class DeliverLocation extends GetView<DeliverLocationControllerImp> {
  const DeliverLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliverLocationControllerImp());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            controller.getLatAndLong();
          },
          child: const Icon(
            Icons.location_on_outlined,
            color: ColorApp.primaryColor,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<DeliverLocationControllerImp>(builder: (controller) {
          return Column(
            children: [
              controller.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(
                        ImagesAssets.loading,
                        height: 250,
                        width: 250,
                      ),
                    )
                  : Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: 400,
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              onTap: (latlong) =>
                                  controller.changeMarkerLocation(
                                      latlong.latitude, latlong.longitude),
                              markers: controller.myMarker,
                              mapType: MapType.normal,
                              initialCameraPosition: controller.kGooglePlex,
                              onMapCreated:
                                  (GoogleMapController controllerMap) {
                                controller.googleMapController(controllerMap);
                              },
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.primaryColor,
                              ),
                              onPressed: () {
                                controller.goToCheckout();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 5),
                                child: Text(
                                  "Confirm",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    height: 1.1,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
//AIzaSyDuxc7sfi24vA7alWKaN-CMoop1tDwyrMs
