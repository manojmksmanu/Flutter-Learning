import 'package:flutter/material.dart';

/// ===========================================================================
/// DISPLAY WIDGETS PAGE
/// This page explains Flutter's essential display widgets:
///
/// ✔ Text – displays written content
/// ✔ Icon – displays symbols
/// ✔ Image – displays network or asset images
/// ✔ CircleAvatar – rounded profile image or icon
/// ✔ Card – material design raised box
/// ✔ Chip – small labeled element
/// ✔ Tooltip – extra info on hover/tap
/// ✔ Divider – line separator
///
/// These widgets are used to show content on the screen.
/// ===========================================================================

class DisplayWidgetsPage extends StatefulWidget {
  const DisplayWidgetsPage({super.key});

  @override
  State<DisplayWidgetsPage> createState() => _DisplayWidgetsPageState();
}

class _DisplayWidgetsPageState extends State<DisplayWidgetsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    /// Animation Controller setup
    /// This controller will manage all animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    /// Fade Animation created
    /// Fades from 0 (invisible) to 1 (fully visible)
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    /// Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    /// Dispose controller to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      /// Custom AppBar with Gradient
      /// Using Container for custom design instead of normal AppBar
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // iOS-style bouncing scroll
        slivers: [
          /// SliverAppBar: Expandable AppBar
          /// Shrinks on scroll
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF10B981),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Display Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF10B981), const Color(0xFF34D399)],
                  ),
                ),
                child: Stack(
                  children: [
                    /// Decorative circles in background
                    Positioned(
                      top: -30,
                      right: -30,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: 20,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Icon(
                            Icons.visibility,
                            size: 50,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// SliverPadding: Padding for sliver list
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                /// FadeTransition: Fade-in animation wrapper
                /// Everything fades in smoothly on page load
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      // Info Banner at top
                      _buildInfoBanner(),
                      const SizedBox(height: 20),

                      // --------------------------------------------------------------
                      // 1. TEXT
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "Text",
                        icon: Icons.text_fields,
                        iconColor: const Color(0xFF6366F1),
                        description:
                            "Text widget displays written content.\n"
                            "You can customize fontSize, fontWeight, color, and more.",
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF6366F1).withOpacity(0.2),
                                const Color(0xFF8B5CF6).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF6366F1),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "This is a Text widget",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 2. ICON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "Icon",
                        icon: Icons.star,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "Icon widget displays symbols.\n"
                            "Use Material Icons or custom icons with size and color options.",
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFEF4444).withOpacity(0.2),
                                const Color(0xFFF87171).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEF4444),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 3. IMAGE
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "Image",
                        icon: Icons.image,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "Image widget displays photos.\n"
                            "Supports network images, asset images, and file images.",
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF59E0B).withOpacity(0.2),
                                const Color(0xFFFBBF24).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFF59E0B),
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://flutter.dev/images/flutter-logo-sharing.png",
                              height: 100,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 4. CIRCLE AVATAR
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "CircleAvatar",
                        icon: Icons.account_circle,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "CircleAvatar is used for profile pictures or initials.\n"
                            "Automatically applies round shape with background options.",
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFEC4899).withOpacity(0.2),
                                const Color(0xFFF472B6).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEC4899),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 5. CARD
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "Card",
                        icon: Icons.credit_card,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "Card is a Material Design shadow box.\n"
                            "Used for lists, settings, or profile items.",
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF3B82F6).withOpacity(0.2),
                                const Color(0xFF60A5FA).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF3B82F6),
                              width: 2,
                            ),
                          ),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text("Manoj Kumar"),
                              subtitle: const Text("Flutter Developer"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 6. CHIP
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "Chip",
                        icon: Icons.label,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "Chip is a small component with label + icon.\n"
                            "Used for filters, tags, or categories.",
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF8B5CF6).withOpacity(0.2),
                                const Color(0xFFA78BFA).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8B5CF6),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Chip(
                              label: Text("Flutter"),
                              avatar: Icon(Icons.star, color: Colors.orange),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 7. TOOLTIP
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "Tooltip",
                        icon: Icons.help_outline,
                        iconColor: const Color(0xFF06B6D4),
                        description:
                            "Tooltip shows extra information on touch or hover.\n"
                            "Perfect for explaining buttons or icons.",
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF06B6D4).withOpacity(0.2),
                                const Color(0xFF0891B2).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF06B6D4),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Tooltip(
                              message: "This is a tooltip",
                              child: Icon(Icons.info, size: 35),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 8. DIVIDER
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 800,
                        title: "Divider",
                        icon: Icons.horizontal_rule,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "Divider is a horizontal line.\n"
                            "Used to visually separate sections or items.",
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF10B981).withOpacity(0.2),
                                const Color(0xFF34D399).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF10B981),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Divider(
                              thickness: 2,
                              color: Color(0xFF10B981),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  /// ===========================================================================
  /// INFO BANNER
  /// Learning tip banner at the top
  /// ===========================================================================
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF10B981).withOpacity(0.1),
            const Color(0xFF34D399).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF10B981).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.lightbulb, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Learning Tip",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10B981),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Display widgets are the building blocks for showing content.\nMaster them to create visually appealing UIs!",
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ===========================================================================
/// ANIMATED WIDGET BOX
/// Displays each widget in an animated card-style UI
/// ===========================================================================
class _AnimatedWidgetBox extends StatefulWidget {
  final int delay;
  final String title;
  final IconData icon;
  final Color iconColor;
  final String description;
  final Widget child;

  const _AnimatedWidgetBox({
    required this.delay,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.child,
  });

  @override
  State<_AnimatedWidgetBox> createState() => _AnimatedWidgetBoxState();
}

class _AnimatedWidgetBoxState extends State<_AnimatedWidgetBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    /// Scale Animation Controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    /// Scale animation with bounce effect
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack, // Bouncy effect
    );

    /// Delayed animation start
    /// Each card animates after its delay
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
        child: Container(
          padding: const EdgeInsets.all(20),

          /// Box decoration for card UI
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

            /// Soft shadow for depth
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          /// Content inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title Row with Icon
              Row(
                children: [
                  /// Icon Badge
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.icon, color: widget.iconColor, size: 24),
                  ),
                  const SizedBox(width: 12),

                  /// Widget Title
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Widget Description
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              /// Divider line
              Container(height: 1, color: Colors.black.withOpacity(0.1)),

              const SizedBox(height: 16),

              /// Label for example
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: widget.iconColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "EXAMPLE",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: widget.iconColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Actual widget example
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
