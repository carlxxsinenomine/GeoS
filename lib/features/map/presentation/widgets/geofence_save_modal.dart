import 'package:flutter/material.dart';
import 'package:geos/features/map/domain/entities/geofence_info_entity.dart';
import 'package:geos/features/map/presentation/widgets/CTextField.dart';

class GeofenceSaveModal {
  static Future<void> saveFenceInfo(BuildContext context) async {
    final nameController = TextEditingController();
    final descController = TextEditingController();

    showDialog<GeofenceInfoEntity>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Save Geofence"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CTextField(
                label: "Name",
                decoration: InputDecoration(hintText: "Enter fence name"),
                controller: nameController,
              ),
              const SizedBox(height: 8),
              CTextField(
                label: "Description",
                controller: descController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Geofence description here....",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("data")),
            ],
          ),
        );
      },
    );
  }
}
