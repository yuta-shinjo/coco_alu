import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_collection/themes/app_theme.dart';
import 'package:my_collection/ui/pages/splash_page/splash_page.dart';

void main() async {
  FlutterNativeSplash.removeAfter(_initialization);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // スマホが横向きの場合も縦向き表示にする
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ProviderScope(child: MainApp()));
  });
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myCollection',
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: const SplashPage(),
    );
  }
}

Future<void> _initialization(BuildContext context) async {
  return Future.delayed(const Duration(seconds: 1));
}
