import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';


import 'app/locator.dart';
import 'app/router.gr.dart';
import 'presentation/configurations/textstyles.dart';
import 'presentation/widgets/setup_bottomsheet_ui.dart';
import 'presentation/widgets/setup_dialog_ui.dart';
import 'presentation/widgets/setup_snackbar_ui.dart';
import 'presentation/configurations/colors.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeManager.initialise();
  setupLocator();
  setupDialogUi();
  setupSnackbarUi();
  setupBottomSheetUi();
  runApp(MyApp());
}








class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      //themes: getThemes(),

      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: darkTextTheme,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Mulish',
      ),

      lightTheme: ThemeData(
        colorScheme: lightColorScheme,
        textTheme: lightTextTheme,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Mullish',
      ),

      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Lottery App',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,

        navigatorObservers: [StackedService.routeObserver],
        initialRoute: Routes.stackedBottomNavView,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: AppRouter().onGenerateRoute,
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}

