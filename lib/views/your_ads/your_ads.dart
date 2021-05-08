import 'package:flutter/material.dart';
import '../../global_widgets/property_list.dart';
import '../../models/property.dart';
import '../../global_widgets/base_view.dart';

class YourAdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Property> _properties = [
      properties[0],
      properties[1],
    ];

    final content = PropertyList(properties: _properties);

    return BaseView(title: "Your Ads", body: content);
  }
}
