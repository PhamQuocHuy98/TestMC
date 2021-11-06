import 'dart:ui';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/screens/discover/discover_state.dart';
import 'package:demo_mc/presentation/widgets/custom_avt_with_info.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/round_corner_image.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'discover_bloc.dart';
import 'discover_event.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverBloc get discoverBloc => BlocProvider.of<DiscoverBloc>(context);

  @override
  void initState() {
    super.initState();
    discoverBloc.add(LoadDataStoreEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is LoadSuccessfullyState) {
          List<String> images = state.images;
          if (images.isEmpty) {
            return const Center(
              child: Text('Data Empty'),
            );
          }
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelper.capitalizeFirst(
                        S.of(context).translate(LanguageKey.discover) ?? ''),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).translate(LanguageKey.newDate) ??
                              ''.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        ImageGridview(
                          imgUrl: images[0],
                        ),
                        const SizedBox(height: 20),
                        const CustomAvtWithInfo(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).translate(LanguageKey.browerAll) ??
                          ''.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ImageGridview(
                        imgUrl: images[index],
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                    },
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    labelText:
                        S.of(context).translate(LanguageKey.seeMore) ?? '',
                    colorText: Colors.black,
                    width: double.infinity,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }
        if (state is LoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return const SizedBox();
      },
    );
  }
}

class CustomItemBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onTap;
  final Color activeColor;
  final Color inactiveColor;
  CustomItemBottomNav({
    this.currentIndex = 0,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.black,
    required this.onTap,
  });
  @override
  _CustomItemBottomNavState createState() => _CustomItemBottomNavState();
}

class _CustomItemBottomNavState extends State<CustomItemBottomNav> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(0);
              },
              child: const Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(1);
              },
              child: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(2);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFF00D6),
                    Color(0xffFF4D00),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(3);
              },
              child: const Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                widget.onTap(4);
              },
              child: const Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
