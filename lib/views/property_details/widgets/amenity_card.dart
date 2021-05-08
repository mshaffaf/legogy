import 'package:flutter/material.dart';
import '../../../models/amenity.dart';

class AmenityCard extends StatelessWidget {
  final Amenity amenity;

  const AmenityCard({
    Key key,
    @required this.amenity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(amenity.icon),
          SizedBox(width: 10.0),
          Text(
            amenity.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
