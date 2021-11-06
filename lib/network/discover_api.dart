import 'dart:math';

import 'package:demo_mc/core/api/api.dart';
import 'package:demo_mc/core/models/base_response_api_model.dart';
import 'package:demo_mc/data/models/user_model.dart';

abstract class DiscoverApi {
  Future<BaseResponse<List<String>>> getImages();
}

class DiscoverApiImpl implements DiscoverApi {
  Api api;
  DiscoverApiImpl({required this.api});

  @override
  Future<BaseResponse<List<String>>> getImages() async {
    Map<String, dynamic> mockData = {
      "data": {
        "images": [
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
        ]
      },
      "errors": null
    };
    return BaseResponse<List<String>>.fromJson(
      mockData,
      parseJson: (json) => json['images'],
    );
  }
}
