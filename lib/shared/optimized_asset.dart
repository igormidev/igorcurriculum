import 'package:flutter/material.dart';

class OptimizedAsset extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit? fit;

  const OptimizedAsset({
    super.key,
    required this.assetName,
    required this.width,
    required this.height,
    required this.cacheWidth,
    required this.cacheHeight,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        assetName,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
