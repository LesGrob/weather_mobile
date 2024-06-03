part of '/weather_ui_core.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final PreferredSizeWidget? bottom;
  double get _bottomHeight => bottom?.preferredSize.height ?? 0;

  static const double height = 56.0;

  const BaseAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(BaseAppBar.height + _bottomHeight);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme.of(context);
    return Container(
      height: MediaQuery.of(context).padding.top +
          BaseAppBar.height +
          _bottomHeight,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: BaseAppBar.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.text,
                ),
              ),
            ),
          ),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }
}
