import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.labelText = '',
    this.onPressed,
    this.color = Colors.black,
    this.width,
    this.padding = 19,
    this.colorText = Colors.white,
  }) : super(key: key);

  final String labelText;
  final Function()? onPressed;
  final Color? color;
  final double? width;
  final double padding;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: SizeConstant.maxWebWidth),
      child: SizedBox(
        width: width,
        height: 60,
        child: MaterialButton(
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(vertical: padding),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          color: color,
          child: Text(
            labelText.toUpperCase(),
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: colorText,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
