import 'package:firebase_app/presentation/widgets.dart';
import 'package:flutter/material.dart';

class CustomPost extends StatefulWidget {

  final String user;
  final String message;

  const CustomPost({
    super.key,
    required this.user,
    required this.message,
  });

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {

  bool isLiked = false;

  void toggleLike() {
    isLiked = !isLiked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      decoration: BoxDecoration(
        color: colors.secondaryContainer.withAlpha(50),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: colors.secondaryContainer,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.person,
              color: colors.onPrimary,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user,
                  style: TextStyle(
                    color: colors.primary.withAlpha(200)
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.message,
                  style: TextStyle(
                    color: colors.secondary
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
          CustomLikeButton(
            onTap: () => toggleLike(),
            isLiked: isLiked,
          ),
        ],
      ),
    );
  }
}