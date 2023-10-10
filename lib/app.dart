import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_three_challenge/core/constants.dart';
import 'package:provider/provider.dart';
import 'core/providers/character_movin_provider.dart';
import 'injection.dart';
import 'pages/page_view_container.dart';

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<CharacterMovinProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const PageViewContainer(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
              TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
            },
          ),
        ),
      ),
    );
  }
}
