import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageGridview extends StatelessWidget {
  final String imgUrl;
  const ImageGridview({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.fill,
      placeholder: (context, url) => _buildShimmerAffect(),
      errorWidget: (context, url, error) => _buildErrorLoading(),
    );
  }

  Widget _buildShimmerAffect() {
    return Shimmer.fromColors(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      baseColor: Colors.grey,
      highlightColor: Colors.grey,
    );
  }

  Widget _buildErrorLoading() {
    return const Center(
      child: Icon(
        Icons.error,
      ),
    );
  }
}
