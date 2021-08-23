
import 'package:flutter/material.dart';


class NumberPreview extends StatelessWidget {
  final String number;

  const NumberPreview({
    Key key,
    this.number
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14,vertical: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.0),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Center(
        child: Text(
          '$number',
          style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
