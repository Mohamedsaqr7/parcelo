import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatefulWidget {
  final Function(XFile?) onImagePicked;

  const PickImageWidget({super.key, required this.onImagePicked});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      setState(() => _pickedImage = file);
      widget.onImagePicked(file); // تبعت الصورة للأب
    }
  }

  void _deleteImage() {
    setState(() => _pickedImage = null);
    widget.onImagePicked(null); // ترجع null عشان يتم المسح
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickedImage == null ? _pickImage : null,
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: ClipOval(
              child: _pickedImage != null
                  ? Image.file(File(_pickedImage!.path), fit: BoxFit.cover)
                  : const Icon(Icons.person, size: 60, color: Colors.grey),
            ),
          ),
          if (_pickedImage != null)
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: _deleteImage,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.close, color: Colors.white, size: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
