class MenuItem {
  final String text;
  final bool isHovered;

  const MenuItem(this.text, {this.isHovered = false});

  MenuItem copyWith({bool? isHovered}) {
    return MenuItem(text, isHovered: isHovered ?? this.isHovered);
  }
}