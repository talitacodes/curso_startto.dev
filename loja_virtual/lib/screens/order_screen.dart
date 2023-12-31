import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final String orderId;
  const OrderScreen(this.orderId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido realizado"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80.0,
            ),
            const Text(
              "Pedido realizado com sucesso!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text(
              "Código do pedido: $orderId",
              style: const TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
