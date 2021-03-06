import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team_mobileforce_gong/state/notesProvider.dart';
import 'package:team_mobileforce_gong/state/theme_notifier.dart';
import 'package:team_mobileforce_gong/state/todoProvider.dart';

import 'UI/screens/splashscreen.dart';
import 'services/quotes/quoteState.dart';
import 'state/authProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff0984E3),
  ));
  
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ChangeNotifierProvider<ThemeNotifier>(
      child: MyApp(),
      create: (BuildContext context) {
        return ThemeNotifier();
      },
    ),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeNotifier>(context).loadThemeData(context);
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthenticationState()),
            ChangeNotifierProvider(create: (_) => QuoteState()),
            ChangeNotifierProvider(create: (_) => NotesProvider()),
            ChangeNotifierProvider(create: (_) => TodoProvider())
          ],
          child: MaterialApp(
            locale: DevicePreview.of(context).locale,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Gong',
            theme: Provider.of<ThemeNotifier>(context).currentThemeData,
            home: SplashScreen()
          ),
        );
      },
    );
  }
}
