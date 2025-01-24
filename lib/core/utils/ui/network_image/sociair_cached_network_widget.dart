import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SociairCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;

  const SociairCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      cacheKey: imageUrl,
      imageUrl: imageUrl,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) =>
              Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: placeholder ??
          (BuildContext context, String url) =>
              const CircularProgressIndicator(),
      errorWidget: errorWidget ??
          (BuildContext context, String url, Object error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
    );
  }
}
