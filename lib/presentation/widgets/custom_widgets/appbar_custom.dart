
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottery_test_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBarCustom extends StatelessWidget {
  final String pageName;

  AppBarCustom({
    Key key,
    this.pageName,
  }) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();
  NavigationService get getNavigator => _navigationService;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      margin: EdgeInsets.only(top: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(left: size.width * 0.02),
            height: 47,
            width: 47,
            child: RawMaterialButton(
              onPressed: () {
                getNavigator.back();
              },
              shape: CircleBorder(),
              child: SvgPicture.asset(
                'assets/icons/back-arrow.svg',
                color: Theme.of(context).colorScheme.background,
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              padding: EdgeInsets.all(16.0),
              //fillColor: ViellyThemeColor_whiteBack,
              elevation: 0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              '$pageName',
              style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.background),
            ),
          ), //Page Header Text

        ],
      ),
    );
  }
}

