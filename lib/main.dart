import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/theme/theme.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => UIProvider() ),
        ChangeNotifierProvider( create: ( _ ) => NewsProvider() )
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const TabsScreen()
    );
  }
}

// 70c0db59ebf6439f828e1e30a604e8b8