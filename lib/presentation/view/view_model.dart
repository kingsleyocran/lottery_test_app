import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../app/router.gr.dart';
import '../../services/third_party_services/toast_service.dart';
import '../../app/locator.dart';
import '../../presentation/widgets/setup_dialog_ui.dart';
import '../../presentation/widgets/setup_snackbar_ui.dart';

abstract class ViewModel extends BaseViewModel {

  final ThemeService _themeService = locator<ThemeService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ToastService _toastService = locator<ToastService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  ThemeService get getTheme => _themeService;
  NavigationService get getNavigator => _navigationService;
  DialogService get getDialogService => _dialogService;
  ToastService get getToastService => _toastService;
  SnackbarService get getSnackBar => _snackbarService;
  BottomSheetService get getBottomSheet => _bottomSheetService;


  Future navigateToHome() async {
    await getNavigator.navigateTo(Routes.homeView);
  }


  Future navigateToProfile() async {
    await getNavigator.navigateTo(Routes.profileView);
  }


  Future navigateToChooseNumber() async {
    await getNavigator.navigateTo(Routes.chooseNumberView);
  }


  Future navigateToPayment() async {
    await getNavigator.navigateTo(Routes.paymentView);
  }


  Future navigateToSeeResult() async {
    await getNavigator.navigateTo(Routes.seeResultView);
  }


  Future navigateToYourResult() async {
    await getNavigator.navigateTo(Routes.yourResultView);
  }







































  Future showSnackBar( String message) async{
    getSnackBar.showCustomSnackBar(
      variant: SnackbarType.redAlert,
      duration: Duration(seconds: 3),
      message: message,

    );
  }

  void themeSwapCode(BuildContext context){
    //Getting Theme Data
    //var theme = Theme.of(context);

    getTheme.setThemeMode(ThemeManagerMode.dark);


    //Set theme to second theme in getThemes()
    getThemeManager(context).selectThemeAtIndex(1);

    //Toggles Theme
    getThemeManager(context).toggleDarkLightTheme();

    //Sets Theme Mode
    getThemeManager(context).setThemeMode(ThemeMode.light);

    //Get currently selected theme
    getThemeManager(context).selectedThemeIndex;

    //Get selected Theme Mode
    getThemeManager(context).selectedThemeMode;

  }

  Future showLoadingDialog(String status, bool dissmisable) async {
    await getDialogService.showCustomDialog(
      barrierDismissible: dissmisable,
      variant: DialogType.loading, // Which builder you'd like to call that was assigned in the builders function above.
      title: status,
    );
  }

  Future<bool> dismissLoadingDialog() {
    getNavigator.back();
    return Future.value(true);
  }

  Future<bool> showDialogFailed({String title, String description, String mainTitle, String secondTitle}) async {
    var response =   await _dialogService.showCustomDialog(
      variant: DialogType.onFailed, // Which builder you'd like to call that was assigned in the builders function above.
      title: title,
      description: description,
      mainButtonTitle: mainTitle,
      secondaryButtonTitle: secondTitle,
    );

    //response.confirm = true means main button clicked
    if(response.confirmed) {
      return true;
    }else return false;

  }

  Future<bool>  showDialogBasic({String title, String description, String mainTitle, String secondTitle}) async {
    var response =   await _dialogService.showCustomDialog(
      variant: DialogType.basic, // Which builder you'd like to call that was assigned in the builders function above.
      title: title,
      description: description,
      mainButtonTitle: mainTitle,
      secondaryButtonTitle: secondTitle,
    );

    //response.confirm = true means main button clicked
    if(response.confirmed) {
      return true;
    }else return false;

  }


}