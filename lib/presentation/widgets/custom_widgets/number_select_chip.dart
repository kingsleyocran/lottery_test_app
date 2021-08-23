
import 'package:flutter/material.dart';

class NumberSelectChip extends StatefulWidget {
  final Function selectFunction;
  final int number;

  const NumberSelectChip({
    Key key,
    this.selectFunction,
    this.number
  }) : super(key: key);

  @override
  _NumberSelectChipState createState() => _NumberSelectChipState();
}
class _NumberSelectChipState extends State<NumberSelectChip> {
  bool isSelected;

  @override
  void initState() {
    setState(() {
      isSelected = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          if(isSelected){
            isSelected = false;
          }
          else {
            isSelected = true;
          }
        });
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (isSelected) ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
          border: Border.all(
            width: 1.0,
            color: (isSelected) ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Center(child: Text(
          '${widget.number}',
          style: Theme.of(context).textTheme.bodyText2.apply(

              color: (isSelected)
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.onError
          ),)),
      ),
    );
  }
}

