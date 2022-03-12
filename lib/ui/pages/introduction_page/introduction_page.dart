import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_collection/themes/app_colors.dart';
import 'package:my_collection/ui/components/src/universal.dart';
import 'package:my_collection/ui/pages/root_page/root_page.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => IntroductionPage(),
      settings: const RouteSettings(name: 'introduction_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              title: 'アルバム作成アプリ\n『ココアル』へようこそ',
              body: '・人生の中で大切な瞬間を捉えた写真\n・その時感じたこと\n\nをアルバムとして残しましょう!',
              image: Center(
                child: UniversalImage('assets/images/welcome_introduction.jpg'),
              ),
            ),
            PageViewModel(
              title: 'カメラの位置情報をオンにしましょう!',
              body:
                  'カメラの位置情報をオンにすることで、\n・この写真はどこで撮ったのだろう\n・この思い出の場所はどこだろう\n\nこれらを思い出の振り返りと共に\n見返すことができます!',
              image: Center(
                child: UniversalImage('assets/images/map_introduction.'),
              ),
            ),
            PageViewModel(
              title: 'アルバムを作成して\n思い出に浸りましょう!',
              body: '写真を撮った時の感情を\n作成時に残しておきましょう!\n\n写真にはタグも付けることができます!',
              image: Center(
                child: UniversalImage('assets/images/create_introduction.jpg'),
              ),
            ),
            PageViewModel(
              title: '作成したアルバムは\n削除することができます',
              body: '必要ではなくなったアルバムは削除できます。\n\n楽しい思い出をたくさん記録しましょう!',
              image: Center(
                child: UniversalImage('assets/images/edit_introduction.jpg'),
              ),
            ),
            PageViewModel(
              title: 'アカウント情報を変更できます!',
              body:
                  'メールアドレスを登録されていない方は、\nメールアドレスを登録しましょう!\n\nメールアドレスを登録することで、\n・もしもの時にアカウント復旧ができる\n\n大切なアルバムが消えないように\nメールアドレスを登録しましょう!',
              image: Center(
                child: UniversalImage('assets/images/profile_introduction.jpg'),
              ),
            ),
          ],
          onDone: () async =>
              Navigator.pushReplacement(context, RootPage.route()),
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios, color: AppColors.primary),
          back: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          done: const Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(10.0, 10.0),
            activeColor: AppColors.primary,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
