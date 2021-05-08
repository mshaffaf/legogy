import 'package:flutter/material.dart';
import '../global_widgets/property_list.dart';
import '../utils/utils.dart';
import '../presentation/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import '../models/property.dart';
import '../router.dart';

class PropertyItem extends StatefulWidget {
  final Property property;
  final bool showFav;
  final PropertyListType type;
  final bool canDelete;
  final Function(Property) removeAt;

  const PropertyItem({
    Key key,
    @required this.property,
    this.showFav = true,
    @required this.type,
    this.canDelete = false,
    this.removeAt,
  }) : super(key: key);

  @override
  _PropertyItemState createState() => _PropertyItemState();
}

class _PropertyItemState extends State<PropertyItem> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    bool isType1 = widget.type == PropertyListType.list ? true : false;
    final br = 5.0;

    final photo = ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(br),
        bottomLeft: Radius.circular(br),
      ),
      child: Image.asset(
        widget.property.photos[0],
        height: 140.0,
        width: 140.0,
        fit: BoxFit.cover,
      ),
    );

    final price = Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(bottom: 5),
      color: Theme.of(context).primaryColor,
      child: Text(
        "${AppFunctions.formatPrice(widget.property.price)}",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
      ),
    );

    final likeBtn = widget.showFav
        ? Container(
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
          )
        : Container();

    final top = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [price, likeBtn],
      ),
    );

    final name = Container(
      child: Text(
        widget.property.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final description = Container(
      child: Text(
        widget.property.description,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final actions = Container(
      height: widget.type == PropertyListType.list ? 28 : 30,
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: !isType1 ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
        children: [
          iconText(
            icon: CustomIcons.bed,
            count: widget.property.bedRoomCount.toString(),
          ),
          iconText(
            icon: CustomIcons.bathroom,
            count: widget.property.bathRoomCount.toString(),
          ),
          isType1 ? Container() : iconText(
            icon: CustomIcons.ruler,
            count: NumberFormat.decimalPattern().format(
                  widget.property.sizeInSqFt,
                ) +
                " sqft",
          ),
          // isType1 ? Container() : Spacer(),
          // isType1 ? Container() : price
        ],
      ),
    );

    final details = Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [top, name, description, actions],
        ),
      ),
      flex: 2,
    );

    final type1 = Container(
      child: Row(
        children: [
          photo,
          details,
        ],
      ),
    );

    final photo2 = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(br),
            topRight: Radius.circular(br),
          ),
          child: Image.asset(
            widget.property.photos[0],
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(top: 20, right: 20, child: likeBtn),
        Positioned(bottom: 10, right: 20, child: price)
      ],
    );

    final name2 = Container(
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

    final details2 = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [name2, actions],
      ),
    );

    final type2 = Container(
      child: Column(
        children: [photo2, details2],
      ),
    );

    final view = Padding(
      padding: const EdgeInsets.only(right: 1.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(br),
        ),
        padding: EdgeInsets.all(0),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(
            propertyDetailsViewRoute,
            arguments: widget.property,
          );
        },
        child: widget.type == PropertyListType.list ? type1 : type2,
      ),
    );

    return widget.canDelete
        ? Dismissible(
            onDismissed: (direction) async {
              await widget.removeAt(widget.property);
            },
            secondaryBackground: bg(alignment: AlignmentDirectional.centerEnd),
            background: bg(alignment: AlignmentDirectional.centerStart),
            child: view,
            key: Key(
              widget.property.id.toString(),
            ),
          )
        : view;
  }

  Widget iconText({String count, IconData icon}) {
    final Color color = Colors.grey.withOpacity(0.6);
    return Container(
      margin: EdgeInsets.only(right: 14.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 3),
          Text(
            count,
            style: TextStyle(color: color, fontSize: 14.0),
          )
        ],
      ),
    );
  }

  Widget bg({AlignmentGeometry alignment}) {
    return Container(
      alignment: alignment,
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
