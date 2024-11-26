import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/resources.g.dart';

abstract class SvgObjects {
  static void init() {
    final pics = <String>[
      R.ASSETS_SVG_RU_SVG,
      R.ASSETS_SVG_UK_SVG,
    ];
    for (final String p in pics) {
      final loader = SvgAssetLoader(p);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}

class SvgRu extends StatelessWidget {
  const SvgRu({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      R.ASSETS_SVG_RU_SVG,
      fit: BoxFit.fill,
    );
  }
}

class SvgUk extends StatelessWidget {
  const SvgUk({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      R.ASSETS_SVG_UK_SVG,
      fit: BoxFit.fill,
    );
  }
}
