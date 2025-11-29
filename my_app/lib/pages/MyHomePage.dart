import 'package:flutter/material.dart';
import 'package:my_app/components/Custom_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Slide animation
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void openModal(String title, String msg, IconData icon, Color color) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CustomModal(
          title: title,
          message: msg,
          icon: icon,
          iconColor: color,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    /// Header Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello! 👋",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Welcome back to your dashboard",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.blueAccent.withOpacity(0.2),
                          child: Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    /// Quick Stats Card
                    _buildStatsCard(),

                    const SizedBox(height: 30),

                    Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Animated Cards
                    _AnimatedCard(
                      delay: 100,
                      onTap: () {
                        openModal(
                          "Profile",
                          "View and edit your profile details.",
                          Icons.person,
                          Colors.blueAccent,
                        );
                      },
                      child: homeCard(
                        icon: Icons.person,
                        title: "Profile",
                        subtitle: "View & edit your profile",
                        color: Colors.blueAccent,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _AnimatedCard(
                      delay: 200,
                      onTap: () {
                        openModal(
                          "Settings",
                          "Change your app settings & preferences.",
                          Icons.settings,
                          Colors.deepPurple,
                        );
                      },
                      child: homeCard(
                        icon: Icons.settings,
                        title: "Settings",
                        subtitle: "App preferences & options",
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _AnimatedCard(
                      delay: 300,
                      onTap: () {
                        openModal(
                          "Notifications",
                          "Your recent alerts & messages.",
                          Icons.notifications,
                          Colors.orange,
                        );
                      },
                      child: homeCard(
                        icon: Icons.notifications,
                        title: "Notifications",
                        subtitle: "Your alerts & activity",
                        color: Colors.orange,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _AnimatedCard(
                      delay: 400,
                      onTap: () {
                        openModal(
                          "Help & Support",
                          "Get help and support for any issues.",
                          Icons.help,
                          Colors.green,
                        );
                      },
                      child: homeCard(
                        icon: Icons.help,
                        title: "Help & Support",
                        subtitle: "We're here to help you",
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(Icons.task_alt, "Tasks", "12"),
          Container(height: 50, width: 1, color: Colors.white.withOpacity(0.3)),
          _buildStatItem(Icons.event, "Events", "5"),
          Container(height: 50, width: 1, color: Colors.white.withOpacity(0.3)),
          _buildStatItem(Icons.check_circle, "Done", "8"),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
        ),
      ],
    );
  }

  Widget homeCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black38),
        ],
      ),
    );
  }
}

/// Animated Card Widget with delay
class _AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final int delay;

  const _AnimatedCard({
    required this.child,
    required this.onTap,
    required this.delay,
  });

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // Delay the animation
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        setState(() => _isVisible = true);
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTapDown: (_) => _controller.reverse(),
          onTapUp: (_) {
            _controller.forward();
            widget.onTap();
          },
          onTapCancel: () => _controller.forward(),
          child: widget.child,
        ),
      ),
    );
  }
}
