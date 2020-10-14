import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/speedCubit.dart';

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

class SpeedSetting extends StatelessWidget {
  final String name;

  SpeedSetting({Key key, this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.bloc<SpeedCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                cubit.decrease();
              },
              color: backgroundColor,
              splashRadius: 20.0,
              enableFeedback: true,
              splashColor: Colors.white,
            ),
            // Szám
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 100,
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child:
                      BlocBuilder<SpeedCubit, Speed>(builder: (context, speed) {
                    return Text(
                      '${speed_to_string(speed)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: letterColor,
                      ),
                    );
                  }),
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
                cubit.increase();
              },
              color: backgroundColor,
              splashRadius: 20.0,
              enableFeedback: true,
              splashColor: Colors.white,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Divider(
            thickness: 1.5,
            color: letterColor,
          ),
        ),
      ],
    );
  }
}
