import 'package:demo_mc/core/theme/text_size.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.maxLines,
    this.onChanged,
    this.errorText = '',
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.hintText = '',
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.maxLength,
    this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool readOnly;
  final TextInputType keyboardType;

  final int minLines;
  final int? maxLines;
  final String? errorText;
  final void Function(String?)? onChanged;
  final TextAlign textAlign;
  final String hintText;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: SizeConstant.maxWebWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              errorMaxLines: 2,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              errorStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.red,
                    fontSize: TextSize.size12,
                  ),
            ),
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: 1,
            minLines: minLines,
            validator: validator,
            readOnly: readOnly,
            onTap: onTap,
            textAlign: textAlign,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            obscuringCharacter: '*',
            obscureText: isPassword ?? false,
          ),
        ],
      ),
    );
  }
}
