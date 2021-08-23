import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import '../../../utilities/statusbar_util.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewViewModel>.reactive(
      viewModelBuilder: () => HomeViewViewModel(),
      builder: (context, model, child) =>
          StatusBarUtil.setStatusBarColorUtil(context,
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: SafeArea(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Container(

                  ),
                ),
              ),
            ),
          ),
    );
  }
}

