
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'third_party_services/toast_service.dart';


@module
abstract class ThirdPartyServicesModule {

  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  ToastService get toastService;

  @lazySingleton
  SnackbarService get snackbarService;

  @lazySingleton
  ThemeService get themeService;

}