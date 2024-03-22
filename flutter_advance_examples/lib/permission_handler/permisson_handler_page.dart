// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPage extends StatelessWidget {
  const PermissionHandlerPage({super.key});

  Future<void> onPermissionCamera(BuildContext context) async {
    String message = '';
    PermissionStatus cameraPermission = await Permission.camera.request();
    if (cameraPermission.isGranted) {
      message = 'Permission camera is granted';
    }
    if (cameraPermission.isDenied) {
      message = 'Permission camera is denied';
    }
    if (cameraPermission.isPermanentlyDenied) {
      message = 'Permission camera is permanently denied';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> onPermissionStorage(BuildContext context) async {
    String message = '';
    PermissionStatus storagePermission = await Permission.storage.request();
    if (storagePermission.isGranted) {
      message = 'Permission storage is granted';
    }
    if (storagePermission.isDenied) {
      message = 'Permission storage is denied';
    }
    if (storagePermission.isPermanentlyDenied) {
      message = 'Permission storage is permanently denied';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> onPermissionMic(BuildContext context) async {
    String message = '';
    PermissionStatus microPermission = await Permission.microphone.request();
    if (microPermission.isGranted) {
      message = 'Permission micro is granted';
    }
    if (microPermission.isDenied) {
      message = 'Permission micro is denied';
    }
    if (microPermission.isPermanentlyDenied) {
      message = 'Permission micro is permanently denied';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox12 = SizedBox(height: 12);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Handler'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CardPermission(
              onTap: () => onPermissionCamera(context),
              text: 'Camera Permission',
              icon: Icons.camera_alt,
            ),
            sizedBox12,
            CardPermission(
              onTap: () => onPermissionStorage(context),
              text: 'Storage Permission',
              icon: Icons.folder,
            ),
            sizedBox12,
            CardPermission(
              onTap: () => onPermissionMic(context),
              text: 'Mic Permission',
              icon: Icons.mic,
            ),
          ],
        ),
      ),
    );
  }
}

class CardPermission extends StatelessWidget {
  const CardPermission({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final Function() onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
