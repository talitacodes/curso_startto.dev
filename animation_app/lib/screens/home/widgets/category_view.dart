import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> categories = ["Trabalho", "Estudos", "Casa"];

  int _category = 0;

  void selectForward() {
    setState(() {
      _category++;
    });
  }

  void selectBackward() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _category > 0 ? selectBackward : null,
          icon: Icon(
            Icons.arrow_back_ios,
            color: _category > 0 ? Colors.white : Colors.white30,
          ),
        ),
        Text(
          categories[_category].toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: _category < categories.length - 1 ? selectForward : null,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: _category < categories.length - 1
                ? Colors.white
                : Colors.white30,
          ),
        ),
      ],
    );
  }
}
