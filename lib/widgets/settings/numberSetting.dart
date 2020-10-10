import 'package:flutter/material.dart';
import 'package:simon_says/widgets/settings/numberCubit.dart';

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

class NumberSetting<T extends NumberCubit> extends StatelessWidget {
  final String name;

  T cubit;

  NumberSetting({
    Key key,
    this.name = "",
    @required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Beállítás név
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 26.0,
              color: letterColor,
            ),
          ),
          // Számláló
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mínusz gomb
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: letterColor,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    Icons.remove_rounded,
                  ),
                ),
                onPressed: () {
                  this.cubit.decrease();
                },
                color: backgroundColor,
                splashRadius: 20.0,
                enableFeedback: true,
                splashColor: Colors.white,
              ),
              // Szám
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '6',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 26.0,
                    color: letterColor,
                  ),
                ),
              ),
              // Plusz gomb
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: letterColor,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Icon(
                    Icons.add_rounded,
                  ),
                ),
                onPressed: () {
                  this.cubit.increase();
                },
                color: backgroundColor,
                splashRadius: 20.0,
                enableFeedback: true,
                splashColor: Colors.white,
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
            color: letterColor,
          ),
        ],
      ),
    );
  }
}
