import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  const DrawerTile(this.icon, this.text, this.controller, this.page,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          },
          child: SizedBox(
              height: 60.0,
              child: Row(
                children: [
                  Icon(icon,
                      size: 32.0,
                      color: controller.page?.round() == page
                          ? Colors.white
                          : Theme.of(context).primaryColor),
                  const SizedBox(width: 32.0),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: controller.page?.round() == page
                            ? Colors.white
                            : Theme.of(context).primaryColor),
                  ),
                ],
              )),
        ));
  }
}
