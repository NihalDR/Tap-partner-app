import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyTapScreen extends StatefulWidget {
  const WhyTapScreen({super.key});

  @override
  State<WhyTapScreen> createState() => _WhyTapScreenState();
}

class _WhyTapScreenState extends State<WhyTapScreen> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
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

            // Page Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Title
                    Text(
                      'Why Tap?',
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF191C1D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Subtitle
                    Text(
                      'Unlock new avenues for growth and profitability for your clients',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF3E4A3D),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Staggered list items
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
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
