import 'package:flutter/material.dart';
import '../models/amenity.dart';

class AmenitySelector extends StatefulWidget {
  final Amenity amenity;
  final bool isSelected;
  final VoidCallback onTap;

  const AmenitySelector({
    Key key,
    @required this.amenity,
    this.isSelected = false, this.onTap,
  }) : super(key: key);
  @override
  _AmenitySelectorState createState() => _AmenitySelectorState();
}

class _AmenitySelectorState extends State<AmenitySelector> {
  bool isSelected = false;

  @override
  void initState() { 
    super.initState();
    isSelected = widget.isSelected;
  }
  @override
  Widget build(BuildContext context) {
    
    Color color = isSelected ? Theme.of(context).primaryColor : null;

    final icon = Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.4),
        ),
        color: color
      ),
      child: Icon(
        widget.amenity.icon,
        color: isSelected ? Colors.white : null,
      ),
    );

    final name = Container(
      child: Text(
        widget.amenity.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600
        ),
      ),
    );

    final spacer = SizedBox(height: 10.0);

    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          icon,
          spacer,
          name,
        ],
      ),
    );
  }
}
