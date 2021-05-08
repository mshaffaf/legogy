import 'package:flutter/material.dart';
import '../../global_widgets/button_group.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_chip.dart';
import '../../global_widgets/section.dart';
import '../../models/property.dart';
import '../../utils/utils.dart';
import '../../views/create_ad/widgets/options_selector.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key key,
  }) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  double _lowerPrice = 100;
  double _upperPrice = 500;
  @override
  Widget build(BuildContext context) {
    final top = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Filters",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );

    final hr = Divider(height: 50.0, thickness: 1.0);

    final type = Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Looking for",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Utils.horizontalSpacer(),
              Expanded(
                child: OptionsSelector(
                  options: <String>[
                    'For Sale',
                    'For Rent',
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

    final propertyType = Container(
      child: Section(
        title: "Property Type",
        fontWeight: FontWeight.w600,
        fontSize: 17,
        content: Container(
          child: Wrap(
            spacing: 20.0,
            children: propertyTypes.map((type) {
              return CustomChip(label: type);
            }).toList(),
          ),
        ),
      ),
    );

    final priceRange = Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(
                "Price Range",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Text(
                "${AppFunctions.formatPrice(_lowerPrice)} - ${AppFunctions.formatPrice(_upperPrice)}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.grey
                ),
              ),
            ],
          ),
          Container(
            child: frs.RangeSlider(
              min: 10,
              max: 5000,
              lowerValue: _lowerPrice,
              upperValue: _upperPrice,
              divisions: 50,
              showValueIndicator: true,
              valueIndicatorMaxDecimals: 1,
              onChanged: (double newLowerValue, double newUpperValue) {
                setState(() {
                  _lowerPrice = newLowerValue;
                  _upperPrice = newUpperValue;
                });
              },
            ),
          )
        ],
      ),
    );

    final bedrooms = Container(
       margin: EdgeInsets.only(top: 10.0),
      child: Section(
        title: "Bedrooms",
        fontWeight: FontWeight.w600,
        fontSize: 17,
        content: Container(
          child: ButtonGroup(
            options: ["Any", "1", "2", "3", "4+"],
          ),
        ),
      ),
    );

    final bathrooms = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Section(
        title: "Bathrooms",
        fontWeight: FontWeight.w600,
        fontSize: 17,
        content: Container(
          child: ButtonGroup(
            options: ["Any", "1", "2", "3", "4+"],
          ),
        ),
      ),
    );

    final bottom = Container(
      child: CustomButton(
        text: "Apply",
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          top,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  type,
                  hr,
                  propertyType,
                  priceRange,
                  bedrooms,
                  bathrooms,
                ],
              ),
            ),
          ),
          bottom
        ],
      ),
    );
  }
}
