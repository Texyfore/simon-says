import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PauseMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow_rounded,
                    color: letterColor,
                    size: 28.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Folytatás',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: letterColor,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(
              onPressed: () {
                // TODO: Exit on exit button press
                Navigator.popUntil(context,  ModalRoute.withName('/home'));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.clear_rounded,
                    color: letterColor,
                    size: 28.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Kilépés',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: letterColor,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);