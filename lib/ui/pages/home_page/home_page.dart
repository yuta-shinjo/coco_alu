import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/controllers/pages/home_page_controller.dart';
import 'package:my_collection/themes/test_app_colors.dart';
import 'package:my_collection/ui/components/components.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(homePageProvider.select((s) => s.albums)) ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText('アルバム一覧'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/travel.png'),
                      ),
                      Subtitle2Text('旅行'),
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/food.png'),
                      ),
                      Subtitle2Text('食べ物'),
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/family.png'),
                      ),
                      Subtitle2Text('家族'),
                    ],
                  ),
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                        ),
                      ),
                      Text(
                        'More',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: AppColors.grey),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: albums.length,
                itemBuilder: (BuildContext context, int index) {
                  final album = albums[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Ink.image(
                      image: album.imgUrls != ''
                          ? NetworkImage(album.imgUrls)
                          : Image.network(
                              'https://www.tsuzukiblog.org/_wu/2020/03/shutterstock_1005938026.jpg',
                            ).image,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
