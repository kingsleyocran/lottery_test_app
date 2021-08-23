import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';
import '../../../utilities/statusbar_util.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) =>
          StatusBarUtil.setStatusBarColorUtil(context,
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
    );
  }
}

