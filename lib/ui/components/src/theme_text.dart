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

class CardText extends StatelessWidget {
  const CardText(
    this.text, {
    Key? key,
    this.bottomPadding = 2,
  }) : super(key: key);

  final String? text;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class OverlineText extends StatelessWidget {
  const OverlineText(
    this.text, {
    Key? key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 1,
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
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: _getTheme(context).overline?.copyWith(color: color),
      ),
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText(
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
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}


