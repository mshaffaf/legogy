import 'package:flutter/material.dart';
import 'widgets/amenity_card.dart';
import 'widgets/property_type_row.dart';
import 'widgets/type_card.dart';
import '../../models/message_list_item.dart';
import '../../presentation/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import '../../router.dart';
import '../../utils/utils.dart';
import '../../global_widgets/carousel.dart';
import '../../models/property.dart';
import 'widgets/content_view.dart';

class PropertyDetails extends StatefulWidget {
  final Property property;

  const PropertyDetails({
    Key key,
    this.property,
  }) : super(key: key);

  @override
  _PropertyDetailsState createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {

    final slider = Container(
      height: 300,
      width: double.infinity,
      color: Colors.cyan,
      child: Carousel(
        images: widget.property.photos.map((photo) {
          return ExactAssetImage(photo);
        }).toList(),
      ),
    );

    final name = Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        widget.property.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.center,
      ),
    );

    final likeBtn = Container(
      child: GestureDetector(
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
            // size: 20,
          ),
          onTap: () {
            setState(() {
              isFav = !isFav;
            });
          }),
    );

    final price = Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Asking",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${AppFunctions.formatPrice(widget.property.price)}",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0),
              ),
            ],
          ),
          Spacer(),
          likeBtn
        ],
      ),
    );

    final hr = Divider();
    final vr = Container(
      width: 1,
      height: 30,
      color: Colors.grey.withOpacity(0.5),
    );

    final action = Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          iconText(
            icon: CustomIcons.bed,
            count: widget.property.bedRoomCount.toString() + " Bedrooms",
          ),
          vr,
          iconText(
            icon: CustomIcons.bathroom,
            count: widget.property.bathRoomCount.toString() + " Bathrooms",
          ),
          vr,
          iconText(
            icon: CustomIcons.ruler,
            count: NumberFormat.decimalPattern().format(
                  widget.property.sizeInSqFt,
                ) +
                " Sqft",
          )
        ],
      ),
    );

    final description = ContentView(
      title: "Description",
      content: Container(
        child: Text(
          widget.property.description,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );

    final amenities = ContentView(
      title: "Amenities",
      content: Container(
        child: Wrap(
          spacing: 20.0,
          runSpacing: 10.0,
          children: widget.property.amenities.map((amenity) {
            return AmenityCard(amenity: amenity);
          }).toList(),
        ),
      ),
    );

    final rules = ContentView(
      title: "Rules",
      content: Container(
        child: Wrap(
          spacing: 20.0,
          runSpacing: 10.0,
          children: widget.property.rules.map((amenity) {
            return AmenityCard(amenity: amenity);
          }).toList(),
        ),
      ),
    );

    final details = ContentView(
      title: "Property Details",
      content: Container(
        child: Column(children: [
          Column(
            children: <Widget>[
              PropertyTypeRow(
                typeCard1: TypeCard(
                  title: "Type",
                  content: "For " + widget.property.type,
                ),
                typeCard2: TypeCard(
                  title: "Property Type",
                  content: widget.property.propertyType,
                ),
              ),
              PropertyTypeRow(
                typeCard1: TypeCard(
                  title: "Built Year",
                  content: widget.property.buildYear.toString(),
                ),
                typeCard2: TypeCard(
                  title: "Size Area",
                  content: NumberFormat.decimalPattern().format(
                        widget.property.sizeInSqFt,
                      ) +
                      " Sqft",
                ),
              ),
              PropertyTypeRow(
                typeCard1: TypeCard(
                  title: "Furnished?",
                  content: widget.property.isFurnished ? "Yes" : "No",
                ),
                typeCard2: TypeCard(
                  title: "Price/Sqft",
                  content: "\$1,231",
                ),
              ),
            ],
          )
        ]),
      ),
    );

    final location = ContentView(
      title: "Location",
      content: Container(
        child: Text(
          widget.property.location,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
    );

    final top = Positioned(
      top: 30,
      left: 0,
      child: MaterialButton(
        color: Colors.grey.withOpacity(0.9),
        shape: CircleBorder(),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

    final userImage = Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.property.agentPhoto),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );

    final userDetail = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.property.agentName,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          Text(
            "AGENT",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    final messageBtn = MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      height: 50.0,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed(
          messageDetailsViewRoute,
          arguments: messageListItems[0],
        );
      },
      child: Row(
        children: <Widget>[
          Icon(
            CustomIcons.chat,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            "Message",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );

    final bottom = Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[userImage, userDetail, Spacer(), messageBtn],
        ),
      ),
    );

    final spacer = SizedBox(height: 200.0);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                slider,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      name,
                      price,
                      hr,
                      action,
                      hr,
                      description,
                      amenities,
                      rules,
                      details,
                      hr,
                      location,
                      spacer
                    ],
                  ),
                )
              ],
            ),
          ),
          top,
          bottom
        ],
      ),
    );
  }

  Widget iconText({IconData icon, String count}) {
    Color color = Colors.black;
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            count,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
