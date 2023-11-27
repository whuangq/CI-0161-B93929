import 'package:flutter/material.dart';

class CustomLikeButton extends StatelessWidget {

  final void Function()? onTap;
  final bool isLiked;

  const CustomLikeButton({
    super.key,
    required this.onTap,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? colors.primary : colors.secondaryContainer,
          ),
        )
      ],
    );
  }
}