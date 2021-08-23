import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';


import '../presentation/view/profile/profile_view.dart';
import '../presentation/view/home/home_view.dart';
import '../presentation/view/lottery_ticket/choose_number/choose_number_view.dart';
import '../presentation/view/lottery_ticket/payment/payment_view.dart';
import '../presentation/view/lottery_ticket/result/result_view.dart';
import '../presentation/view/lottery_ticket/see_result/see_result_view.dart';

import '../presentation/view/home_navbar/stackedbottom_navbar/stackedbottom_view.dart';


@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    CustomRoute(page: StackedBottomNavView, initial: true,transitionsBuilder: TransitionsBuilders.fadeIn),


    //LOTTERY
    MaterialRoute(page: ChooseNumberView,),
    MaterialRoute(page: PaymentView,),
    MaterialRoute(page: SeeResultView,),
    MaterialRoute(page: YourResultView,),


    MaterialRoute(page: HomeView,),

    MaterialRoute(page: ProfileView,),



  ],
)

class $AppRouter {}