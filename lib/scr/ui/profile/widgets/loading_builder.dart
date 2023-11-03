import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

Widget loadingBuilder(
        BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
    loadingProgress == null
        ? child
        : Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: secondaryColor.withOpacity(0.3),
              ),
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
