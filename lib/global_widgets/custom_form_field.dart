import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/styles.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool enabled;
  final double height;
  final int maxLines;
  final Function onTap;
  final bool readOnly;
  final bool isOutlineBorder;
  final List<TextInputFormatter> inputFormatters;
  final String Function(String) validator;

  const CustomFormField({
    Key key,
    this.labelText,
    this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.isPasswordField = false,
    this.controller,
    this.enabled = true,
    this.height,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.isOutlineBorder = false,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.4),
      ),
    );

    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.4),
      ),
    );

    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText.toUpperCase(),
        labelStyle: AppTextStyles.formLabelTextStyle,
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                color: Colors.grey.withOpacity(0.4),
              )
            : null,
        enabledBorder: widget.isOutlineBorder ? outlineBorder : underlineBorder,
        border: widget.isOutlineBorder ? outlineBorder : underlineBorder,
        suffixIcon: widget.isPasswordField
            ? _buildPasswordFieldVisibilityToggle()
            : null,
      ),
      keyboardType: widget.keyboardType,
      style: AppTextStyles.textFieldTextStyle,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.isPasswordField ? _obscureText : false,
      controller: widget.controller,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      onTap: widget.onTap ?? null,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters ?? null,
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
