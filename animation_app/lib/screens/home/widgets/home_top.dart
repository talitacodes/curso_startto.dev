import 'package:animation_app/screens/home/widgets/category_view.dart';
import 'package:flutter/material.dart';

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;
  const HomeTop({required this.containerGrow, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Bem-vinda",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            width: containerGrow.value * 120,
            height: containerGrow.value * 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("images/perfil.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: containerGrow.value * 35,
              height: containerGrow.value * 35,
              margin: const EdgeInsets.only(left: 80),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1.0)),
              alignment: Alignment.center,
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: containerGrow.value * 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const CategoryView()
        ],
      )),
    );
  }
}
