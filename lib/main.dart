import 'package:auvnet_flutter_internship_assessment/core/routing/app_router.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: Routes.splashView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
