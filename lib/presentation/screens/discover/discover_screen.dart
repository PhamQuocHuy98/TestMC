import 'dart:ui';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/widgets/custom_avt_with_info.dart';
import 'package:demo_mc/presentation/widgets/round_corner_image.dart';
import 'package:demo_mc/utils/app_constants.dart';
import 'package:demo_mc/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  ImageGridview(
                    imgUrl: imageList[0],
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
              itemCount: imageList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ImageGridview(
                  imgUrl: imageList[index],
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              },
            ),
          ],
        ),
      ),
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
