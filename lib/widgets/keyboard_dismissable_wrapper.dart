import 'package:demo_mc/utils/app_helper.dart';
import 'package:flutter/widgets.dart';

class KeyboardDismiss extends StatelessWidget {
  final Widget child;

  const KeyboardDismiss({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHelper.hideKeyBoard(context);
      },
      child: child,
    );
  }
}
