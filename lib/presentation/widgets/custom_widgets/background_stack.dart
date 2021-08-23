

import 'package:flutter/material.dart';


class BackgroundStack extends StatelessWidget {

  const BackgroundStack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: Image.asset('assets/images/background-image.png', fit: BoxFit.cover,),
        ),
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.92),
        ),
      ],
    );
  }
}
