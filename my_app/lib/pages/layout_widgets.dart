import 'package:flutter/material.dart';

/// ===========================================================================
/// LAYOUT WIDGETS PAGE
/// This page explains the most basic and important layout widgets in Flutter:
///
/// ✔ Container
/// ✔ Row
/// ✔ Column
/// ✔ Padding
/// ✔ Center
/// ✔ Expanded
///
/// Layout widgets help you **arrange items on the screen**.
/// ===========================================================================

class LayoutWidgetsPage extends StatefulWidget {
  const LayoutWidgetsPage({super.key});

  @override
  State<LayoutWidgetsPage> createState() => _LayoutWidgetsPageState();
}

class _LayoutWidgetsPageState extends State<LayoutWidgetsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    /// Animation Controller setup
    /// This controller manages all animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    /// Fade Animation
    /// Fades the page from invisible (0) to visible (1)
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    /// Start animation
    _controller.forward();
  }

  @override
  void dispose() {
    /// Important to dispose controllers to avoid memory leak
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// SliverAppBar: Expandable AppBar that shrinks on scroll
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF6366F1),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Layout Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
                  ),
                ),
                child: Stack(
                  children: [
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
                            Icons.dashboard_customize,
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

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      _buildInfoBanner(),
                      const SizedBox(height: 20),

                      // --------------------------------------------------------------
                      // 1. CONTAINER
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "Container",
                        icon: Icons.crop_square,
                        iconColor: const Color(0xFF6366F1),
                        description:
                            "A Container is a box where you can set height, width, color,\n"
                            "padding, margin, and decoration.\n"
                            "It is one of the most commonly used widgets for basic UI.",
                        child: Container(
                          height: 80,
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
                              "This is a Container",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 2. ROW
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "Row",
                        icon: Icons.horizontal_distribute,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "Row arranges widgets horizontally from left to right.\n"
                            "Useful when you want items in a single horizontal line.",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildChip(Icons.star, "Item 1", Colors.orange),
                            _buildChip(Icons.favorite, "Item 2", Colors.red),
                            _buildChip(Icons.thumb_up, "Item 3", Colors.blue),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 3. COLUMN
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "Column",
                        icon: Icons.vertical_distribute,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "Column arranges widgets vertically from top to bottom.\n"
                            "Useful for placing text, form fields, or list items.",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildListItem(
                              "Line 1",
                              Icons.check_circle,
                              Colors.green,
                            ),
                            const SizedBox(height: 8),
                            _buildListItem(
                              "Line 2",
                              Icons.check_circle,
                              Colors.blue,
                            ),
                            const SizedBox(height: 8),
                            _buildListItem(
                              "Line 3",
                              Icons.check_circle,
                              Colors.purple,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 4. PADDING
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "Padding",
                        icon: Icons.space_bar,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "Padding adds space INSIDE a widget.\n"
                            "Useful when text or widgets look too close together,\n"
                            "and you want a cleaner look.",
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC4899).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEC4899),
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(24),
                            child: Text(
                              "Text with 24px padding on all sides",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 5. CENTER
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "Center",
                        icon: Icons.center_focus_strong,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "Center places a widget in the middle of the available space,\n"
                            "both horizontally and vertically.\n"
                            "Useful for centering text, buttons, or icons.",
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3B82F6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Centered Widget",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // --------------------------------------------------------------
                      // 6. EXPANDED
                      // --------------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "Expanded",
                        icon: Icons.open_in_full,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "Expanded divides available space equally inside a Row or Column.\n"
                            "Very useful for building flexible UIs that adjust\n"
                            "based on screen size.",
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFEF4444),
                                      Color(0xFFF87171),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Expanded 1",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF10B981),
                                      Color(0xFF34D399),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Expanded 2",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
  /// ===========================================================================
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF6366F1).withOpacity(0.1),
            const Color(0xFF8B5CF6).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
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
                    color: Color(0xFF6366F1),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Layout widgets are the foundation of UI.\nOnce you understand them, building complex UIs becomes easier!",
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// CHIP BUILDER FOR ROW EXAMPLE
  Widget _buildChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  /// LIST ITEM BUILDER FOR COLUMN EXAMPLE
  Widget _buildListItem(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// ===========================================================================
/// ANIMATED WIDGET BOX
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

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(widget.icon, color: widget.iconColor, size: 24),
                  ),
                  const SizedBox(width: 12),

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

              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              Container(height: 1, color: Colors.black.withOpacity(0.1)),
              const SizedBox(height: 16),

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

              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
