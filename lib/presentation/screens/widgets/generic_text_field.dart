import 'package:flutter/material.dart';
import 'package:prontoictus_flutter/helpers/validators.dart';

class GenericTextField extends StatefulWidget {
  final String? Function(String? value) valitorCallback;
  final ValueChanged<String?> onValue;
  final IconData? suffixIcon;
  final String labelText;
  final bool isPassword;

  const GenericTextField({
    super.key,
    required this.onValue,
    this.suffixIcon,
    required this.labelText,
    this.isPassword = false,
    required this.valitorCallback,
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // final _focusNode = FocusNode();
    return TextFormField(
      obscureText: widget.isPassword,
      focusNode: _focusNode,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(
                  widget.suffixIcon,
                  color: Theme.of(context).primaryColor,
                ),
          enabledBorder: _OutlineInputBorder().getDecoration(context),
          focusedBorder: _OutlineInputBorder().getDecoration(context)),
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      validator: widget.valitorCallback,
      onSaved: widget.onValue,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class _OutlineInputBorder {
  OutlineInputBorder getDecoration(BuildContext ctx) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: Theme.of(ctx).primaryColor));
  }
}
