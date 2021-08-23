// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/view/home/home_view.dart';
import '../presentation/view/home_navbar/stackedbottom_navbar/stackedbottom_view.dart';
import '../presentation/view/lottery_ticket/choose_number/choose_number_view.dart';
import '../presentation/view/lottery_ticket/payment/payment_view.dart';
import '../presentation/view/lottery_ticket/result/result_view.dart';
import '../presentation/view/lottery_ticket/see_result/see_result_view.dart';
import '../presentation/view/profile/profile_view.dart';

class Routes {
  static const String stackedBottomNavView = '/';
  static const String chooseNumberView = '/choose-number-view';
  static const String paymentView = '/payment-view';
  static const String seeResultView = '/see-result-view';
  static const String yourResultView = '/your-result-view';
  static const String homeView = '/home-view';
  static const String profileView = '/profile-view';
  static const all = <String>{
    stackedBottomNavView,
    chooseNumberView,
    paymentView,
    seeResultView,
    yourResultView,
    homeView,
    profileView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.stackedBottomNavView, page: StackedBottomNavView),
    RouteDef(Routes.chooseNumberView, page: ChooseNumberView),
    RouteDef(Routes.paymentView, page: PaymentView),
    RouteDef(Routes.seeResultView, page: SeeResultView),
    RouteDef(Routes.yourResultView, page: YourResultView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.profileView, page: ProfileView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StackedBottomNavView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StackedBottomNavView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    ChooseNumberView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChooseNumberView(),
        settings: data,
      );
    },
    PaymentView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentView(),
        settings: data,
      );
    },
    SeeResultView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SeeResultView(),
        settings: data,
      );
    },
    YourResultView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => YourResultView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
  };
}
