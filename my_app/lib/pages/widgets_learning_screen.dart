import 'package:flutter/material.dart';
import 'package:my_app/pages/animation_widgets.dart';
import 'package:my_app/pages/button_widgets.dart';
import 'package:my_app/pages/display_widgets.dart';
import 'package:my_app/pages/feedback_widgets.dart';
import 'package:my_app/pages/input_widgets.dart';
import 'package:my_app/pages/layout_widgets.dart';
import 'package:my_app/pages/list_widgets.dart';

class WidgetTypesScreen extends StatefulWidget {
  const WidgetTypesScreen({super.key});

  @override
  State<WidgetTypesScreen> createState() => _WidgetTypesScreenState();
}

class _WidgetTypesScreenState extends State<WidgetTypesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final types = [
      {
        "title": "Layout Widgets",
        "page": const LayoutWidgetsPage(),
        "icon": Icons.dashboard_customize,
        "color": const Color(0xFF6366F1),
        "gradient": [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
      },
      {
        "title": "Display Widgets",
        "page": const DisplayWidgetsPage(),
        "icon": Icons.visibility,
        "color": const Color(0xFF10B981),
        "gradient": [const Color(0xFF10B981), const Color(0xFF34D399)],
      },
      {
        "title": "Input Widgets",
        "page": const InputWidgetsPage(),
        "icon": Icons.edit_note,
        "color": const Color(0xFFF59E0B),
        "gradient": [const Color(0xFFF59E0B), const Color(0xFFFBBF24)],
      },
      {
        "title": "Button Widgets",
        "page": const ButtonWidgetsPage(),
        "icon": Icons.touch_app,
        "color": const Color(0xFFEC4899),
        "gradient": [const Color(0xFFEC4899), const Color(0xFFF472B6)],
      },
      {
        "title": "List & Scroll Widgets",
        "page": const ListWidgetsPage(),
        "icon": Icons.view_list,
        "color": const Color(0xFF3B82F6),
        "gradient": [const Color(0xFF3B82F6), const Color(0xFF60A5FA)],
      },
      {
        "title": "Feedback Widgets",
        "page": const FeedbackWidgetsPage(),
        "icon": Icons.feedback,
        "color": const Color(0xFF8B5CF6),
        "gradient": [const Color(0xFF8B5CF6), const Color(0xFFA78BFA)],
      },
      {
        "title": "Animation Widgets",
        "page": const AnimationWidgetsPage(),
        "icon": Icons.animation,
        "color": const Color(0xFFEF4444),
        "gradient": [const Color(0xFFEF4444), const Color(0xFFF87171)],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF6366F1),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Widget Explorer",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF6366F1),
                      const Color(0xFF8B5CF6),
                      const Color(0xFFEC4899),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Animated circles in background
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: Container(
                        width: 150,
                        height: 150,
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
                          const SizedBox(height: 40),
                          Icon(
                            Icons.widgets,
                            size: 60,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${types.length} Categories",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Grid Items
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: _AnimatedWidgetCard(
                    title: types[index]["title"].toString(),
                    icon: types[index]["icon"] as IconData,
                    colors: types[index]["gradient"] as List<Color>,
                    delay: index * 100,
                    onTap: () {
                      Navigator.push(
                        context,
                        _createRoute(types[index]["page"] as Widget),
                      );
                    },
                  ),
                );
              }, childCount: types.length),
            ),
          ),
        ],
      ),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
    );
  }
}

// Animated Widget Card
class _AnimatedWidgetCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Color> colors;
  final int delay;
  final VoidCallback onTap;

  const _AnimatedWidgetCard({
    required this.title,
    required this.icon,
    required this.colors,
    required this.delay,
    required this.onTap,
  });

  @override
  State<_AnimatedWidgetCard> createState() => _AnimatedWidgetCardState();
}

class _AnimatedWidgetCardState extends State<_AnimatedWidgetCard>
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
            Future.delayed(const Duration(milliseconds: 100), widget.onTap);
          },
          onTapCancel: () => _controller.forward(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.colors,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: widget.colors[0].withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Background Pattern
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: -30,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(widget.icon, size: 32, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
