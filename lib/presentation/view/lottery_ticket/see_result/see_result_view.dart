import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/appbar_custom.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/background_stack.dart';
import 'package:stacked/stacked.dart';

import 'see_result_viewmodel.dart';
import '../../../../utilities/statusbar_util.dart';

class SeeResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<SeeResultViewModel>.reactive(
      viewModelBuilder: () => SeeResultViewModel(),
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
                        AppBarCustom(pageName: 'See Result',),

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
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [

                                        //Jackpot Select
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.surface,
                                            borderRadius:
                                            BorderRadius.circular(40.00),
                                            border: Border.all(
                                              width: 1.0,
                                              color: Theme.of(context).colorScheme.primaryVariant,
                                            ),
                                          ),

                                          child:
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset('assets/icons/wheel.svg',color: Theme.of(context).colorScheme.onSurface, height: 15,width: 15,),

                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Jackpots',
                                                    style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.onSurface),
                                                  ),
                                                ),
                                              ),

                                              SvgPicture.asset('assets/icons/drop-arrow.svg',color: Theme.of(context).colorScheme.onSurface, height: 7,width: 7,),

                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        //Date Select
                                        Container(
                                          height: 50,
                                          padding: EdgeInsets.symmetric(horizontal: 20,),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.surface,
                                            borderRadius:
                                            BorderRadius.circular(40.00),
                                            border: Border.all(
                                              width: 1.0,
                                              color: Theme.of(context).colorScheme.primaryVariant,
                                            ),
                                          ),

                                          child:
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset('assets/icons/calendar-black.svg',color: Theme.of(context).colorScheme.onSurface, height: 15,width: 15,),

                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    '30 MAY 2021',
                                                    style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.onSurface),
                                                  ),
                                                ),
                                              ),

                                              SvgPicture.asset('assets/icons/calendar.svg',color: Theme.of(context).colorScheme.onSurface, height: 15,width: 15,),

                                            ],
                                          ),
                                        ),

                                        //Number Select
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20,),
                                              Text(
                                                'Enter your number',
                                                style: Theme.of(context).textTheme.bodyText2.apply(color: Theme.of(context).colorScheme.onError),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    NumberSelectPreview(number: '23',),
                                                    NumberSelectPreview(number: '56',),
                                                    NumberSelectPreview(number: '05',),
                                                    NumberSelectPreview(number: '17',),
                                                    NumberSelectPreview(number: '99',),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 30,),

                                        //BUTTON
                                        SizedBox(
                                          width: size.width,
                                          child: RawMaterialButton(
                                            onPressed: (){
                                              model.navigateToYourResult();
                                            },
                                            elevation: 0,
                                            padding: EdgeInsets.symmetric(vertical: 15),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                            fillColor: Theme.of(context).colorScheme.primary,
                                            focusElevation: 0,
                                            hoverElevation: 0,
                                            highlightElevation: 0,
                                            child: Text('See Result', style: Theme.of(context).textTheme.button,),
                                          ),
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

class NumberSelectPreview extends StatelessWidget {
  final String number;
  const NumberSelectPreview({
    Key key,
    this.number
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          width: 1.0,
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
      ),
      child: Center(child: Text(
        '$number',
        style: Theme.of(context).textTheme.bodyText1.apply(
            color: Theme.of(context).colorScheme.onSurface
        ),)),
    );
  }
}

