import 'package:flutter/material.dart';
import '../../../../domain/entities/client.dart';
import '../../../../shared/widgets/section_header.dart';
import 'widgets/client_basic_info.dart';
import 'widgets/client_tags.dart';
import 'widgets/client_action_bar.dart';

class AddEditClientScreen extends StatefulWidget {
  final int? clientId;
  final Client? initialClient;

  const AddEditClientScreen({super.key, this.clientId, this.initialClient});

  @override
  State<AddEditClientScreen> createState() => _AddEditClientScreenState();
}

class _AddEditClientScreenState extends State<AddEditClientScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _phoneCtrl;
  late final TextEditingController _secondPhoneCtrl;
  late final TextEditingController _notesCtrl;

  bool get _isEditMode => widget.clientId != null;
  String _selectedTag = 'عادي';

  @override
  void initState() {
    super.initState();
    final cl = widget.initialClient;
    _nameCtrl = TextEditingController(text: cl?.name ?? '');
    _phoneCtrl = TextEditingController(text: cl?.phone ?? '');
    _secondPhoneCtrl = TextEditingController(text: cl?.secondPhone ?? '');
    _notesCtrl = TextEditingController(text: cl?.notes ?? '');
    if (cl != null) _selectedTag = cl.tag;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _secondPhoneCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_nameCtrl.text.isEmpty || _isEditMode) return true;
    final pop = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("تجاهل التغييرات؟"),
        content: const Text("لديك بيانات غير محفوظة، هل تريد الخروج بدون حفظ؟"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("إلغاء")),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text("تجاهل", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
    return pop ?? false;
  }

  void _saveClient() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم الحفظ ✓")));
      Navigator.pop(context);
    }
  }

  void _confirmDelete() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("سيتم حذف العميل وجميع قضاياه نهائياً.\nهذا الإجراء لا يمكن التراجع عنه.", textAlign: TextAlign.center),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        if (await _onWillPop() && context.mounted) Navigator.pop(context);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: Text(_isEditMode ? "تعديل بيانات العميل" : "إضافة عميل جديد")),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClientBasicInfo(
                    nameCtrl: _nameCtrl, phoneCtrl: _phoneCtrl, secondPhoneCtrl: _secondPhoneCtrl,
                    isEditMode: _isEditMode, initialShowSecondaryPhone: widget.initialClient?.secondPhone?.isNotEmpty ?? false,
                  ),
                  const SizedBox(height: 24),
                  ClientTagsSection(initialTag: _selectedTag, onTagChanged: (val) => _selectedTag = val),
                  const SizedBox(height: 24),
                  const SectionHeader(title: "ملاحظات", icon: Icons.notes_outlined),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _notesCtrl, maxLines: 5, minLines: 3,
                    decoration: InputDecoration(labelText: "أضف ملاحظة (اختياري)...", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          bottomSheet: ClientActionBar(isEditMode: _isEditMode, onSave: _saveClient, onDelete: _confirmDelete),
        ),
      ),
    );
  }
}
