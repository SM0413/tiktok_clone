import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/firebase_options.dart';
import 'package:tictok_clone/generated/l10n.dart';
import 'package:tictok_clone/router.dart';
import 'package:tictok_clone/screens/features/videos/repos/video_playback_config_repo.dart';
import 'package:tictok_clone/screens/features/videos/view_models/playback_config_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  await SystemChrome.setPreferredOrientations(
    [
      //휴대폰 회전 가능한지 여부
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    // 배터리, 시간 컬러 설정
    SystemUiOverlayStyle.light,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PlaybackConfigViewModel(repository),
      )
    ],
    child: const TikTokAPP(),
  ));
}

class TikTokAPP extends StatelessWidget {
  const TikTokAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'TikTokClone',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ko"),
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade100,
        ),
        textTheme: GoogleFonts.juaTextTheme(),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
        textTheme: GoogleFonts.juaTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
    );
  }
}
