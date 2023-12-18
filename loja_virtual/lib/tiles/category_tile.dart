import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const CategoryTile(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return ListTile(
      leading: CircleAvatar(
        foregroundColor: primaryColor,
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.get("icon")),
        child: Container(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: primaryColor, // Cor da borda
            width: 1, // Largura da borda
          ),
        )),
      ),
      title: Text(
        snapshot.get("title"),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Theme.of(context).primaryColor),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(snapshot)));
      },
    );
  }
}
