import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class BenefitsScreen extends StatelessWidget {
  const BenefitsScreen({super.key});

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
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
                        ],
                      ),
                    ),

                    // Benefits List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.separated(
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
                    ),
                    const SizedBox(height: 32),

                    // CTA Section Banner
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF40674A), // Deep Green Accent
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
                              color: Color(0xFFC1EDC8), // Light Green Dim
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                );
                              },
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

                    // Footer Address & Contact Links
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF2E3132), // Dark Slate Background
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top footer row/grid
                          Wrap(
                            spacing: 32,
                            runSpacing: 24,
                            alignment: WrapAlignment.start,
                            children: [
                              // Quick Legal Links
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

                              // Address Block
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

                              // Contact Channels
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
                                    _buildFooterLink('via Email'),
                                    const SizedBox(height: 8),
                                    _buildFooterLink('via Whatsapp'),
                                    const SizedBox(height: 8),
                                    _buildFooterLink('via LinkedIn'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white12,
                            height: 40,
                          ),
                          // Copyright notice
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
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {},
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
