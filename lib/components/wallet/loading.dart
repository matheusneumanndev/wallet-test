import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Sua transação está sendo processada',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.0),
            SpinKitWanderingCubes(color: Color(0xff1a0441)),
          ],
        ),
      ),
    );
  }
}
