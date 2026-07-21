import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geos/features/map/presentation/view_models/draw_controller.dart';
import 'package:geos/features/map/presentation/view_models/offset_provider.dart';

class InformationBubble extends ConsumerStatefulWidget {
  Map<String, dynamic>? selectedGeofenceProps;

  InformationBubble({super.key, required this.selectedGeofenceProps});

  @override
  ConsumerState<InformationBubble> createState() => _InformationBubbleState();
}

class _InformationBubbleState extends ConsumerState<InformationBubble> {
  @override
  Widget build(BuildContext context) {
    final properties = widget.selectedGeofenceProps;
    final name = properties?['name'] ?? 'Unnamed Fence';
    final description = properties?['description'] ?? 'No description available.';
    final isActive = properties?['isActive'] ?? false;
    final municipality = properties?['municipality'];
    final province = properties?['province'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 280,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedGeofenceProps = null;
                        ref.read(offsetProvider.notifier).updateOffset(null);
                      });
                    },
                    child: const Icon(Icons.close, size: 20, color: Color(0xFF64748B)),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isActive ? Icons.check_circle : Icons.cancel,
                          color: isActive ? Colors.green : Colors.red,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isActive ? 'Active' : 'Inactive',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1E293B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isActive,
                        activeThumbColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.red.withOpacity(0.3),
                        onChanged: (val) {
                          setState(() {
                            widget.selectedGeofenceProps!['isActive'] = val;
                          });
                          ref.read(drawProvider.notifier).updateSelectedFeatureActiveStatus(val);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Text(
                description.toString(),
                style: const TextStyle(color: Color(0xFF475569), fontSize: 13),
              ),
              if (municipality != null || province != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Color(0xFF64748B)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          [if (municipality != null) municipality, if (province != null) province].join(', '),
                          style: const TextStyle(color: Color(0xFF475569), fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        CustomPaint(
          size: const Size(20, 10),
          painter: _TrianglePainter(),
        ),
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
