import 'package:flutter/material.dart';
import '../presentation/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import '../utils/utils.dart';
import '../models/property.dart';
import '../router.dart';

class PropertyItemAlt extends StatefulWidget {
  final Property property;

  const PropertyItemAlt({
    Key key,
    @required this.property,
  }) : super(key: key);

  @override
  _PropertyItemAltState createState() => _PropertyItemAltState();
}

class _PropertyItemAltState extends State<PropertyItemAlt> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final br = 5.0;

    final price = Container(
      padding: EdgeInsets.all(5.0),
      color: Theme.of(context).primaryColor,
      child: Text(
        "${AppFunctions.formatPrice(widget.property.price)}",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
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
        },
      ),
    );

    final photo = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(br),
          child: Image.asset(
            widget.property.photos[0],
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(top: 20, right: 20, child: likeBtn),
        Positioned(bottom: 20, right: 20, child: price),
      ],
    );

    final name = Container(
      child: Text(
        widget.property.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final address = Container(
      child: Text(
        widget.property.location,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final actions = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconText(
            icon: CustomIcons.bed,
            count: widget.property.bedRoomCount.toString(),
          ),
          iconText(
            icon: CustomIcons.bathroom,
            count: widget.property.bathRoomCount.toString(),
          ),
          iconText(
            icon: CustomIcons.ruler,
            count: NumberFormat.decimalPattern().format(
                  widget.property.sizeInSqFt,
                ) +
                " sqft",
          ),
        ],
      ),
    );

    final details = Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name,
          Utils.verticalSpacer(space: 5),
          address,
          actions,
        ],
      ),
    );

    final view = Padding(
      padding: const EdgeInsets.only(right: 1.0),
      child: MaterialButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(br),
        ),
        padding: EdgeInsets.all(0),
        color: null,
        onPressed: () {
          Navigator.of(context).pushNamed(
            propertyDetailsViewRoute,
            arguments: widget.property,
          );
        },
        child: Container(
          child: Column(
            children: [photo, details],
          ),
        ),
      ),
    );

    return view;
  }

  Widget iconText({IconData icon, String count}) {
    Color color = Colors.grey;
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Utils.horizontalSpacer(space: 5),
          Text(
            count,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
