import 'package:flutter/material.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class SplashScreen extends StatefulWidget {
  static Duration animationDuration = const Duration(milliseconds: 1500);

  final AppTheme themeProvider;
  const SplashScreen({super.key, required this.themeProvider});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: SplashScreen.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KeepStuff Partner',
      localizationsDelegates: AppLocalization.localizationsDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      theme: widget.themeProvider.materialAppTheme,
      home: Scaffold(
        backgroundColor: widget.themeProvider.colorScheme.background,
        body: _LogoWidget(listenable: _animation),
      ),
    );
  }
}

class _LogoWidget extends AnimatedWidget {
  const _LogoWidget({required super.listenable});

  double _calculateSize(BuildContext context) {
    final animation = listenable as Animation<double>;
    final size = MediaQuery.of(context).size.shortestSide * 4 / 5;
    final tween = Tween<double>(begin: size, end: size - 20);
    return tween.evaluate(animation);
  }

  @override
  Widget build(BuildContext context) {
    final size = _calculateSize(context);
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(AppImages.splashLogo),
      ),
    );
  }
}
