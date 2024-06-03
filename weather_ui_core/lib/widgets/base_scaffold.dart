part of '/weather_ui_core.dart';

class BaseScaffold extends StatelessWidget {
  final Key? scaffoldKey;

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? endDrawer;

  final Color? backgroundColor;

  final bool topSafeArea;
  final bool bottomSafeArea;
  final bool extendBodyBehindAppBar;

  const BaseScaffold({
    super.key,
    this.scaffoldKey,
    this.body,
    this.endDrawer,
    this.backgroundColor,
    this.appBar,
    this.topSafeArea = true,
    this.bottomSafeArea = false,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.systemUiOverlayStyle,
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        endDrawer: endDrawer,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: backgroundColor,
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SafeArea(
            top: topSafeArea,
            bottom: bottomSafeArea,
            child: body ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
