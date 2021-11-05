import 'package:demo_mc/core/theme/text_size.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
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
    this.isRequired = true,
    this.hintText = '',
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.maxLength,
    this.onTap,
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
  final bool isRequired;
  final String hintText;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              hintText: widget.hintText,
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
            controller: widget.controller,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            validator: widget.validator,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            textAlign: widget.textAlign,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLength: widget.maxLength,
          ),
        ],
      ),
    );
  }
}
