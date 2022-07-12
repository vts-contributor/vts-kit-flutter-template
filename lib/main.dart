import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/home/home.dart';
import 'package:sample/login/login_screen.dart';
import 'package:vts_component/common/style/vts_color.dart';

void main() {
  _lazyPutGetxController();
  runApp(const MyApp());
}

void _lazyPutGetxController() {
  Get.lazyPut(() => HomeGetx(), tag: HomeGetx.tag);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: VTSColors.PRIMARY_0),
      ),
      home: LoginScreen(),
    );
    // StreamBuilder(
    //     stream: AppSetting.languageStream,
    //     builder: (context, language) {
    //       Locale? locale = language.data as Locale?;
    //       return MaterialApp(
    //         title: 'Flutter Demo',
    //         theme: ThemeData(
    //           primarySwatch: Colors.blue,
    //         ),
    //         localizationsDelegates: const [
    //           AppLocalizations.delegate, //ung dung
    //           CoreLocalizations.delegate, //mac dinh cua thu vien
    //           ExternalLocalizations.delegate, //da ngon ngu tu file .json
    //           GlobalMaterialLocalizations.delegate,
    //           GlobalWidgetsLocalizations.delegate,
    //           GlobalCupertinoLocalizations.delegate,
    //         ],
    //         locale: locale,
    //         supportedLocales: const [Locale('vi'), Locale('en')],
    //         home: Home(),
    //       );
    //     });
  }
}
