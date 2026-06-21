// marker.dart
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerUtils {
  static Future<BitmapDescriptor> createPinMarker(BuildContext context, String assetPath) async {
    const double canvasSize = 120.0;
    const double circleRadius = 44.0;
    const double circleCenterX = canvasSize / 2;
    const double circleCenterY = 44.0;
    const double borderWidth = 4.0;

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final Paint tealPaint = Paint()..color = const Color(0xFF6BBFB5);

    final Path pinPath = Path()
      ..moveTo(circleCenterX - 12, circleCenterY + circleRadius - 6)
      ..lineTo(circleCenterX + 12, circleCenterY + circleRadius - 6)
      ..lineTo(circleCenterX, canvasSize - 4)
      ..close();

    pinPath.addOval(Rect.fromCircle(
      center: const Offset(circleCenterX, circleCenterY),
      radius: circleRadius,
    ));

    canvas.drawShadow(pinPath, Colors.black.withOpacity(0.5), 6.0, false);
    canvas.drawPath(pinPath, tealPaint);

    final Path clipPath = Path()
      ..addOval(Rect.fromCircle(
        center: const Offset(circleCenterX, circleCenterY),
        radius: circleRadius - borderWidth,
      ));

    canvas.save();
    canvas.clipPath(clipPath);

    try {
      // Use the context passed to the function to load the asset
      final ByteData data = await DefaultAssetBundle.of(context).load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();
      final ui.Codec codec = await ui.instantiateImageCodec(
        bytes,
        targetWidth: ((circleRadius - borderWidth) * 2).toInt(),
        targetHeight: ((circleRadius - borderWidth) * 2).toInt(),
      );
      final ui.FrameInfo frame = await codec.getNextFrame();
      canvas.drawImage(
        frame.image,
        Offset(
          circleCenterX - circleRadius + borderWidth,
          circleCenterY - circleRadius + borderWidth,
        ),
        Paint(),
      );
    } catch (e) {
      debugPrint('Error loading marker image: $e');
      canvas.drawCircle(
        const Offset(circleCenterX, circleCenterY),
        circleRadius - borderWidth,
        Paint()..color = const Color(0xFFE0D0C0),
      );
    }

    canvas.restore();

    final ui.Image finalImage = await recorder
        .endRecording()
        .toImage(canvasSize.toInt(), canvasSize.toInt());

    final ByteData? byteData = await finalImage.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}