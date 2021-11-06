import 'dart:ui';
import 'package:demo_mc/core/language/internationalization.dart';
import 'package:demo_mc/presentation/screens/discover/discover_state.dart';
import 'package:demo_mc/presentation/widgets/custom_avt_with_info.dart';
import 'package:demo_mc/presentation/widgets/custom_button.dart';
import 'package:demo_mc/presentation/widgets/round_corner_image.dart';
import 'package:demo_mc/presentation/widgets/title_headline.dart';
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
              alignment:
                  AppHelper.isMobile() ? Alignment.topLeft : Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 20),
                  _buildNewDay(images[0]),
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
                  _buildGridViewImage(images),
                  const SizedBox(height: 20),
                  _buildButton(),
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

  _buildTitle() {
    return TitleHeadline(
        text: S.of(context).translate(LanguageKey.discover) ?? '');
  }

  _buildNewDay(String image) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).translate(LanguageKey.newDate) ?? ''.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ImageGridview(
              imgUrl: image,
            ),
          ),
          const SizedBox(height: 20),
          const CustomAvtWithInfo(),
        ],
      ),
    );
  }

  _buildGridViewImage(List<String> images) {
    return StaggeredGridView.countBuilder(
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
    );
  }

  _buildButton() {
    return Center(
      child: PrimaryButton(
        labelText: S.of(context).translate(LanguageKey.seeMore) ?? '',
        colorText: Colors.black,
        width: double.infinity,
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
