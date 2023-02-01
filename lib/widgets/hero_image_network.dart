import 'package:flutter/material.dart';

class HeroImageNetwork extends StatelessWidget {
  const HeroImageNetwork({
    super.key,
    required this.url,
    required this.idHero,
    this.width,
    this.height,
  });

  final String url;
  final String idHero;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: idHero,
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/loading.gif'),
        image: NetworkImage(url),
        width: width,
        height: height,
      ),
    );
  }
}
