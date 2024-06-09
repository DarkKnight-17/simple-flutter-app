import 'package:flutter/material.dart';

class ListViewSpaced extends StatelessWidget {
  final List<Widget> children;
  final double space;
  final EdgeInsets padding;
  const ListViewSpaced({
    super.key,
    required this.children,
    this.space = 16,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemBuilder: (_, i) => children[i],
      separatorBuilder: (_, __) => SizedBox(height: space),
      itemCount: children.length,
    );
  }
}
