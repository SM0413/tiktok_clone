import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final XFile video;
  final bool isPicked;
  const VideoPreviewScreen(
      {super.key, required this.video, required this.isPicked});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late final VideoPlayerController _videoPlayerController;

  bool _saveVideo = false;

  Future<void> _initVideo() async {
    _videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    );
    await _videoPlayerController.initialize();

    await _videoPlayerController.setLooping(true);

    await _videoPlayerController.play();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  void initPhtoPermisstion() async {
    final canAsscessPhotoRequest = await Permission.photos.request();

    if (!canAsscessPhotoRequest.isDenied) {
      _saveToGallery();
    }
  }

  Future<void> _saveToGallery() async {
    if (_saveVideo) return;

    await GallerySaver.saveVideo(widget.video.path, albumName: "TikTok Clone!");

    _saveVideo = true;
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Preview video",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: initPhtoPermisstion,
              icon: FaIcon(
                _saveVideo ? FontAwesomeIcons.check : FontAwesomeIcons.download,
                color: Colors.white,
              ),
            ),
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}
