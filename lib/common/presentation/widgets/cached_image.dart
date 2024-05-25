import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_image_preloader.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Border? border;

  const CachedImage({
    this.imageUrl = '',
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        border: border,
      ),
      child: imageUrl.isEmpty
          ? null
          : ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: width,
                height: height,
                color: color,
                fit: fit,
                placeholder: (context, url) => const ImagePreloadShimmer(),
                errorWidget: (context, url, error) => const ImagePreloadShimmer(),
              ),
            ),
    );
  }
}
