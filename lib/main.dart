import 'package:clean_architecture_template/features/home/presentation/provider.dart';
import 'package:clean_architecture_template/features/template/presentation/state_manager/template_provider.dart';
import 'package:clean_architecture_template/features/template/presentation/ui/screens/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => StudentHomeProvider()..loadHomeDataProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TemplateProvider()..loadTemplateDataProvider(),
          ),
        ],

        child: const TemplateScreen(),
      ),
    );
  }
}
