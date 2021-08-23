
import 'package:flutter/material.dart';

class LotteryTile extends StatelessWidget {
  final Function playNowFunction;

  const LotteryTile({
    Key key,
    this.playNowFunction
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
      child: Row(
        children: [

          //Logo
          Container(
            width: 58,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/lottery-logo.png', width: 50, fit: BoxFit.contain,),
                ),
              ],
            ),
          ),

          //Text Column
          Expanded(
            child: Container(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Super Ball',
                    style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.onError),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    'Jackpot',
                    style: Theme.of(context).textTheme.subtitle2.apply(color: Theme.of(context).colorScheme.onBackground),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    '\$ 495 000 000',
                    style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.primary),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),

          //Flag and Text
          Container(
            width: 95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      height: 35,
                      width: 60,
                      child: Image.asset('assets/images/national_flags/mexico-flag-country-nation-union-empire-33133.png', fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Text(
                  'Next Draw',
                  style: Theme.of(context).textTheme.overline.apply(color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  '08:56:68:78',
                  style: Theme.of(context).textTheme.subtitle2.apply(color: Theme.of(context).colorScheme.onError),
                ),
              ],
            ),
          ),

          //Play Now Button
          Container(
            child: Center(
              child: InkWell(
                onTap: (){
                  playNowFunction();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Text(
                    'Play now',
                    style: Theme.of(context).textTheme.subtitle2.apply(color: Theme.of(context).colorScheme.background),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

