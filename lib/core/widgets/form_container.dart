import 'package:flutter/material.dart';

import '../utils/color_manger.dart';
import '../utils/style_manager.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final bool? obscureText;
  final IconData icon;

  const FormContainerWidget({
    super.key,
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.obscureText,
    required this.icon,
  });

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: hintline.copyWith(color: ColorManager.grey),
        hintText: widget.hintText,
        hintStyle: hintline,
        prefixIcon:
            widget.isPasswordField == true
                ? Icon(Icons.lock, color: Colors.grey)
                : Icon(widget.icon, color: Colors.grey),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              widget.isPasswordField == true
                  ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color:
                        _obscureText == false
                            ? ColorManager.white
                            : ColorManager.grey,
                  )
                  : const Text(""),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: Theme.of(context).inputDecorationTheme.hintStyle,
      controller: widget.controller,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
    );
  }
}
