import 'package:demo_mc/utils/app_assets.dart';
import 'package:demo_mc/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? iconLeading;
  final List<Widget>? actions;
  final Function? onTapLeading;
  final double elevation;
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.iconLeading,
    this.actions,
    this.onTapLeading,
    this.elevation = 0,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: widget.elevation,
      title: Text(
        widget.title ?? '',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.black,
            ),
      ),
      centerTitle: false,
      leadingWidth: 30,
      leading: GestureDetector(
        onTap: () {
          widget.onTapLeading == null
              ? Navigator.of(context).pop()
              : widget.onTapLeading?.call();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: widget.iconLeading ?? Image.asset(AppImages.icBack),
        ),
      ),
      actions: widget.actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
