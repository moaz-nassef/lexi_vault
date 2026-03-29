import 'package:flutter/material.dart';
import '../../../../shared/widgets/section_header.dart';

class ClientBasicInfo extends StatefulWidget {
  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController secondPhoneCtrl;
  final bool isEditMode;
  final bool initialShowSecondaryPhone;

  const ClientBasicInfo({
    super.key,
    required this.nameCtrl,
    required this.phoneCtrl,
    required this.secondPhoneCtrl,
    required this.isEditMode,
    required this.initialShowSecondaryPhone,
  });

  @override
  State<ClientBasicInfo> createState() => _ClientBasicInfoState();
}

class _ClientBasicInfoState extends State<ClientBasicInfo> {
  late bool _showSecondaryPhone;

  @override
  void initState() {
    super.initState();
    _showSecondaryPhone = widget.initialShowSecondaryPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "البيانات الأساسية", icon: Icons.person_outline),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.nameCtrl,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: "اسم العميل",
            prefixIcon: const Icon(Icons.person_outline),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          validator: (val) {
            if (val == null || val.trim().isEmpty) return "يرجى إدخال اسم العميل";
            if (val.trim().length < 2) return "الاسم قصير جداً";
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.phoneCtrl,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: "رقم الهاتف",
            prefixIcon: const Icon(Icons.phone_outlined),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          validator: (val) {
            if (val == null || val.trim().isEmpty) return "مطلوب إدخال رقم الهاتف";
            return null;
          },
        ),
        const SizedBox(height: 8),
        if (!_showSecondaryPhone)
          TextButton.icon(
            onPressed: () => setState(() => _showSecondaryPhone = true),
            icon: const Icon(Icons.add, size: 18),
            label: const Text("إضافة رقم هاتف بديل"),
          ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: _showSecondaryPhone
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: widget.secondPhoneCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "رقم هاتف بديل (اختياري)",
                      prefixIcon: const Icon(Icons.phone_android_outlined),
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () {
                          widget.secondPhoneCtrl.clear();
                          setState(() => _showSecondaryPhone = false);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
