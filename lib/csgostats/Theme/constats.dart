import 'package:csgostats/csgostats/Theme/app_colors.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  hintStyle: textStyle,
);

const textStyle = TextStyle(
  fontSize: 16,
  color: AppColors.textColor,
);
const divider = Divider(
  color: Color.fromRGBO(73, 88, 103, 0.45),
  thickness: 2,
);

final ButtonStyle signupStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Play',
  ),
  backgroundColor: AppColors.mainDarkBlue,
  foregroundColor: AppColors.textColor,
);

final ButtonStyle deleteAccountStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Play',
  ),
  backgroundColor: Colors.red,
  foregroundColor: AppColors.textColor,
);

final ButtonStyle seeMyDetailedInformation = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Play',
  ),
  backgroundColor: AppColors.barColor,
  foregroundColor: Colors.white,
);

final ButtonStyle clientProfileButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color.fromRGBO(45, 56, 68, 1),
  side: BorderSide(
    width: 1,
    color: Colors.black.withOpacity(0.3),
  ),
);

const listDefaultTextStyle = TextStyle(
  fontFamily: 'Play',
  fontSize: 16,
  color: Colors.white,
);

const listDefaultHeaderStyle = TextStyle(
  fontFamily: 'Play',
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final newsViewsStyle = TextStyle(
  fontFamily: 'Play',
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white.withOpacity(0.5),
);

const newsTextStyle = TextStyle(
  fontFamily: 'Play',
  fontSize: 18,
  color: Colors.white,
);
