import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  ImagePicker picker = ImagePicker();

  File? fileImage;

  Future<void> pickImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    if (image != null) {
      fileImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text('Pick image'),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            child: fileImage == null
                ? const Center(
                    child: Icon(Icons.person, size: 30),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.file(
                      fileImage!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickImageItem(
                onTap: () => pickImage(ImageSource.gallery),
                icon: Icons.image,
                text: 'Gallery',
              ),
              const SizedBox(width: 50),
              PickImageItem(
                onTap: () => pickImage(ImageSource.camera),
                icon: Icons.camera_alt,
                text: 'Camera',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PickImageItem extends StatelessWidget {
  const PickImageItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
  });

  final Function()? onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
