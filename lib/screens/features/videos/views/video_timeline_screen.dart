import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/screens/features/videos/view_models/timeline_view_model.dart';
import 'package:tictok_clone/screens/features/videos/views/wedgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  int _itemCount = 0;

  final Duration _scrollDuration = const Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (pageIndex == _itemCount - 1) {
      ref.watch(timelineProvider.notifier).fetchNextpage();
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  Future<void> _onRefresh() {
    return ref.watch(timelineProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          data: (videos) {
            _itemCount = videos.length;
            return RefreshIndicator(
              onRefresh: _onRefresh,
              displacement: 50,
              color: Theme.of(context).primaryColor,
              child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: _onPageChanged,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final videoData = videos[index];
                    return VideoPost(
                      onVideoFinished: _onVideoFinished,
                      index: index,
                      videoData: videoData,
                    );
                  }),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              "Colud not load videos : $error",
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
