import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onGetStarted;

  const HomeScreen({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // Background Dot Grid Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: CustomPaint(
                painter: DotGridPainter(),
              ),
            ),
          ),

          // Decorative Top Hanging Lamp (Left-ish)
          Positioned(
            top: 0,
            left: size.width * 0.15,
            width: 100,
            height: 180,
            child: Opacity(
              opacity: 0.25,
              child: CustomPaint(
                painter: HangingLampPainter(),
              ),
            ),
          ),

          // Left Illustration (Abstract plant/organic shape with circles)
          Positioned(
            left: -30,
            bottom: size.height * 0.08,
            width: 160,
            height: 240,
            child: Opacity(
              opacity: 0.35,
              child: CustomPaint(
                painter: LeftIllustrationPainter(color: const Color(0xFFBDCABA)),
              ),
            ),
          ),

          // Right Illustration (Abstract organic shape with ellipses)
          Positioned(
            right: -30,
            bottom: size.height * 0.05,
            width: 160,
            height: 240,
            child: Opacity(
              opacity: 0.35,
              child: CustomPaint(
                painter: RightIllustrationPainter(color: const Color(0xFFBDCABA)),
              ),
            ),
          ),

          // Main Screen Content
          SafeArea(
            child: Column(
              children: [
                // Header (Top App Bar equivalent)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: theme.primaryColor,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Tap',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF191C1D),
                        ),
                      ),
                    ],
                  ),
                ),

                // Hero Content
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // App Branding Headline
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: size.width > 600 ? 40 : 32,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                                color: const Color(0xFF191C1D),
                              ),
                              children: [
                                const TextSpan(text: 'Home to your\n'),
                                TextSpan(
                                  text: 'Fixed Income Investments',
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          
                          // Subheading
                          Text(
                            'An exclusive platform for Tap Invest Partners',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF3E4A3D),
                            ),
                          ),
                          const SizedBox(height: 36),

                          // Animated / Styled Get Started Button
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.95, end: 1.0),
                            duration: const Duration(milliseconds: 300),
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: InkWell(
                                  onTap: onGetStarted,
                                  borderRadius: BorderRadius.circular(9999),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.circular(9999),
                                      boxShadow: [
                                        BoxShadow(
                                          color: theme.primaryColor.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Get Started',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.open_in_new,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Dot Grid Background
class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD9DADB)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double spacing = 20.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Left-ish Top Hanging Lamp
class HangingLampPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6E7B6C)
      ..strokeWidth = 1.5;

    // Cable line
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height * 0.4), paint);

    // Lamp Shade (Trapezoid shape)
    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.4)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..lineTo(size.width * 0.9, size.height * 0.5)
      ..lineTo(size.width * 0.1, size.height * 0.5)
      ..close();

    canvas.drawPath(path, paint);

    // Soft light cone (semi-transparent)
    final lightPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.5)
      ..lineTo(size.width * 0.7, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final lightPaint = Paint()
      ..color = const Color(0xFFCAEAD6).withOpacity(0.12)
      ..style = PaintingStyle.fill;

    canvas.drawPath(lightPath, lightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Left Illustration (Abstract plant structure with circles)
class LeftIllustrationPainter extends CustomPainter {
  final Color color;

  LeftIllustrationPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Drawing base trapezoidpot-like shape at the bottom
    final potPath = Path()
      ..moveTo(size.width * 0.25, size.height)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.70, size.height * 0.8)
      ..lineTo(size.width * 0.30, size.height * 0.8)
      ..close();
    canvas.drawPath(potPath, paint);

    // Draw main stem/branch (quadratic bezier curve)
    final stemPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width * 0.4, size.height * 0.35);
    canvas.drawPath(stemPath, strokePaint);

    // Draw circles at different branch ends
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.35), 15, paint);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.45), 12, paint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.55), 18, paint);
    canvas.drawCircle(Offset(size.width * 0.45, size.height * 0.65), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Right Illustration (Abstract plant structure with ellipses)
class RightIllustrationPainter extends CustomPainter {
  final Color color;

  RightIllustrationPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Drawing pot
    final potPath = Path()
      ..moveTo(size.width * 0.3, size.height)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(size.width * 0.65, size.height * 0.9)
      ..lineTo(size.width * 0.35, size.height * 0.9)
      ..close();
    canvas.drawPath(potPath, paint);

    // Main stems
    final stem1 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width * 0.6, size.height * 0.28);
    final stem2 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.65, size.width * 0.8, size.height * 0.48);
    final stem3 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.52, size.width * 0.2, size.height * 0.38);

    canvas.drawPath(stem1, strokePaint);
    canvas.drawPath(stem2, strokePaint);
    canvas.drawPath(stem3, strokePaint);

    // Draw rotated ellipses
    _drawRotatedEllipse(canvas, Offset(size.width * 0.6, size.height * 0.28), 15, 28, 30, paint);
    _drawRotatedEllipse(canvas, Offset(size.width * 0.8, size.height * 0.48), 12, 22, -45, paint);
    _drawRotatedEllipse(canvas, Offset(size.width * 0.2, size.height * 0.38), 10, 18, 45, paint);
  }

  void _drawRotatedEllipse(Canvas canvas, Offset center, double rx, double ry, double angleDegrees, Paint paint) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angleDegrees * math.pi / 180);
    canvas.drawOval(Rect.fromLTRB(-rx, -ry, rx, ry), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
