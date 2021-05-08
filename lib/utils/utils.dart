import 'package:flutter/widgets.dart';

import '../models/amenity.dart';
import '../presentation/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class AppConstants {
  static const appName = "Hommie";
}

class AppFonts {
  static const primaryFont = "Montserrat";
}

class Utils {
  static Widget verticalSpacer({double space = 20.0}) {
    return SizedBox(height: space);
  }

  static Widget horizontalSpacer({double space = 20.0}) {
    return SizedBox(width: space);
  }
}

class AppFunctions {
  static String formatPrice(double price) {
    return removeDecimalZeroFormat(
        NumberFormat.currency(symbol: '\$').format(price));
  }

  static String removeDecimalZeroFormat(String n) {
    return n;
  }
}

class PropertyImages {
  static const p11 = 'assets/images/properties/11.jpg';
  static const p12 = 'assets/images/properties/12.jpg';
  static const p13 = 'assets/images/properties/13.jpg';
  static const p14 = 'assets/images/properties/14.jpg';
  static const p15 = 'assets/images/properties/15.jpg';

  static const p21 = 'assets/images/properties/21.jpg';
  static const p22 = 'assets/images/properties/22.jpg';
  static const p23 = 'assets/images/properties/23.jpg';

  static const p31 = 'assets/images/properties/31.jpg';
  static const p32 = 'assets/images/properties/32.jpg';
  static const p33 = 'assets/images/properties/33.jpg';
  static const p34 = 'assets/images/properties/34.jpg';
  static const p35 = 'assets/images/properties/35.jpg';

  static const p41 = 'assets/images/properties/41.jpg';
  static const p42 = 'assets/images/properties/42.jpg';
  static const p43 = 'assets/images/properties/43.jpg';

  static const p51 = 'assets/images/properties/51.jpg';
  static const p52 = 'assets/images/properties/52.jpg';
  static const p53 = 'assets/images/properties/53.jpg';
  static const p54 = 'assets/images/properties/54.jpg';
}

class AppAmenities {
  static Amenity airConditioning =
      Amenity(name: "Air Conditioning", icon: CustomIcons.ac);
  static Amenity wifi = Amenity(name: "WiFi Included", icon: CustomIcons.wifi);
  static Amenity furnished =
      Amenity(name: "Furnished", icon: CustomIcons.chair);
  static Amenity elevator =
      Amenity(name: "Elevator", icon: CustomIcons.elevator);
  static Amenity doorman =
      Amenity(name: "Door Man", icon: CustomIcons.door_man);
  static Amenity heating = Amenity(name: "Heating", icon: CustomIcons.heater);
  static Amenity gym = Amenity(name: "Gym", icon: CustomIcons.gym);
  static Amenity tv = Amenity(name: "TV", icon: LineAwesomeIcons.tv);
  static Amenity privateBath =
      Amenity(name: "Private Bathroom", icon: CustomIcons.bathroom);
  static Amenity balcony = Amenity(name: "Balcony", icon: CustomIcons.balcony);
  static Amenity cctv = Amenity(name: "CCTV", icon: CustomIcons.cctv);
  static Amenity parking = Amenity(name: "Parking", icon: CustomIcons.parking);
  static Amenity security =
      Amenity(name: "Security", icon: LineAwesomeIcons.shield);
  static Amenity pool = Amenity(name: "Pool", icon: CustomIcons.pool);
  static Amenity petsAllowed =
      Amenity(name: "Pets Allowed", icon: CustomIcons.pet);

  static Amenity noPets = Amenity(name: "No Pets", icon: CustomIcons.no_pets);
  static Amenity noSmoking =
      Amenity(name: "No Smoking", icon: CustomIcons.no_smoking);
  static Amenity noDrugs =
      Amenity(name: "No Drugs", icon: CustomIcons.no_drugs);
  static Amenity noDrinking =
      Amenity(name: "No Drinking", icon: CustomIcons.no_drinking);
}

class AppImages {
  static const woman = 'assets/images/woman.jpg';
  static const woman1 = 'assets/images/woman1.jpg';
  static const woman2 = 'assets/images/woman2.jpg';
  static const woman3 = 'assets/images/woman3.jpg';

  static const man1 = 'assets/images/man1.jpg';
  static const man2 = 'assets/images/man2.jpg';

  static const empty = 'assets/images/empty.png';
  static const logo = 'assets/images/logo.png';
}

class AppIll {
  static const slider1 = 'assets/ill/slider1.svg';
  static const slider2 = 'assets/ill/slider2.svg';
  static const slider3 = 'assets/ill/slider3.svg';

  static const invitation = 'assets/ill/invitation.svg';
  static const addHome = 'assets/ill/add_home.svg';
  static const viewHome = 'assets/ill/view_home.svg';
  static const settings = 'assets/ill/settings.svg';
  static const lifeRing = 'assets/ill/life_ring.svg';
  static const logout = 'assets/ill/logout.svg';

  static const invite = 'assets/ill/invite.svg';
}

class AppAnim {
  static const success = 'assets/anim/success.json';
  static const fingerprint = 'assets/anim/fingerprint.json';
}
