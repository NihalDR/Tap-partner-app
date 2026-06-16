import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onGetStarted;

  const HomeScreen({super.key, required this.onGetStarted});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  final List<Map<String, dynamic>> _items = [
    {
      'title': 'Invoice Discounting',
      'description': 'Buy invoices payable to startups and companies and earn high returns in the short term.',
      'icon': Icons.receipt_long,
    },
    {
      'title': 'Bonds',
      'description': 'Lend money to companies for regular interest payments by purchasing discounted bond issues.',
      'icon': Icons.request_quote,
    },
    {
      'title': 'Asset Leasing',
      'description': 'Effortlessly buy and rent assets to businesses and earn monthly rental income.',
      'icon': Icons.corporate_fare,
    },
  ];

  final List<Map<String, String>> _stats = [
    {'value': '80,000+', 'label': 'Assets Managed'},
    {'value': '2,200+', 'label': 'Invoices Raised'},
    {'value': '< 0.1%', 'label': 'Default Rate'},
    {'value': '82+', 'label': 'Partner Companies'},
    {'value': '1,600+', 'label': 'Deals Closed'},
    {'value': '350 Cr+', 'label': 'AUM Raised'},
  ];

  final List<Map<String, dynamic>> _benefits = const [
    {
      'title': 'Onboarding Excellence',
      'description': 'Our streamlined process ensures that you can get started quickly and efficiently, allowing you to focus on what matters most—growing your investments.',
      'icon': Icons.login,
    },
    {
      'title': 'Competitive Commission Returns',
      'description': 'Benefit from our transparent and competitive commission structure, thoughtfully designed to ensure that your hard work is recognised and rewarded fairly.',
      'icon': Icons.verified,
    },
    {
      'title': 'Dedicated Relationship Manager',
      'description': 'Take advantage of our comprehensive financial guidance and support from a dedicated Relationship Manager.',
      'icon': Icons.call,
    },
    {
      'title': 'Exclusive Opportunities',
      'description': 'Empower your clients to invest in non-market linked assets, allowing them to diversify their portfolios and secure fixed returns.',
      'icon': Icons.monetization_on,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimations = List.generate(
      _items.length,
      (index) => Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Staggered delays
            0.6 + (index * 0.15),
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildFooterLink(String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: CustomPaint(
                painter: DotGridPainter(),
              ),
            ),
          ),
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
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFFF8F9FA),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
                          child: Column(
                            children: [
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
                                      style: TextStyle(color: theme.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
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
                              TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0.95, end: 1.0),
                                duration: const Duration(milliseconds: 300),
                                builder: (context, scale, child) {
                                  return Transform.scale(
                                    scale: scale,
                                    child: InkWell(
                                      onTap: widget.onGetStarted,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Why Tap?',
                                style: GoogleFonts.inter(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF191C1D),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Unlock new avenues for growth and profitability for your clients',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF3E4A3D),
                                ),
                              ),
                              const SizedBox(height: 32),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _items.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 20),
                                itemBuilder: (context, index) {
                                  final item = _items[index];
                                  return FadeTransition(
                                    opacity: _fadeAnimations[index],
                                    child: AnimatedCard(
                                      title: item['title'],
                                      description: item['description'],
                                      icon: item['icon'],
                                      primaryColor: theme.primaryColor,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(24.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(color: const Color(0xFFBDCABA).withOpacity(0.5)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.01),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.inter(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          height: 1.25,
                                          color: const Color(0xFF191C1D),
                                        ),
                                        children: [
                                          const TextSpan(text: 'Trusted by the top 1% for '),
                                          TextSpan(
                                            text: 'investments with fixed returns',
                                            style: TextStyle(color: theme.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Join a community of sophisticated investors building wealth with stability and transparency.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF3E4A3D),
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isWide ? 3 : 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: isWide ? 1.4 : 1.25,
                                ),
                                itemCount: _stats.length,
                                itemBuilder: (context, index) {
                                  final stat = _stats[index];
                                  return StatGridCard(
                                    value: stat['value']!,
                                    label: stat['label']!,
                                    primaryColor: theme.primaryColor,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
                          child: Column(
                            children: [
                              Text(
                                "What's in it for you?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF191C1D),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Gain access to benefits designed to enhance your financial growth and professional development.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF3E4A3D),
                                ),
                              ),
                              const SizedBox(height: 32),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _benefits.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  final benefit = _benefits[index];
                                  return BenefitCard(
                                    title: benefit['title']!,
                                    description: benefit['description']!,
                                    icon: benefit['icon']!,
                                    primaryColor: theme.primaryColor,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color(0xFF40674A),
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Tap to get started',
                                      style: GoogleFonts.inter(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Get started with as low as ₹50,000',
                                style: TextStyle(
                                  color: Color(0xFFC1EDC8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: widget.onGetStarted,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF40674A),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9999),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Get started today',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: const Color(0xFF2E3132),
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 32,
                                runSpacing: 24,
                                alignment: WrapAlignment.start,
                                children: [
                                  SizedBox(
                                    width: isWide ? 200 : double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _buildFooterLink('Terms & Conditions'),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('Privacy Policy'),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('Risk Disclosure'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: isWide ? 200 : double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ADDRESS',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Fixdot Fintech Private Limited\nSector 2, HSR Layout\nBengaluru',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: Colors.white54,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: isWide ? 200 : double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CONTACT US',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('via Email', onTap: () => _launchUrl('mailto:support@tapinvest.in')),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('via Whatsapp', onTap: () => _launchUrl('https://api.whatsapp.com/send/?phone=916362667523&text&type=phone_number&app_absent=0')),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('via LinkedIn', onTap: () => _launchUrl('https://www.linkedin.com/company/taphq/')),
                                        const SizedBox(height: 8),
                                        _buildFooterLink('Visit Tap', onTap: () => _launchUrl('https://tapinvest.in/')),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.white12,
                                height: 40,
                              ),
                              Center(
                                child: Text(
                                  '© 2024 Fixdot Fintech Private Limited',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Colors.white30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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




class AnimatedCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color primaryColor;

  const AnimatedCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.primaryColor,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}


class _AnimatedCardState extends State<AnimatedCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 0.98 : 1.0),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _isHovered ? widget.primaryColor : const Color(0xFFBDCABA).withOpacity(0.5),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.04 : 0.01),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Badge
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFC1EDC8),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: widget.primaryColor,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card Title
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF191C1D),
              ),
            ),
            const SizedBox(height: 8),

            // Card Description
            Text(
              widget.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF3E4A3D),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StatGridCard extends StatefulWidget {
  final String value;
  final String label;
  final Color primaryColor;

  const StatGridCard({
    super.key,
    required this.value,
    required this.label,
    required this.primaryColor,
  });

  @override
  State<StatGridCard> createState() => _StatGridCardState();
}


class _StatGridCardState extends State<StatGridCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? widget.primaryColor : const Color(0xFFBDCABA).withOpacity(0.5),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.04 : 0.01),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.value,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF40674A), // Secondary color
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3E4A3D),
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BenefitCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color primaryColor;

  const BenefitCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFBDCABA).withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing Badge Icon & Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFFC1EDC8), // Light Green Badge
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: primaryColor,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF191C1D),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF3E4A3D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
