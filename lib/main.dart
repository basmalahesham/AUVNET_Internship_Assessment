import 'package:auvnet_flutter_internship_assessment/core/routing/app_router.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/utils/service_locator.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/loading_service.dart';
import 'package:auvnet_flutter_internship_assessment/firebase_options.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUpServiceLocator();
  configLoading();
  runApp(
    ScreenUtilInit(
      builder: (context, child) => MyApp(appRouter: AppRouter()),
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      initialRoute: Routes.splashView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
