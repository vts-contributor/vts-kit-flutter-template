import 'package:flutter/material.dart';
import 'package:flutter_core/localizations/external.dart';
import 'package:sample/sample/localizations/generated/language.dart';
import 'package:sample/sample/sample_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_core/caches/caches.dart';
import 'package:flutter_core/bases/biometrics.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AppSetting.languageStream,
        builder: (context, language) {
          Locale? locale = language.data as Locale?;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            localizationsDelegates: const [
              Language.delegate,
              ExternalLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            supportedLocales: const [Locale('vi'), Locale('en')],
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleBiometric();
  }

  void handleBiometric() async {
    final biometricAuth = BiometricAuth();
    final canCheckBiometrics = await biometricAuth.canCheckBiometrics();
    if(canCheckBiometrics) {
      final result = await biometricAuth.authenticate();
      if(result) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return const SampleScreen();
            }));
      } else {
        debugPrint('authenticate failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30,),
            TextButton(onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return const SampleScreen();
                })),
                child: const Text("Go to sample screen"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
