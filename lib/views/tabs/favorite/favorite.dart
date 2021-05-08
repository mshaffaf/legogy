import 'package:flutter/material.dart';
import '../../../global_widgets/property_list.dart';
import '../../../global_widgets/header_text.dart';
import '../../../models/property.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Property> _properties = [
      properties[3],
    ];

    final title = Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: HeaderText(text: "Favorites"),
    );

    final list = Expanded(
      child: PropertyList(
        properties: _properties,
        showFilter: false,
        showFav:  false,
        canDelete: true,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, list],
      ),
    );
  }
}
