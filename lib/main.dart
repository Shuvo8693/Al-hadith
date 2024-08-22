
import 'package:al_hadit_test/al_hadith_bindings.dart';
import 'package:al_hadit_test/core/color/app_colors.dart';
import 'package:al_hadit_test/dependency_container.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/screen/hadith_base_screen.dart';
import 'package:al_hadit_test/features/common/widget/database_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const MyApp());
  await initDI();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AlHadithBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: AppColors.primaryColor ,
        useMaterial3: true,
      ),
      home: const HadithBaseScreen(),
    );
  }
}


