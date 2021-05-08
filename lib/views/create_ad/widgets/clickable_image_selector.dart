import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ClickableImageSelector extends StatelessWidget {
  final Function onPressed;
  final List<File> selectedImages;
  final Function(int) onDeleteClicked;

  const ClickableImageSelector({
    Key key,
    @required this.onPressed,
    @required this.selectedImages,
    this.onDeleteClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final images = DottedBorder(
      color: Colors.grey,
      strokeWidth: 2.5,
      radius: Radius.circular(10.0),
      dashPattern: [10],
      borderType: BorderType.RRect,
      child: selectedImages.length == 0
          ? _buildNoSelected()
          : GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              padding: EdgeInsets.all(15.0),
              children: selectedImages.map((image) {
                int index = selectedImages.indexOf(image);
                return _buildImage(image: image, index: index);
              }).toList(),
            ),
    );

    final bottom = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
        height: 45.0,
        onPressed: selectedImages.length <= 9 ? onPressed : null,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            LineAwesomeIcons.image,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "Choose a picture",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: <Widget>[
          Expanded(
            child: images,
          ),
          bottom
        ],
      ),
    );
  }

  Widget _buildImage({File image, int index}) {
    final br = BorderRadius.circular(10.0);

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: br,
            image: DecorationImage(
              image: FileImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 4,
          child: GestureDetector(
            onTap: () => onDeleteClicked(index),
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Icon(
                  LineAwesomeIcons.close,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNoSelected() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.empty,
            fit: BoxFit.cover,
            height: 120,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "No picture has been selected",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
          )
        ],
      ),
    );
  }
}
