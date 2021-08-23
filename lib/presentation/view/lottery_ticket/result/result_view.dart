import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'result_viewmodel.dart';
import '../../../../utilities/statusbar_util.dart';
import '../../../../presentation/widgets/custom_widgets/appbar_custom.dart';
import '../../../../presentation/widgets/custom_widgets/background_stack.dart';

class YourResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<YourResultViewModel>.reactive(
      viewModelBuilder: () => YourResultViewModel(),
      builder: (context, model, child) =>
          StatusBarUtil.setStatusBarColorUtil(context,
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Stack(
                children: [
                  //Background image and Overlay
                  BackgroundStack(),

                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //APP BAR
                        AppBarCustom(pageName: 'Your Result',),

                        Expanded(
                            child:
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  //CARD AREA
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.background,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Text(
                                          'Congratulations! You are a big winner.',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onError),
                                        ),

                                        SizedBox(height: 20,),

                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                          width: size.width,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.primary,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),

                                        SizedBox(height: 20,),

                                        Text(
                                          'You get \$2500.00',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onError),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        SizedBox(height: 50,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

