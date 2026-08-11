import 'package:flutter/material.dart';
import 'package:clubhouse/widgets/image_error_widget.dart';

class UserProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Border? border;

  const UserProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 48,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border ??
            Border.all(
              color: isDark ? Colors.white24 : Colors.grey.shade300,
              width: 1.5,
            ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const ImageErrorWidget();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}