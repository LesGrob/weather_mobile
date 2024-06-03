part of '/weather_ui_core.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  static const Size minSize = Size.fromHeight(79);

  final String label;
  final double? width;
  final EdgeInsetsGeometry margin;

  final TextEditingController? controller;
  final T? initialSelection;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?)? onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.label,
    this.width,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.controller,
    this.initialSelection,
    required this.dropdownMenuEntries,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme.of(context);
    final blockWidth =
        (width ?? MediaQuery.of(context).size.width) - margin.horizontal;
    return Padding(
      padding: margin,
      child: DropdownMenu<T>(
        controller: controller,
        enableFilter: true,
        requestFocusOnTap: true,
        width: blockWidth,
        menuHeight: minSize.height * 3,
        label: Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.text,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          fillColor: theme.colorScheme.background,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.textLight,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.text,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.textLight,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.text,
            ),
          ),
          labelStyle: TextStyle(
            color: theme.colorScheme.text,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            color: theme.colorScheme.textLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onSelected: onSelected,
        dropdownMenuEntries: dropdownMenuEntries,
      ),
    );
  }
}
