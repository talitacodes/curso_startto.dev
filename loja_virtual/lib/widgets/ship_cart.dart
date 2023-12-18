import 'package:flutter/material.dart';

class ShipCart extends StatelessWidget {
  const ShipCart({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        iconColor: primaryColor,
        title: Text(
          "Calcular frete",
          textAlign: TextAlign.start,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
        ),
        leading: const Icon(Icons.location_on),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: primaryColor,
                border: const OutlineInputBorder(),
                hintText: "Digite seu CEP",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
              ),
              initialValue: "",
              onFieldSubmitted: (text) {},
            ),
          ),
        ],
      ),
    );
  }
}
