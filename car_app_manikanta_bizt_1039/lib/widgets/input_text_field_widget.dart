import 'package:car_app_manikanta_bizt_1039/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldWidget extends StatelessWidget {
   InputTextFieldWidget({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.redonly = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.maxLines = 1,

  });
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool? redonly;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final FocusNode _focusnode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: maxLines,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: redonly ?? false,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsConstants.inputTextfillColor,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusnode.dispose();
  }
}
