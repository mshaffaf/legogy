import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hommie/services/dialog.service.dart';
import '../../global_widgets/amenity_selector.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/custom_stepper/custom_stepper.dart';
import '../../global_widgets/custom_stepper/src/step.dart';
import '../../global_widgets/header_text.dart';
import '../../global_widgets/plus_minus_form_field.dart';
import '../../models/amenity.dart';
import 'package:image_picker/image_picker.dart';
import '../../global_widgets/custom_form_field.dart';
import '../../models/property.dart';
import '../create_ad/widgets/options_selector.dart';
import '../../global_widgets/section.dart';
import 'widgets/clickable_image_selector.dart';

class CreateAdPage extends StatefulWidget {
  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  String _selectedPropertyType = propertyTypes[0];
  List<File> _images = [];
  TextEditingController _titleCtrl = new TextEditingController();
  TextEditingController _descriptionCtrl = new TextEditingController();
  List<String> _selectedUtilities = [];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final step0Content = Container(
      child: Column(
        children: <Widget>[
          CustomFormField(
            labelText: "Title",
            controller: _titleCtrl,
          ),
          CustomFormField(
            labelText: "Description",
            controller: _descriptionCtrl,
          ),
          SizedBox(height: 10),
          Text(
            "Please enter a description to get the best possible response to your listing. Tell other users what you love about the property, what is great about it and its location",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );

    final step1Content = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          section(
            title: "Property Type",
            content: DropdownButton(
              isExpanded: true,
              value: _selectedPropertyType,
              items: propertyTypes.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  _selectedPropertyType = _;
                });
              },
            ),
          ),
          section(
            title: "Listing Type",
            content: OptionsSelector(
              options: <String>[
                'For Sale',
                'For Rent',
              ],
            ),
          ),
          section(
            title: "Property Room",
            content: Column(children: [
              PlusMinusFormField(
                title: "Bedroom",
              ),
              SizedBox(
                height: 20.0,
              ),
              PlusMinusFormField(title: "Bathroom"),
            ]),
          ),
        ],
      ),
    );

    final step2Content = Container(
      child: ClickableImageSelector(
        onPressed: () async {
          await pickImage();
        },
        onDeleteClicked: (int index) {
          setState(() {
            _images.removeAt(index);
          });
        },
        selectedImages: _images,
      ),
    );

    final step3Content = Container(
      height: 400.0,
      child: GridView.count(
        mainAxisSpacing: 20.0,
        crossAxisCount: 3,
        children: amenities.map((amenity) {
          return AmenitySelector(
            amenity: amenity,
            onTap: () {
              setState(() {
                bool exists = _selectedUtilities.contains(amenity.name);
                if (exists) {
                  // Remove
                  _selectedUtilities.removeWhere((i) => i == amenity.name);
                } else {
                  // Add
                  _selectedUtilities.add(amenity.name);
                }
              });
              print(_selectedUtilities);
            },
          );
        }).toList(),
      ),
    );

    final List<AStep> steps = [
      AStep(
        title: "Basic Information",
        subtitle: "Give a brief but detailed information about the property",
        content: step0Content,
        validation: () {
          if (_titleCtrl.text.isEmpty) {
            return "Title is required";
          } else if (_descriptionCtrl.text.isEmpty) {
            return "Description is required";
          } else {
            return null;
          }
        },
      ),
      AStep(
        title: "Other Information",
        subtitle:
            "Provide other information that could help users easily find your property",
        content: step1Content,
        validation: () => null,
      ),
      AStep(
        title: "Images",
        subtitle: "Select at least 3 images, and a maximum of 10",
        content: step2Content,
        validation: () {
          if (_images.length < 3) {
            return "Atleast 3 images are required";
          } else {
            return null;
          }
        },
      ),
      AStep(
        title: "Utilities",
        subtitle: "Select as many utilities as you have on your property",
        content: step3Content,
        validation: () {
          if (_selectedUtilities.length == 0) {
            return "Select at least 1 utility";
          } else {
            return null;
          }
        },
      ),
    ];

    final top = Container(
      margin: EdgeInsets.only(
        bottom: 30.0,
        left: 20.0,
        right: 20.0,
        top: 40.0,
      ),
      child: HeaderText(text: "Add Property"),
    );

    final content = Expanded(
      child: Container(
        child: CustomStepper(
          steps: steps,
          onCompleted: () async {
            await DialogService().show(
              context: context,
              message: "Ad created successfully!",
              type: AlertDialogType.success,
            );
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[top, content],
        ),
      ),
    );
  }

  Widget section({
    String title,
    Widget content,
    EdgeInsetsGeometry padding,
  }) {
    return Section(
      title: title,
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
      content: content,
    );
  }
}
