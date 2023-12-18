import 'package:animation_app/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// class LogoApp extends StatefulWidget {
//   const LogoApp({super.key});

//   @override
//   State<LogoApp> createState() => _LogoAppState();
// }

// class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));

//     animation = CurvedAnimation(parent: controller, curve: Curves.decelerate)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       });
//     controller.forward();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GrowTransition(const LogoWidget(), animation);
//   }
// }

// class AnimatedLogo extends AnimatedWidget {
//   final Animation<double> animation;
//   const AnimatedLogo(this.animation, {super.key})
//       : super(listenable: animation);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: animation.value,
//         width: animation.value,
//         child: const FlutterLogo(),
//       ),
//     );
//   }
// }

// class LogoWidget extends StatelessWidget {
//   const LogoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const FlutterLogo();
//   }
// }

// class GrowTransition extends StatelessWidget {
//   final Widget child;
//   final Animation<double> animation;

//   final sizeTween = Tween<double>(begin: 0, end: 300);
//   final opacityTween = Tween<double>(begin: 0.1, end: 1);

//   GrowTransition(this.child, this.animation, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return Opacity(
//             opacity: opacityTween.evaluate(animation),
//             child: SizedBox(
//               height: sizeTween.evaluate(animation),
//               width: sizeTween.evaluate(animation),
//               child: child,
//             ),
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }
