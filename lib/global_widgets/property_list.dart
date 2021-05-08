import 'package:flutter/material.dart';
import '../services/dialog.service.dart';
import '../global_widgets/empty_state.dart';
import '../global_widgets/property_item.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../models/property.dart';

enum PropertyListType { list, list2 }

class PropertyList extends StatefulWidget {
  final List<Property> properties;
  final bool showFilter;
  final bool showFav;
  final bool canDelete;

  const PropertyList({
    Key key,
    @required this.properties,
    this.showFilter = true,
    this.showFav = true,
    this.canDelete = false,
  }) : super(key: key);

  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  List<bool> _selections = [true, false];
  PropertyListType type = PropertyListType.list;

  @override
  Widget build(BuildContext context) {
    final filter = widget.showFilter
        ? MaterialButton(
            elevation: 0,
            // highlightedBorderColor: Colors.black,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(
            //     30.0,
            //   ),
            // ),
            onPressed: () =>  DialogService().showFilter(context: context),
            child: Row(
              children: [
                Icon(LineAwesomeIcons.filter),
                Text(
                  "Filters",
                )
              ],
            ),
          )
        : Container();

    final top = Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [filter, typeToggle()],
      ),
    );

    final content = Expanded(
      child: ListView.separated(
        itemCount: widget.properties.length,
        padding: EdgeInsets.only(bottom: 40.0),
        itemBuilder: (BuildContext context, int index) {
          return PropertyItem(
            property: widget.properties[index],
            type: type,
            showFav: widget.showFav,
            canDelete: widget.canDelete,
            removeAt: (Property property){
              setState(() {                
                widget.properties.removeWhere((item) => item.id == property.id);
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 15.0,
          );
        },
      ),
    );

    return widget.properties.length == 0
        ? EmptyState(
            message: "Nothing to display",
          )
        : Column(
            children: [top, content],
          );
  }

  Widget typeToggle() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(10),
      children: <Widget>[
        Icon(
          Icons.art_track,
        ),
        Icon(
          Icons.view_compact,
        ),
      ],
      isSelected: _selections,
      onPressed: (int index) {
        setState(() {
          if (index == 0) {
            _selections[0] = true;
            _selections[1] = false;
            type = PropertyListType.list;
          } else {
            _selections[0] = false;
            _selections[1] = true;
            type = PropertyListType.list2;
          }
        });
      },
      color: Colors.grey.withOpacity(0.6),
      selectedColor: Colors.black,
      fillColor: Colors.grey.withOpacity(0.3),
    );
  }
}
