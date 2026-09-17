import 'package:flutter/material.dart';

import '../utilis/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: TextField(
        expands: true,
        maxLines: null,
        minLines: null,
        keyboardType: TextInputType.text,
        cursorColor: const Color(0xFFF121223),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
          ),
          hintText: 'Search dishes, restaurants',
          hintStyle: TextStyles.bold14.copyWith(
            color: const Color(0xFF676767),
          ),
          filled: true,
          fillColor: Color(0xffF6F6F6),
          enabledBorder: buildBorder(),
          border: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Color(0xffF6F6F6),
      ),
    );
  }
}