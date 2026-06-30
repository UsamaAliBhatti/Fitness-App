

import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/utils/app_shadow.dart';

class HydrationCard extends StatelessWidget {
  const HydrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        boxShadow: [AppShadow.drawShadow(context)],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0%',
                        style: TextStyle(
                          color: context.colors.info,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hydration',
                            style: TextStyle(
                              color: context.colors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Log Now',
                            style: TextStyle(
                              color: context.colors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Mini bar chart
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 150,
                  height: 120,
                  child: CustomPaint(painter: _HydrationChartPainter(context)),
                ),
              ],
            ),
          ),
          // Add water button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 13),
            decoration: BoxDecoration(
              color: context.colors.bottomBorderColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
            ),
            child: const Center(
              child: Text(
                '500 ml added to water log',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HydrationChartPainter extends CustomPainter {
  final BuildContext context;

  _HydrationChartPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Color bgColor = context.colors.background;
    Color lineColor = context.colors.textSecondary;
    Color dashColor = context.colors.info.withValues(alpha: 0.3);
    Color markerColor = context.colors.info;

    // Background
    canvas.drawRect(Offset.zero & size, Paint()..color = bgColor);

    // const leftPadding = 18.0;
    const lineX = 48.0;
    const top = 18.0;
    final bottom = size.height - 24;

    final textStyle = TextStyle(
      color: context.colors.textSecondary,
      fontSize: 14,
    );

    void drawText(String text, Offset offset) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      tp.paint(canvas, offset);
    }

    // Labels
    drawText("2 L", const Offset(8, 10));
    drawText("0 L", Offset(8, bottom - 10));

    // Vertical dashed line
    final dashPaint = Paint()
      ..color = dashColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    double y = top;

    while (y < bottom) {
      canvas.drawLine(Offset(lineX, y), Offset(lineX, y + 6), dashPaint);
      y += 18;
    }

    // Blue markers
    final markerPaint = Paint()..color = markerColor;

    void drawMarker(double y) {
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(lineX - 5, y - 3, 10, 3),
        const Radius.circular(4),
      );

      canvas.drawRRect(rect, markerPaint);
    }

    drawMarker(top);
    drawMarker(size.height * .48);
    drawMarker(bottom);

    // Bottom horizontal line
    canvas.drawLine(
      Offset(lineX, bottom),
      Offset(size.width - 20, bottom),
      Paint()
        ..color = lineColor
        ..strokeWidth = 2,
    );

    // Right label
    final tp = TextPainter(
      text: TextSpan(
        text: "0ml",
        style: TextStyle(color: context.colors.textSecondary, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(
      canvas,
      Offset(size.width - tp.width + 10, bottom - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
