import 'package:flutter/material.dart';
import 'package:my_collection/models/src/album.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/theme_text.dart';
import 'package:my_collection/ui/components/src/universal.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "background_${album.content}",
          child: Container(
            color: AppColors.white,
          ),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
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
          _displayImage(context),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Subtitle2Text(album.content),
          ),
        ],
      ),
    );
  }

  Widget _displayImage(BuildContext context) {
    return Hero(
      tag: "image_${album.content}",
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: UniversalImage(album.imgUrls, fit: BoxFit.cover),
      ),
    );
  }
}
