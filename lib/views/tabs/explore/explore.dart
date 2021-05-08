import 'package:flutter/material.dart';
import '../../../global_widgets/property_item_alt.dart';
import '../../../services/dialog.service.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../models/property.dart';
import '../../../utils/utils.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Property> _properties = properties;

    final searchField = Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          hintText: "Type Location",
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
        ),
      ),
    );

    final filter = Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Showing Result",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  "${_properties.length} Properties Found",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          OutlineButton(
            onPressed: () => DialogService().showFilter(context: context),
            highlightedBorderColor: Colors.grey.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            child: Row(
              children: [
                Icon(LineAwesomeIcons.filter),
                Text(
                  "Filters",
                )
              ],
            ),
          )
        ],
      ),
    );

    final list = Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 40.0),
        itemCount: _properties.length,
        itemBuilder: (BuildContext context, int index) {
          return PropertyItemAlt(
            property: _properties[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Divider(thickness: 1.0),
              Utils.verticalSpacer(),
            ],
          );
        },
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpacer(),
          searchField,
          Utils.verticalSpacer(),
          filter,
          Utils.verticalSpacer(),
          list,
        ],
      ),
    );
  }
}
