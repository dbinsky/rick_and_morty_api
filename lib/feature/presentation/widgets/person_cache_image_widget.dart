import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonCacheImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double imageWidth, imageHight;

  const PersonCacheImageWidget({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHight,
  });

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: imageWidth,
      height: imageHight,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return _imageWidget(const AssetImage('assets/images/noimage.jpg'));
      },
    );
  }
}
