import '../models/amenity.dart';
import '../utils/utils.dart';

class Property {
  int id;
  String agentName;
  String agentEmail;
  String agentPhone;
  String agentPhoto;
  String name;
  String location;
  String description;
  double price;
  List<String> photos;
  List<Amenity> amenities;
  List<Amenity> rules;
  int bathRoomCount;
  int bedRoomCount;
  String type; // For Sale
  String propertyType;
  int buildYear;
  bool isFurnished;
  int sizeInSqFt; // 1,110 sqft
  DateTime createdAt = DateTime.now();

  Property({
    this.id,
    this.agentName = "Veronica Jung",
    this.agentEmail = "verojung@mail.com",
    this.agentPhone = "0000000000000000",
    this.agentPhoto = AppImages.woman1,
    this.name,
    this.location = "100 Fort Washington Ave, New York, NY 00000",
    this.description,
    this.price,
    this.photos,
    this.amenities,
    this.rules,
    this.bathRoomCount,
    this.bedRoomCount,
    this.type,
    this.propertyType,
    this.buildYear,
    this.isFurnished,
    this.sizeInSqFt = 1100,
  });
}

List<Property> properties = [
  Property(
    id: 1,
    name: "Modern 3 Bedroom House for Sale",
    description:
        """Expanded Cape with Three Bedroom, Living Room, Formal Dining Room, Kitchen, Granite Counter tops, One Full Bath, One Half Bath, Finished basement with S.O.E. Hardwood floors, close to all. Must See. """,
    price: 749000,
    type: "Sale",
    photos: [
      PropertyImages.p11,
      PropertyImages.p12,
      PropertyImages.p13,
      PropertyImages.p14,
      PropertyImages.p15,
    ],
    amenities: [
      AppAmenities.airConditioning,
      AppAmenities.wifi,
      AppAmenities.furnished,
      AppAmenities.heating,
      AppAmenities.tv,
      AppAmenities.parking,
    ],
    rules: [
      AppAmenities.noDrinking,
      AppAmenities.noDrugs,
      AppAmenities.noSmoking,
      AppAmenities.noPets
    ],
    bathRoomCount: 2,
    bedRoomCount: 3,
    propertyType: 'House',
    buildYear: 2020,
    isFurnished: false,
    sizeInSqFt: 1247,
  ),
  Property(
    id: 2,
    name: "Beautiful Studio Apartment for Rent",
    description:
        """Available NOW You've never seen a building this feature packed before. Live in absurd style at this converted Pre-War Bank. Units feature central air and heat, utterly massive 9ft wide windows, separate kitchens, hardwood floors and video intercoms. """,
    price: 1950,
    type: "Rent",
    photos: [
      PropertyImages.p21,
      PropertyImages.p22,
      PropertyImages.p23,
    ],
    amenities: [
      AppAmenities.airConditioning,
      AppAmenities.wifi,
      AppAmenities.furnished,
      AppAmenities.heating,
      AppAmenities.tv,
      AppAmenities.parking,
      AppAmenities.doorman,
      AppAmenities.gym,
      AppAmenities.cctv,
      AppAmenities.security,
      AppAmenities.pool,
    ],
    rules: [
      AppAmenities.noDrinking,
      AppAmenities.noDrugs,
      AppAmenities.noSmoking,
      AppAmenities.noPets
    ],
    bathRoomCount: 1,
    bedRoomCount: 1,
    propertyType: 'Apartment',
    buildYear: 2019,
    isFurnished: true,
  ),
  Property(
    id: 3,
    name: "Nice Double Room with Bathroom",
    description:
        """Gorgeous Elevator Building with Laundry and Live-in Super! Phenomenal, Sprawling 2 Bedroom Fabulous, Enormous, Separate, Windowed Kitchen Elegant Bathroom 2 Big Bedrooms Massive Living Room can fit Dining Area and Full Living Room Set Great Layout with Long Hallway Hardwood Floors High Ceilings Spectacular Details Throughout""",
    price: 2900,
    type: "Rent",
    photos: [
      PropertyImages.p31,
      PropertyImages.p32,
      PropertyImages.p33,
      PropertyImages.p34,
      PropertyImages.p35,
    ],
    amenities: [
      AppAmenities.cctv,
      AppAmenities.security,
      AppAmenities.petsAllowed,
      AppAmenities.privateBath,
    ],
    rules: [
      AppAmenities.noDrinking,
      AppAmenities.noDrugs,
      AppAmenities.noSmoking,
      AppAmenities.noPets
    ],
    bathRoomCount: 1,
    bedRoomCount: 2,
    propertyType: 'Apartment',
    buildYear: 2015,
    isFurnished: false,
  ),
  Property(
    id: 4,
    name: "Restored 4 Bedroom Townhouse",
    description:
        """This is your chance to own an amazing restored townhouse on a very quiet street in Ridgewood Queens. Original hardwood floors finished with Rubio Monocoat a plant-based oil that is super easy to maintain. The house features an open floorplan with a chef's kitchen, a fully finished basement and a small garden with a hot tub. There are three bedrooms and one bath on the top floor and the fully finished basement has a large bathroom and laundry. There is split unit airconditioning /radiator heating throughout and a two-car detached garage. What we love about this house is the charming details, central location, and the community. There is a playground right on the corner and all of the neighbor's kids play in the ally behind the house. There is an incredible tree in front of the house that flowers every spring. """,
    price: 1350000,
    type: "Sale",
    photos: [
      PropertyImages.p41,
      PropertyImages.p42,
      PropertyImages.p43,
    ],
    amenities: [
      AppAmenities.airConditioning,
      AppAmenities.furnished,
      AppAmenities.heating,
      AppAmenities.tv,
      AppAmenities.parking,
      AppAmenities.petsAllowed
    ],
    rules: [
      AppAmenities.noDrinking,
      AppAmenities.noDrugs,
      AppAmenities.noSmoking,
      AppAmenities.noPets
    ],
    bathRoomCount: 2,
    bedRoomCount: 4,
    propertyType: 'House',
    buildYear: 2018,
    isFurnished: true,
    sizeInSqFt: 1899,
  ),
  Property(
    id: 5,
    name: "L-shaped Studio with Balcony",
    description:
        """The apartment has white tiled floors and large windows and an in-wall air conditioner. This unit has very generous storage space with floor to ceiling three double closets. There is laundry in the building as well as a live-in super, bike room, indoor and outdoor parking. This superbly kept lobby is serviced by security personnel. . """,
    price: 299000,
    type: "Sale",
    photos: [
      PropertyImages.p51,
      PropertyImages.p52,
      PropertyImages.p53,
      PropertyImages.p54,
    ],
    amenities: [
      AppAmenities.airConditioning,
      AppAmenities.furnished,
      AppAmenities.heating,
      AppAmenities.tv,
      AppAmenities.parking,
      AppAmenities.petsAllowed
    ],
    rules: [
      AppAmenities.noDrinking,
      AppAmenities.noDrugs,
      AppAmenities.noSmoking,
      AppAmenities.noPets
    ],
    bathRoomCount: 1,
    bedRoomCount: 1,
    propertyType: 'Apartment',
    buildYear: 2017,
    isFurnished: true,
  ),
];

List<String> propertyTypes = [
  'House',
  'Apartment',
  'Penthouse',
  'Commercial',
  'Condominium',
  'Villa'
];
