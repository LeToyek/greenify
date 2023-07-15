import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:greenify/services/storage.dart';

class UploadImageContainer extends StatefulWidget {
  const UploadImageContainer({super.key});

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}

class _UploadImageContainerState extends State<UploadImageContainer> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () async {
        final file = await Storage().pickFile();
        if (file.name == "") {
          return;
        }
        setState(() {
          imageFile = File(file.path!);
        });
      },
      child: imageFile != null
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                  )),
            )
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              dashPattern: const [8, 8],
              color: Colors.grey,
              strokeWidth: 2,
              child: SizedBox(
                height: 180,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                      Text(
                        "Tambahkan Gambar",
                        style: textTheme.bodySmall!
                            .apply(fontWeightDelta: 2, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
