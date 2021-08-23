import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'lottery_ticket_viewmodel.dart';
import '../../../utilities/statusbar_util.dart';
import '../../../../presentation/widgets/custom_widgets/background_stack.dart';
import '../../../../presentation/widgets/custom_widgets/lottery_tile.dart';

class LotteryTicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<LotteryTicketViewModel>.reactive(
      viewModelBuilder: () => LotteryTicketViewModel(),
      builder: (context, model, child) =>
          StatusBarUtil.setStatusBarColorUtil(context,
            Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Stack(
                children: [
                  BackgroundStack(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      //PAGE HEADER
                      SafeArea(
                        bottom: false,
                        child: Container(
                          width: size.width,
                          height: 90,
                          child: Center(
                            child: Text(
                              'Lottery Ticket',
                              style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.background),
                            ),
                          ),

                        ),
                      ),

                      //LOTTERY AREA
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
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListView.separated(
                                    key: PageStorageKey('storage-key'),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    separatorBuilder: (BuildContext context, int index) => Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.045,
                                      ),
                                      child: Divider(
                                        color: Theme.of(context).colorScheme.surface,
                                        height: 5,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                    ),
                                    itemBuilder: (context, index) {
                                      return LotteryTile(
                                        playNowFunction: (){
                                          model.navigateToChooseNumber();
                                        },
                                      );
                                    },
                                  ),

                                ],
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

