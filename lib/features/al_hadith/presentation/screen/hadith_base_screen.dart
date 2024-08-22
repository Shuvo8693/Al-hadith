import 'package:al_hadit_test/features/al_hadith/presentation/getx/al_hadith_controller.dart';
import 'package:al_hadit_test/features/al_hadith/presentation/screen/al_hadith_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithBaseScreen extends StatefulWidget {
  const HadithBaseScreen({super.key});

  @override
  State<HadithBaseScreen> createState() => _HadithBaseScreenState();

}

class _HadithBaseScreenState extends State<HadithBaseScreen> {
  final AlHadithController _alHadithController = Get.find<AlHadithController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _alHadithController.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AlHadithScreen(),
    );
  }
}

