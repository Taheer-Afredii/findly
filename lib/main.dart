import 'package:findly/Core/Providers/providers.dart';
import 'package:findly/Core/app_routes.dart';
import 'package:findly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static const double _designWidth = 390;
  static const double _designHeight = 844;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: ScreenUtilInit(
        designSize: const Size(_designWidth, _designHeight),
        builder: (context, widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Findly',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.getRoutes(),
        ),
      ),
    );
  }
}
