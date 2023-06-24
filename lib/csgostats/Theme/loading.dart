import 'package:csgostats/csgostats/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(27, 31, 35, 1),
      child: const Center(
        child: SpinKitFadingCircle(color: AppColors.mainDarkBlue, size: 50.0),
      ),
    );
  }
}
