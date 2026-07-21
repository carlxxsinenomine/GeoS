import 'package:flutter/material.dart';
import 'package:geos/features/map/domain/entities/geofence_info_entity.dart';

class GeofenceSaveModal {
  static Future<GeofenceInfoEntity?> saveFenceInfo(BuildContext context) {
    return showDialog<GeofenceInfoEntity>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const _GeofenceSaveDialog(),
    );
  }
}

class _GeofenceSaveDialog extends StatefulWidget {
  const _GeofenceSaveDialog();

  @override
  State<_GeofenceSaveDialog> createState() => _GeofenceSaveDialogState();
}

class _GeofenceSaveDialogState extends State<_GeofenceSaveDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  bool _isActive = true;
  int _selectedColor = 0xFF3B82F6;

  static const _palette = [
    0xFF3B82F6, 0xFF10B981, 0xFFF97316, 0xFFEF4444,
    0xFFA855F7, 0xFFEC4899, 0xFF14B8A6, 0xFF6366F1,
  ];

  String get _hex {
    final c = _selectedColor;
    return '#${((c >> 16) & 0xFF).toRadixString(16).padLeft(2, '0')}${((c >> 8) & 0xFF).toRadixString(16).padLeft(2, '0')}${(c & 0xFF).toRadixString(16).padLeft(2, '0')}'.toUpperCase();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.of(context).pop(GeofenceInfoEntity(
      name: _nameController.text.trim(),
      description: _descController.text.trim().isEmpty ? null : _descController.text.trim(),
      isActive: _isActive,
      color: _selectedColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final accent = Color(_selectedColor);
    final cs = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text('Save Geofence', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),

              // Name
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: _field(context, 'Name', accent),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                controller: _descController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: _field(context, 'Description (optional)', accent),
              ),
              const SizedBox(height: 16),

              // Active toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Active', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                  Switch(value: _isActive, activeColor: accent, onChanged: (v) => setState(() => _isActive = v)),
                ],
              ),
              const Divider(height: 8),
              const SizedBox(height: 12),

              // Color picker
              Text('Color', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _palette.map((c) {
                        final sel = c == _selectedColor;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedColor = c),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color(c),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: sel ? cs.onSurface : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: sel ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(_hex, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: cs.onSurface.withValues(alpha: 0.55))),
                ],
              ),

              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(null),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 13), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: _submit,
                      style: FilledButton.styleFrom(backgroundColor: accent, padding: const EdgeInsets.symmetric(vertical: 13), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _field(BuildContext context, String label, Color accent) {
    final cs = Theme.of(context).colorScheme;
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.35),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: cs.outline.withValues(alpha: 0.2))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: accent, width: 1.5)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: cs.error)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }
}
