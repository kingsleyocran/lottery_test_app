import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/appbar_custom.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/background_stack.dart';
import 'package:stacked/stacked.dart';

import 'payment_viewmodel.dart';
import '../../../../utilities/statusbar_util.dart';

class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<PaymentViewModel>.reactive(
      viewModelBuilder: () => PaymentViewModel(),
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
                        AppBarCustom(pageName: 'Payment',),

                        Expanded(
                            child:
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                              child: Column(
                                children: [
                                  //TIME
                                  Container(
                                    width: size.width,
                                    height: 70,
                                    child: Center(
                                      child: Text(
                                        '12:00 PM',
                                        style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.background),
                                      ),
                                    ),

                                  ),

                                  //CARD AREA
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.background,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Selected Numbers',
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onBackground),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '12, 23, 44, 65, 78',
                                          style: Theme.of(context).textTheme.headline4.apply(color: Theme.of(context).colorScheme.onError),
                                        ),
                                        SizedBox(height: 30,),


                                        Text(
                                          'Number of Draws',
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onBackground),
                                        ),
                                        SizedBox(height: 20,),
                                        //Number Row
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 7),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),
                                                child: Center(child: Text(
                                                  '1',
                                                  style: Theme.of(context).textTheme.headline5.apply(
                                                      color: Theme.of(context).colorScheme.background

                                                  ),)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 7),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),
                                                child: Center(child: Text(
                                                  '2',
                                                  style: Theme.of(context).textTheme.headline5.apply(
                                                      color: Theme.of(context).colorScheme.background

                                                  ),)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 7),
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),
                                                child: Center(child: Text(
                                                  '3',
                                                  style: Theme.of(context).textTheme.headline5.apply(
                                                      color: Theme.of(context).colorScheme.background

                                                  ),)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 30,),


                                        Text(
                                          'Possible Winners',
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onBackground),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '\$100 - \$1200',
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onError),
                                        ),

                                      ],
                                    ),
                                  ),

                                  //BUTTON AND TOTAL
                                  Container(
                                    width: size.width,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 30,),
                                        Text(
                                          'Total: \$10',
                                          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.background),
                                        ),
                                        SizedBox(height: 20,),
                                        RawMaterialButton(
                                          onPressed: (){
                                            model.navigateToSeeResult();
                                          },
                                          elevation: 0,
                                          focusElevation: 0,
                                          hoverElevation: 0,
                                          highlightElevation: 0,
                                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                          fillColor: Theme.of(context).colorScheme.background,
                                          child: Text('Payment Now', style: Theme.of(context).textTheme.button.apply(color: Theme.of(context).colorScheme.primary),),
                                        ),
                                      ],
                                    ),

                                  ),
                                ],
                              ),
                            )),

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
