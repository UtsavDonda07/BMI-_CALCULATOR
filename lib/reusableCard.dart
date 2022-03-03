import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  Color? cardcolor;
  Widget? childCard;
  ReusableCard({Color? this.cardcolor, Widget? this.childCard}) {
    // this.cardcolor=c;
    // this.childCard=w;
  }

//final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: childCard,
      decoration: BoxDecoration(
        color: cardcolor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
