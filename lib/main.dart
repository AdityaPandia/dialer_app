import 'package:dialer_shubbhvivah/views/login/views/login_view.dart';
import 'package:dialer_shubbhvivah/views/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 720),
        builder: (_, child) {
          return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              // home: const IntroView(),
              // home:MainView(),
              home: GetStorage().read('isLoggedIn') != null &&
                      GetStorage().read('isLoggedIn')
                  ? MainView()
                  : LoginView());
        });
  }
}
