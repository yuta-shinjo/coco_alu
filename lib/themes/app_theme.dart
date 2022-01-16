import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData theme(BuildContext context) => ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      backgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      fontFamily: 'NotoSerifJP',
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
        ),
      ),
    );
