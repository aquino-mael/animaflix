import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

const double kBorderRadius = 30.0;

class SearchBar extends StatelessWidget {
  final Color backgroundColor;
  final void Function(String)? onChanged;

  const SearchBar({
    Key? key,
    this.backgroundColor: Colors.black54,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          hintText: "Pesquise seu anime...",
          hintStyle: TextStyle(
            color: Colors.grey
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide(
              color: AppColors.primaryColor
            )
          ),
        ),
      ),
    );
  }
}
