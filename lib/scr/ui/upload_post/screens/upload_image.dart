import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/scr/ui/upload_post/upload_post_view_model.dart';

class UploadImage extends ConsumerStatefulWidget {
  const UploadImage({super.key});

  @override
  ConsumerState<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends ConsumerState<UploadImage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(
      () {
        ref
            .read(uploadPostViewModelProvider.notifier)
            .setImageCaption(controller.text);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageFile = ref.watch(
      uploadPostViewModelProvider.select((_) => _.imageFile),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    ref
                        .read(uploadPostViewModelProvider.notifier)
                        .setImageFile(File(pickedFile.path));
                  } else {
                    print('No image selected');
                  }
                },
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: const Color.fromARGB(255, 255, 220, 220),
                      width: 300,
                      height: 300,
                      child: imageFile != null
                          ? Image.file(imageFile)
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 50,
                                  ),
                                  Text(
                                    'Select an image',
                                    style: GoogleFonts.dosis(fontSize: 22),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Caption'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Post',
                  style: GoogleFonts.dosis(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
