import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app_config/app_environments.dart';
import 'di/di.dart';
import 'presentation/authentication/page/sign_in_view.dart';

Future<void> mainForEnvironment() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAuthenticationModule();
  runApp(const MyApp());
}

final botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppEnvironments.debugBannerBoolean,
      builder: (ctx, child) {
        ScreenUtil.init(ctx);
        child = botToastBuilder(context, child);
        return ResponsiveBreakpoints.builder(
          child: child,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
      title: AppEnvironments.appName,
      // initialRoute: RouteName.routeSplash,
      home: const SignInView(),
    );
  }
}
