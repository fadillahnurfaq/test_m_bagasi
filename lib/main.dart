import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_m_bagasi/utils/utils.dart';
import 'package:test_m_bagasi/views/main/main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const MasterBagasiApp());
}

class MasterBagasiApp extends StatelessWidget {
  const MasterBagasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.grey50,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: AppColors.white),
          elevation: 0.0,
        ),
      ),
      home: MainView(),
    );
  }
}
