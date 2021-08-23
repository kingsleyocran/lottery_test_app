import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/appbar_custom.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/background_stack.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/number_preview.dart';
import 'package:lottery_test_app/presentation/widgets/custom_widgets/number_select_chip.dart';
import 'package:stacked/stacked.dart';

import 'choose_number_viewmodel.dart';
import '../../../../utilities/statusbar_util.dart';

class ChooseNumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<ChooseNumberViewModel>.reactive(
      viewModelBuilder: () => ChooseNumberViewModel(),
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
                        AppBarCustom(pageName: 'Choose Number',),

                        SizedBox(height: 10,),

                        //PAGE HEADER
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                          width: size.width,
                          //height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Choose',
                                style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.background),
                              ),

                              Text(
                                '5 numbers',
                                style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.background),
                              ),

                              Container(
                                width: size.width,
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    NumberPreview(number: '76',),
                                    NumberPreview(number: '25',),
                                    NumberPreview(number: '09',),
                                    NumberPreview(number: '16',),
                                    NumberPreview(number: '07',),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),

                        //NUMBER SELECTION AREA
                        Expanded(
                          child: Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('12:00 PM', style: Theme.of(context).textTheme.bodyText2.apply(color: Theme.of(context).colorScheme.onError),),

                                        Container(
                                          child: Row(
                                            children: [
                                              Text('Single', style: Theme.of(context).textTheme.subtitle1.apply(color: Theme.of(context).colorScheme.onBackground),),
                                              SizedBox(width: 5,),
                                              SvgPicture.asset('assets/icons/drop-arrow.svg',color: Theme.of(context).colorScheme.onBackground, height: 6,width: 6,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //SELECT NUMBER
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                                        child: GridView.count(
                                            scrollDirection: Axis.vertical,
                                            physics: NeverScrollableScrollPhysics(),
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 6,
                                            childAspectRatio: (1 / 1),
                                            shrinkWrap: true,
                                            children:  List.generate(99, (index) {
                                              return
                                               NumberSelectChip(
                                                number: index+1,
                                                 selectFunction: (){

                                                 },
                                              );
                                            }),
                                          ),
                                      ),
                                    ),
                                  ),

                                  //BUTTON
                                  Container(
                                    height: 80,
                                    child: Center(
                                      child: RawMaterialButton(
                                        onPressed: (){
                                          model.navigateToPayment();
                                        },
                                        elevation: 0,
                                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                        fillColor: Theme.of(context).colorScheme.primary,
                                        focusElevation: 0,
                                        hoverElevation: 0,
                                        highlightElevation: 0,
                                        child: Text('Make a Payment', style: Theme.of(context).textTheme.button,),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
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

