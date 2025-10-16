import 'package:flutter/material.dart';

class AddOptions extends StatelessWidget {
  const AddOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text("Select the option you want to add", style: textTheme.titleSmall),
        const SizedBox(height: 16),
        _Option(
          label: "Add Item",
          icon: Icons.emoji_objects_outlined,
          page: Text("Item Form Screen"),
        ),
        const SizedBox(height: 8),
        _Option(
          label: "Add Category",
          icon: Icons.category_outlined,
          page: Text("Category Form Screen"),
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({required this.label, required this.icon, required this.page});

  final String label;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
      },
      child: Row(
        children: [
          Icon(icon, size: 24, color: colorScheme.onSurface),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 16)),
          const Spacer(),
          Icon(Icons.chevron_right, size: 32, color: colorScheme.onSurface),
        ],
      ),
    );
  }
}
