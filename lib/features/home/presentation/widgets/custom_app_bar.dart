import 'package:flutter/material.dart';
import 'package:interview/core/utils/app_colors.dart';
import 'package:interview/core/utils/app_text_style.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearchPressed;
  final String title;
  final bool isSearch;
  final bool isArrow;
  const CustomAppBar({
    super.key,
    required this.onSearchPressed,
    required this.title,
    required this.isSearch,
    required this.isArrow,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
                  style: CustomTextStyles.saira700style32.copyWith(
                    color: AppColors.grey,
                    fontSize: 20,
                     )

      ),
      centerTitle: true,
      actions: [
        if (isSearch==true)
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
            ),
            child: IconButton(
              icon: Icon(Icons.search, size: 30),
              onPressed: onSearchPressed,
            ),
          )
      ],
      leading:
          isArrow==false
              ? null
              : Container(
                margin: const EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: AppColors.secondColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
