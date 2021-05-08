import 'package:flutter/widgets.dart';
import '../utils/utils.dart';

class Amenity {
  String name;
  IconData icon;

  Amenity({this.name, this.icon});
}

List<Amenity> amenities = [
  AppAmenities.airConditioning,
  AppAmenities.wifi,
  AppAmenities.furnished,
  AppAmenities.elevator,
  AppAmenities.doorman,
  AppAmenities.heating,
  AppAmenities.privateBath,
  AppAmenities.tv,
  AppAmenities.parking,
  AppAmenities.gym,
  AppAmenities.cctv,
  AppAmenities.security,
  AppAmenities.balcony,
  AppAmenities.pool,
  AppAmenities.petsAllowed,
];

List<Amenity> rules = [
  AppAmenities.noDrinking,
  AppAmenities.noDrugs,
  AppAmenities.noSmoking,
  AppAmenities.noPets
];
