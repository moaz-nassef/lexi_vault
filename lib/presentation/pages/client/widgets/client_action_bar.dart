import 'package:flutter/material.dart';

class ClientActionBar extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback onSave;
  final VoidCallback onDelete;

  const ClientActionBar({
    super.key,
    required this.isEditMode,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Container(
      color: colorScheme.surface,
      padding: EdgeInsets.fromLTRB(16, 12, 16, bottomPadding > 0 ? bottomPadding : 12),
      child: isEditMode
          ? Row(
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  label: const Text("حذف"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  ),
                  onPressed: onDelete,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save_outlined, size: 20),
                    label: const Text("حفظ", style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: onSave,
                  ),
                ),
              ],
            )
          : SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save_outlined, size: 20),
                label: const Text("حفظ العميل", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: onSave,
              ),
            ),
    );
  }
}
