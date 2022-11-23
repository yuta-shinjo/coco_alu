import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/models/model.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/components.dart';
import 'package:my_collection/ui/pages/album_detail_page/album_detail_page.dart';

class ProfilePageBody extends ConsumerWidget {
  const ProfilePageBody({Key? key, required this.profile, required this.albums})
      : super(key: key);

  final List<Album> albums;
  final User profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 50),
        _profileDisplay(context, albums),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(color: AppColors.grey),
        ),
        _photoList(albums),
      ],
    );
  }

  Widget _profileDisplay(BuildContext context, List<Album> album) {
    final imgUrls = profile.imgUrls;
    final name = profile.name;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          imgUser(imgUrls),
          const SizedBox(width: 20),
          infoUser(context, name, album),
        ],
      ),
    );
  }

  Widget imgUser(String imgUrls) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.lightGrey,
        child: ClipOval(
          child: imgUrls.isNotEmpty
              ? UniversalImage(
                  imgUrls,
                  fit: BoxFit.cover,
                )
              : const UniversalImage(
                  'assets/images/avatar.jpg',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget infoUser(BuildContext context, String? name, List<Album> album) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          width: MediaQuery.of(context).size.width / 2.5,
          child: Text(
            name!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: OverlineText(
            '公開している思い出: ${album.length}',
          ),
        ),
      ],
    );
  }

  Widget _photoList(List<Album> albums) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 3,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          final albumImageUrl = album.imgUrls;
          return GestureDetector(
            onTap: () => _goToDetail(context, album),
            child: album.latitude!.isEmpty
                ? SizedBox(
                    width: MediaQuery.of(context).size.width / 2.9,
                    height: MediaQuery.of(context).size.width / 2.9,
                    child: UniversalImage(albumImageUrl, fit: BoxFit.cover),
                  )
                : Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.9,
                        height: MediaQuery.of(context).size.width / 2.9,
                        child: UniversalImage(albumImageUrl, fit: BoxFit.cover),
                      ),
                      const Align(
                        alignment: Alignment(0.95, -0.95),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.lightGrey,
                          child:
                              Icon(Icons.location_on, color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }

  void _goToDetail(BuildContext context, Album album) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: AlbumDetailPage(album: album),
              );
            },
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}
