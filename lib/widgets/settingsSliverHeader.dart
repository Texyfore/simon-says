import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsSliverHeader extends StatelessWidget {

  final String title;
  final EdgeInsetsGeometry padding;

  SettingsSliverHeader({this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(title, padding),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate{

  final String title;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  Delegate(this.title, this.padding);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Container(
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            Divider(
              thickness: 1.5,
              color: letterColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  color: letterColor,
                ),
              ),

            ),
            Divider(
              thickness: 1.5,
              color: letterColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }}