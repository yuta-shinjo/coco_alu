import 'package:flutter/material.dart';
import 'package:my_collection/themes/app_colors.dart';

TextTheme _getTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

class Headline6Text extends StatelessWidget {
  const Headline6Text(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).headline6?.copyWith(color: color),
      ),
    );
  }
}

class Subtitle1Text extends StatelessWidget {
  const Subtitle1Text(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).subtitle1?.copyWith(color: color),
      ),
    );
  }
}

class Subtitle2Text extends StatelessWidget {
  const Subtitle2Text(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).subtitle2?.copyWith(color: color),
      ),
    );
  }
}

class BodyText1Text extends StatelessWidget {
  const BodyText1Text(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).bodyText1?.copyWith(color: color),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
