import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';


import '../../profile/profile_view.dart';
import '../../lottery_ticket/lottery_ticket_view.dart';
import '../../home/home_view.dart';
import 'stackedbottom_viewmodel.dart';


class StackedBottomNavView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return ViewModelBuilder<StackedBottomNavViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),

        bottomNavigationBar: Stack(
          children: [

            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),

            SvgPicture.asset('assets/icons/Path 16.svg', width: size.width, height: 80, fit: BoxFit.fill,),

            Positioned(
              bottom: 0,
              child: Container(
                height: 65,
                width: size.width,
                padding: EdgeInsets.only(left: 85.0,right: 85.0),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,//Theme.of(context).colorScheme.primary.,
                  currentIndex: model.currentIndex,
                  onTap: model.setIndex,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  iconSize: 20,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/1-lottery.svg',height: 35,width: 35),
                      activeIcon: SvgPicture.asset('assets/icons/2-lottery.svg',height: 35,width: 35),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/1-home.svg',height: 35,width: 35),
                      activeIcon: SvgPicture.asset('assets/icons/2-home.svg',height: 35,width: 35),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset('assets/icons/1-profile.svg',height: 35,width: 35),
                        activeIcon: SvgPicture.asset('assets/icons/2-profile.svg',height: 35,width: 35),
                      label: ''
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => StackedBottomNavViewModel(),
    );
  }
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return LotteryTicketView();
    case 1:
      return HomeView();
    case 2:
      return ProfileView();
    default:
      return LotteryTicketView();
  }
}