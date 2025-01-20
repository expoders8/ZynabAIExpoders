import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';

class CustomTextFormFieldAuth extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? prefixIcon;
  final String? name;
  final String? validationMsg;
  final int? maxLines;
  final bool formSubmitted;
  final Function(String)? onChanged;

  const CustomTextFormFieldAuth({
    Key? key,
    this.ctrl,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.maxLines,
    this.formSubmitted = false,
    this.name,
    this.validationMsg,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldAuth> createState() =>
      _CustomTextFormFieldAuthState();
}

class _CustomTextFormFieldAuthState extends State<CustomTextFormFieldAuth> {
  bool isTouched = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  validateInput(value) {
    if (isTouched || widget.formSubmitted) {
      if (value != null && value?.toString() != '') {
        // if (widget.name == 'email') {
        //   if (value.isEmpty) {
        //     widget.validationMsg;
        //   } else {
        //     const pattern =
        //         r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$)';
        //     final regExp = RegExp(pattern);

        //     if (!regExp.hasMatch(value.toString())) {
        //       return "Please enter valid email";
        //     }
        //   }
        // }
        // if (widget.name == "password") {
        //   if (value.isEmpty) {
        //     widget.validationMsg;
        //   }
        // }
        return null;
      }
      return widget.validationMsg;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kPrimaryColor, fontSize: 16),
      controller: widget.ctrl,
      keyboardType: widget.keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validateInput(value);
      },
      obscureText: widget.name == "password" ? !_passwordVisible : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: kWhiteColor,
        contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        hintStyle: const TextStyle(color: kTextSecondaryColor),
        prefixIcon: widget.prefixIcon != null
            ? Image.asset(
                widget.prefixIcon.toString(),
                color: kPrimaryColor,
                scale: widget.name == "phonenumber" ? 11 : 1.650,
              )
            : null,
        suffixIcon: widget.name == "password"
            ? IconButton(
                splashColor: kTransparentColor,
                highlightColor: kTransparentColor,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kWhiteColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kErrorColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        errorStyle: const TextStyle(color: kErrorColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kWhiteColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kWhiteColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      maxLines: widget.maxLines,
      onChanged: (value) {
        isTouched = true;
        if (widget.onChanged != null) {
          widget.onChanged!(value); // Call the passed in onChanged callback
        }
      },
    );
  }
}
