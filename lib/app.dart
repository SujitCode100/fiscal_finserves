import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/pages/splash_screen.dart';
import 'package:joyn/utils/utils.dart';

import 'Languages/local_constant.dart';
import 'Languages/localization_delegate.dart';

// final dataStorages = GetStorage();

class FiscalFinserveApp extends StatefulWidget {
  const FiscalFinserveApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_FiscalFinserveAppState>();
    state!.setLocale(newLocale);

  }

  @override
  _FiscalFinserveAppState createState() => _FiscalFinserveAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _FiscalFinserveAppState extends State<FiscalFinserveApp> {

   Locale? _locale = null;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      print("newlanguage" +_locale!.languageCode);
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: primaryWhite));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          scaffoldMessengerKey: Utils.messsengerKey,
          navigatorKey: navigatorKey,
          title: 'Fiscal Finserve',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // ignore: deprecated_member_use
            backgroundColor: primaryWhite,
            primaryColor: primaryWhite,
            fontFamily: 'Montserrat-Regular',
            hintColor: primaryWhite,
            iconTheme: const IconThemeData(color: primaryWhite, size: 24),
          ),
          locale: _locale,
          home: SplashScreen(),
          supportedLocales: [
            Locale('en', ''),
            Locale('gu', ''),
            Locale('hi', '')
          ],
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale?.languageCode == locale?.languageCode &&
                  supportedLocale?.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales?.first;
          },
        );
      },
    );
  }
}
