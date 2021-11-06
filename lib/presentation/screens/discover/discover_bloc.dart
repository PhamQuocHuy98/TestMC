import 'package:bmprogresshud/progresshud.dart';
import 'package:demo_mc/network/discover_api.dart';
import 'package:demo_mc/presentation/screens/discover/discover_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc({required this.disCoverApi}) : super(Initial());

  DiscoverApi disCoverApi;
  @override
  Stream<DiscoverState> mapEventToState(
    DiscoverEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadDataStoreEvent:
        yield* _mapLoadDataStoreEventState(event);
        break;
    }
  }

  Stream<DiscoverState> _mapLoadDataStoreEventState(
      DiscoverEvent event) async* {
        yield LoadingState();
    final response = await disCoverApi.getImages();
    if (response.hasError) {
      yield ErrorLoadState(errorMessage: response.errorMessage);
    } else {
      yield LoadSuccessfullyState(images: response.data!);
    }
  }
}
