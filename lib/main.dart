import 'package:auvnet_flutter_internship_assessment/core/routing/app_router.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/utils/constants.dart';
import 'package:auvnet_flutter_internship_assessment/core/utils/service_locator.dart';
import 'package:auvnet_flutter_internship_assessment/core/utils/simple_bloc_observer.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/loading_service.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/models/user_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/banner_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/restaurant_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/service_model.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/models/user_profile_model.dart';
import 'package:auvnet_flutter_internship_assessment/firebase_options.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  await Hive.openBox<UserModel>(kUserBox);
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ServiceModelAdapter());
  }
  await Hive.openBox<ServiceModel>(kServiceBox);
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(RestaurantModelAdapter());
  }
  await Hive.openBox<RestaurantModel>(kRestaurantBox);
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(BannerModelAdapter());
  }
  await Hive.openBox<BannerModel>(kBannerBox);
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(UserProfileModelAdapter());
  }
  await Hive.openBox<UserProfileModel>(kUserProfileBox);
  Bloc.observer = SimpleBlocObserver();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      builder: EasyLoading.init(builder: BotToastInit()),
      initialRoute: Routes.splashView,
      onGenerateRoute: widget.appRouter.generateRoute,
    );
  }
}
