import 'package:api_with_provider/res/colors/colors.dart';
import 'package:api_with_provider/utils/routes/route_name.dart';
import 'package:api_with_provider/utils/routes/routes.dart';
import 'package:api_with_provider/view/home/home.dart';
import 'package:api_with_provider/view/login/login_screen.dart';
import 'package:api_with_provider/view/splash/splash_screen.dart';
import 'package:api_with_provider/view_model/auth_view_model.dart';
import 'package:api_with_provider/view_model/home_view_model.dart';
import 'package:api_with_provider/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Apis with Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primaryMaterialColor,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(
              color: AppColors.scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: AppColors.blackColor),
              titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor)),
        ),
        home: const SplashScreen(),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
