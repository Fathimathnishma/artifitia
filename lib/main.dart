import 'package:artifitia/features/splash/presentataions/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependancy();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(const MyApp());
  });
}

late double height;
late double width;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => UserProvider(sl<IUserFacade>()),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => AddItemProvider(sl<IItemFacade>()),
    //     ),
    //     ChangeNotifierProvider(
    //         create: (_) => OrderHistoryProvider(sl<IOrderHistoryFacade>())),
    //     ChangeNotifierProvider(
    //       create: (context) => OrderSummeryProvider(sl<IOrderSummeryFacade>()),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => HomeProvider(
    //         sl<IHomeFacade>(),
    //       ),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => TodayOrderProvider(sl<ITodayOrderFacade>()),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => UserPaymentProvider(sl<IUserPaymentFacade>()),
    //     ),
    //     ChangeNotifierProvider(
    //       create: (_) => OrderDetailsProvider(sl<IOrderDetailsFacade>()),
    //     )
    //   ],
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
