import 'package:flutter/material.dart';

/// ===========================================================================
/// FEEDBACK WIDGETS PAGE
/// This page explains Flutter's essential feedback widgets:
///
/// ✔ SnackBar
/// ✔ AlertDialog
/// ✔ BottomSheet
/// ✔ ModalBottomSheet
/// ✔ Tooltip
/// ✔ Progress Indicators
/// ✔ ExpansionTile
/// ✔ PopupMenuButton
///
/// Feedback widgets provide user responses and notifications.
/// ===========================================================================

class FeedbackWidgetsPage extends StatefulWidget {
  const FeedbackWidgetsPage({super.key});

  @override
  State<FeedbackWidgetsPage> createState() => _FeedbackWidgetsPageState();
}

class _FeedbackWidgetsPageState extends State<FeedbackWidgetsPage>
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
            backgroundColor: const Color(0xFF8B5CF6),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Feedback Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF8B5CF6), const Color(0xFFA78BFA)],
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
                            Icons.feedback,
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
                      // 1. SNACKBAR
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "SnackBar",
                        icon: Icons.notification_important,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "SnackBar displays short messages at the bottom of the screen.\n"
                            "Perfect for form submissions, text copies, or item deletions.",
                        child: Container(
                          height: 50,
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
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("This is a SnackBar!"),
                                  backgroundColor: Color(0xFFEF4444),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Show SnackBar",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFEF4444),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 2. ALERT DIALOG
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "AlertDialog",
                        icon: Icons.warning,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "AlertDialog is a popup window for confirmations.\n"
                            "Used for warnings, inputs, or critical decisions.",
                        child: Container(
                          height: 50,
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
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: const Text("Alert"),
                                    content: const Text(
                                      "This is an AlertDialog.",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Show AlertDialog",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFFF59E0B),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 3. BOTTOM SHEET
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "BottomSheet",
                        icon: Icons.keyboard_arrow_up,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "BottomSheet slides up from the bottom.\n"
                            "Ideal for options, menus, or additional info.",
                        child: Container(
                          height: 50,
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
                          child: ElevatedButton(
                            onPressed: () {
                              showBottomSheet(
                                context: context,
                                builder: (_) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF10B981,
                                      ).withOpacity(0.1),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "This is a BottomSheet",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Show BottomSheet",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF10B981),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 4. MODAL BOTTOM SHEET
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "ModalBottomSheet",
                        icon: Icons.fullscreen,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "ModalBottomSheet is draggable and closes on outside tap.\n"
                            "Modern, smooth sheet for detailed interactions.",
                        child: Container(
                          height: 50,
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
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF3B82F6,
                                      ).withOpacity(0.1),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "This is a ModalBottomSheet",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Show ModalBottomSheet",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF3B82F6),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 5. TOOLTIP
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "Tooltip",
                        icon: Icons.help_outline,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "Tooltip shows short hints on hover or long press.\n"
                            "Great for explaining icons or providing quick info.",
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8B5CF6),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Tooltip(
                              message: "This is a Tooltip",
                              child: Icon(
                                Icons.info,
                                size: 35,
                                color: Color(0xFF8B5CF6),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 6. PROGRESS INDICATORS
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "Progress Indicators",
                        icon: Icons.hourglass_empty,
                        iconColor: const Color(0xFF06B6D4),
                        description:
                            "Progress Indicators show loading states.\n"
                            "Circular for spinners, Linear for progress bars.",
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF06B6D4),
                                ),
                              ),
                              SizedBox(height: 12),
                              LinearProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF06B6D4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 7. EXPANSION TILE
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "ExpansionTile",
                        icon: Icons.expand_more,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "ExpansionTile creates expandable sections.\n"
                            "Perfect for FAQs, categorized lists, or collapsible content.",
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF59E0B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFF59E0B),
                              width: 2,
                            ),
                          ),
                          child: const ExpansionTile(
                            title: Text("Tap to Expand"),
                            children: [
                              ListTile(title: Text("Item A")),
                              ListTile(title: Text("Item B")),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 8. POPUP MENU BUTTON
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 800,
                        title: "PopupMenuButton",
                        icon: Icons.more_vert,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "PopupMenuButton shows overflow menus (like 3 dots).\n"
                            "Ideal for profile edits, deletes, shares, or quick actions.",
                        child: Container(
                          height: 50,
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
                          child: PopupMenuButton(
                            itemBuilder: (_) {
                              return const [
                                PopupMenuItem(value: 1, child: Text("Edit")),
                                PopupMenuItem(value: 2, child: Text("Delete")),
                                PopupMenuItem(value: 3, child: Text("Share")),
                              ];
                            },
                            child: const Center(
                              child: Text(
                                "Open Menu",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xFFEC4899),
                                ),
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
            const Color(0xFF8B5CF6).withOpacity(0.1),
            const Color(0xFFA78BFA).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8B5CF6),
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
                    color: Color(0xFF8B5CF6),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Feedback widgets enhance UX by providing immediate responses to user actions.\nMaster them for intuitive app interactions!",
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
