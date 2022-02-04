import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/components/src/universal.dart';

class AlbumDetailPage extends ConsumerWidget {
  const AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Hero(
          tag: "background_${album.content}",
          child: Container(
            color: Colors.white,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: CloseButton(),
          ),
          body: _albumDetailPageBody(context),
        ),
      ],
    );
  }

  Widget _albumDetailPageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: "image_${album.content}",
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: UniversalImage(
                album.imgUrls,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Hero(
              tag: "background_${album.content}",
              child: Container(
                child: Subtitle2Text(album.content),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
