import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/videos/models/video_model.dart';
import 'package:tictok_clone/screens/features/videos/repos/videos_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;

  List<VideoModel> _list = [];

  Future<List<VideoModel>> _fetchVieos(int? lastItemCreateAt) async {
    final result = await _repository.fetchVideos(lastItemCreateAt);
    final videos = result.docs.map((doc) => VideoModel.fromjson(
          doc.data(),
          doc.id,
        ));

    return videos.toList();
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.watch(videosRepo);

    _list = await _fetchVieos(null);
    return _list;
  }

  Future<void> fetchNextpage() async {
    final nextPage = await _fetchVieos(_list.last.createdAt);
    state = AsyncValue.data([..._list, ...nextPage]);
  }

  Future<void> refresh() async {
    final videos = await _fetchVieos(null);
    _list = videos;
    state = AsyncValue.data(videos);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
