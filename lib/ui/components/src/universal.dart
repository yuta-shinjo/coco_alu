import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UniversalImage extends StatelessWidget {
  const UniversalImage(this.src, {Key? key, BoxFit? fit})
      : fit = fit ?? BoxFit.contain,
        super(key: key);

  final String src;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (src.contains('.svg')) {
      if (src.contains(RegExp('^http|^https'))) {
        return SvgPicture.network(src, fit: fit);
      } else {
        return SvgPicture.asset(src);
      }
    } else {
      if (src.contains(RegExp('^http|^https'))) {
        return CachedNetworkImage(imageUrl: src, fit: fit);
      } else {
        return Image.asset(src, fit: fit);
      }
    }
  }

  static ImageProvider imageProvider(String src) {
    if (src.contains(RegExp('^http|^https'))) {
      return NetworkImage(src);
    } else {
      return AssetImage(src);
    }
  }
}
