import 'package:flutter/material.dart';
import '../../../../shared/widgets/section_header.dart';

class ClientTagsSection extends StatefulWidget {
  final String initialTag;
  final ValueChanged<String> onTagChanged;

  const ClientTagsSection({
    super.key,
    required this.initialTag,
    required this.onTagChanged,
  });

  @override
  State<ClientTagsSection> createState() => _ClientTagsSectionState();
}

class _ClientTagsSectionState extends State<ClientTagsSection> {
  late String _selectedTag;

  final List<Map<String, dynamic>> _tags = [
    {'label': 'VIP', 'color': Colors.amber[700]!, 'icon': Icons.star},
    {'label': 'مهم', 'color': Colors.blue[600]!, 'icon': Icons.flag},
    {'label': 'متأخر', 'color': Colors.red[600]!, 'icon': Icons.warning_rounded},
    {'label': 'عادي', 'color': Colors.grey[500]!, 'icon': Icons.person},
  ];

  @override
  void initState() {
    super.initState();
    _selectedTag = widget.initialTag;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "التصنيف", icon: Icons.label_outline),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _tags.map((tagObj) {
            final isSelected = _selectedTag == tagObj['label'];
            final color = tagObj['color'] as Color;
            return FilterChip(
              label: Text(tagObj['label'] as String),
              avatar: Icon(
                tagObj['icon'] as IconData,
                color: isSelected ? Colors.white : color,
                size: 18,
              ),
              selected: isSelected,
              selectedColor: color,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
              shape: StadiumBorder(side: BorderSide(color: isSelected ? color : Colors.grey.shade300)),
              onSelected: (bool selected) {
                if (selected) {
                  setState(() => _selectedTag = tagObj['label'] as String);
                  widget.onTagChanged(_selectedTag);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
