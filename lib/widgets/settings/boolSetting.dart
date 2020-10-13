import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/widgets/settings/boolCubit.dart';

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

class BoolSetting<T extends BoolCubit> extends StatelessWidget {
  final String name;

  BoolSetting({Key key, this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.bloc<T>();
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
          // Kapcsoló
          BlocBuilder<T, bool>(builder: (context, snapshot) {
            return CupertinoSwitch(
              onChanged: (bool value) {
                cubit.value(value);
              },
              value: snapshot,
            );
          }),
          Divider(
            thickness: 1.5,
            color: letterColor,
          ),
        ],
      ),
    );
  }
}
