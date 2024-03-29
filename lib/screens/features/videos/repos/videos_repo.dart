import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/features/videos/models/video_model.dart';

class VideosRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadVideoFile(File video, String uid) {
    final fileRef = _storage.ref().child(
        "/videos/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}");
    return fileRef.putFile(video);
  }

  Future<void> saveVideo(VideoModel data) async {
    await _db.collection("videos").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchVideos(
    int? lastItemCreateAt,
  ) {
    final query = _db
        .collection("videos")
        .orderBy("createdAt", descending: true)
        .limit(2);
    if (lastItemCreateAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreateAt]).get();
    }
  }

  Future<void> likeVideo(String videoId, String uid) async {
    final query = _db.collection("likes").doc("${videoId}000$uid");
    final like = await query.get();
    if (!like.exists) {
      await query.set({"createAt": DateTime.now().millisecondsSinceEpoch});
    } else {
      await query.delete();
    }
  }
}

final videosRepo = Provider((ref) => VideosRepository());
