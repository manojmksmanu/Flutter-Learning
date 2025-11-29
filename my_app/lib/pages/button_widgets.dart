import 'package:flutter/material.dart';

/// ===========================================================================
/// BUTTON WIDGETS PAGE
/// This page explains Flutter's essential button widgets:
///
/// ✔ ElevatedButton – raised button (important actions)
/// ✔ OutlinedButton – bordered button
/// ✔ TextButton – text-only button (links)
/// ✔ IconButton – only icon click
/// ✔ FloatingActionButton – round button (main action)
/// ✔ MaterialButton – old but customizable
/// ✔ InkWell – ripple effect (custom buttons ke liye)
/// ✔ GestureDetector – sabse custom tap listener
///
/// All buttons are explained below with clear examples.
/// ===========================================================================

class ButtonWidgetsPage extends StatefulWidget {
  const ButtonWidgetsPage({super.key});

  @override
  State<ButtonWidgetsPage> createState() => _ButtonWidgetsPageState();
}

class _ButtonWidgetsPageState extends State<ButtonWidgetsPage>
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
            backgroundColor: const Color(0xFFEC4899),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Button Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFFEC4899), const Color(0xFFF472B6)],
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
                            Icons.touch_app,
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
                      // 1. ELEVATEDBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "ElevatedButton",
                        icon: Icons.layers,
                        iconColor: const Color(0xFF6366F1),
                        description:
                            "Raised button (with shadow).\n"
                            "Used for important actions like: Submit, Save, Login.",
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("ElevatedButton pressed!"),
                                backgroundColor: Color(0xFF6366F1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6366F1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Elevated Button",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 2. OUTLINEDBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "OutlinedButton",
                        icon: Icons.border_outer,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "Bordered button (for light actions).\n"
                            "Perfect for secondary actions: Cancel, Skip, Later.",
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("OutlinedButton pressed!"),
                                backgroundColor: Color(0xFF10B981),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF10B981)),
                            foregroundColor: const Color(0xFF10B981),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Outlined Button",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 3. TEXTBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "TextButton",
                        icon: Icons.text_format,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "Text-only button (no border, no background).\n"
                            "Used for links or small actions: 'Forgot Password?', 'View More'.",
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("TextButton pressed!"),
                                backgroundColor: Color(0xFFF59E0B),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFF59E0B),
                          ),
                          child: const Text(
                            "Text Button",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 4. ICONBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "IconButton",
                        icon: Icons.touch_app,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "Makes an icon clickable like a button.\n"
                            "For back, menu, like, share icons.",
                        child: IconButton(
                          icon: const Icon(Icons.favorite, size: 30),
                          color: const Color(0xFF3B82F6),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("IconButton pressed!"),
                                backgroundColor: Color(0xFF3B82F6),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 5. FLOATINGACTIONBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "FloatingActionButton",
                        icon: Icons.add_circle,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "Round floating button.\n"
                            "Main action for each screen: Add, Create, Message.",
                        child: FloatingActionButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("FAB pressed!"),
                                backgroundColor: Color(0xFFEF4444),
                              ),
                            );
                          },
                          backgroundColor: const Color(0xFFEF4444),
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.add),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 6. MATERIALBUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "MaterialButton",
                        icon: Icons.layers,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "Old-style customizable button.\n"
                            "Set color, shape, padding as needed.",
                        child: MaterialButton(
                          color: const Color(0xFF8B5CF6),
                          textColor: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("MaterialButton pressed!"),
                                backgroundColor: Color(0xFF8B5CF6),
                              ),
                            );
                          },
                          child: const Text(
                            "Material Button",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 7. INKWELL
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "InkWell",
                        icon: Icons.water_drop,
                        iconColor: const Color(0xFF06B6D4),
                        description:
                            "Makes any widget tappable with ripple effect.\n"
                            "Best for custom buttons with button-like feel.",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("InkWell tapped!"),
                                  backgroundColor: Color(0xFF06B6D4),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF06B6D4),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFF06B6D4).withOpacity(0.1),
                              ),
                              child: const Text(
                                "Tap using InkWell",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xFF06B6D4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 8. GESTUREDETECTOR
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 800,
                        title: "GestureDetector",
                        icon: Icons.gesture,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "Most flexible gesture listener.\n"
                            "Supports tap, double tap, long press.\n"
                            "Useful for completely custom buttons.",
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("GestureDetector tapped!"),
                                backgroundColor: Color(0xFFEC4899),
                              ),
                            );
                          },
                          onDoubleTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Double tap detected!"),
                                backgroundColor: Colors.orange,
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFEC4899),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFEC4899).withOpacity(0.1),
                            ),
                            child: const Text(
                              "Tap using GestureDetector",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFEC4899),
                              ),
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
            const Color(0xFFEC4899).withOpacity(0.1),
            const Color(0xFFF472B6).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFEC4899).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEC4899),
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
                    color: Color(0xFFEC4899),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Button widgets handle user interactions.\nChoose the right one based on action importance for better UX!",
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
              SizedBox(width: double.infinity, child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}
