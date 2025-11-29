import 'package:flutter/material.dart';

/// ===========================================================================
/// ANIMATION WIDGETS PAGE
/// Beautifully designed page to learn all major Flutter Animation Widgets
/// ===========================================================================

class AnimationWidgetsPage extends StatefulWidget {
  const AnimationWidgetsPage({super.key});

  @override
  State<AnimationWidgetsPage> createState() => _AnimationWidgetsPageState();
}

class _AnimationWidgetsPageState extends State<AnimationWidgetsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  // States for interactive animations
  bool _isBig = false;
  double _opacity = 1.0;
  bool _showFirst = true;
  Alignment _alignment = Alignment.centerLeft;
  int _counter = 0;

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
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Gradient SliverAppBar
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFEF4444),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Animation Widgets",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),

              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFF87171)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.15),
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.animation,
                        size: 60,
                        color: Colors.white,
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

                      // 1. AnimatedContainer
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "AnimatedContainer",
                        icon: Icons.auto_awesome_motion,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "Automatically animates property changes like size, color, border, etc.",
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                              width: _isBig ? 200 : 100,
                              height: _isBig ? 200 : 100,
                              decoration: BoxDecoration(
                                color: _isBig ? Colors.pink : Colors.pink[300],
                                borderRadius: BorderRadius.circular(
                                  _isBig ? 50 : 12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.4),
                                    blurRadius: _isBig ? 20 : 10,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.favorite,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () => setState(() => _isBig = !_isBig),
                              child: const Text("Toggle Size & Shape"),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 2. AnimatedOpacity
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "AnimatedOpacity",
                        icon: Icons.opacity,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "Smooth fade in/out animation. Perfect for show/hide with transition.",
                        child: Column(
                          children: [
                            AnimatedOpacity(
                              opacity: _opacity,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  "Now you see me!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () => setState(
                                () => _opacity = _opacity == 1.0 ? 0.0 : 1.0,
                              ),
                              child: Text(
                                _opacity == 1.0 ? "Fade Out" : "Fade In",
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 3. AnimatedAlign
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "AnimatedAlign",
                        icon: Icons.align_horizontal_center,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "Animates alignment changes inside a container.",
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: AnimatedAlign(
                                alignment: _alignment,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.bounceOut,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () => setState(
                                    () => _alignment = Alignment.topLeft,
                                  ),
                                  child: const Text("Top Left"),
                                ),
                                ElevatedButton(
                                  onPressed: () => setState(
                                    () => _alignment = Alignment.bottomRight,
                                  ),
                                  child: const Text("Bottom Right"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 4. AnimatedCrossFade
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "AnimatedCrossFade",
                        icon: Icons.swap_horiz,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "Cross-fades between two widgets with beautiful transition.",
                        child: AnimatedCrossFade(
                          firstChild: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              "First Widget",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          secondChild: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.rocket_launch,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          crossFadeState: _showFirst
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 800),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              setState(() => _showFirst = !_showFirst),
                          child: const Text("Switch Widget"),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 5. AnimatedSwitcher
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "AnimatedSwitcher",
                        icon: Icons.animation,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "Animates when child changes. Great for counters, images, etc.",
                        child: Column(
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 600),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                              child: Text(
                                '$_counter',
                                key: ValueKey<int>(_counter),
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B5CF6),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => setState(() => _counter++),
                              child: const Text("Increase Counter"),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 6. TweenAnimationBuilder
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "TweenAnimationBuilder",
                        icon: Icons.trending_up,
                        iconColor: const Color(0xFF06B6D4),
                        description:
                            "Powerful explicit animation without controller.",
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: const Duration(seconds: 2),
                          curve: Curves.elasticOut,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.cyan,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 7. Hero Animation
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "Hero Animation",
                        icon: Icons.flight,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "Shared element transition between screens.",
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HeroDetailPage(),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "hero-image",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=400",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
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

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7C3AED).withOpacity(0.1),
            const Color(0xFF9F67FF).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7C3AED).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF7C3AED),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tips_and_updates, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pro Tip",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C3AED),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Use implicit animations (Animated*) for simple cases.\nUse explicit (AnimationController) for complex or staggered animations!",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Hero Detail Page (for demonstration)
class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Hero(
          tag: "hero-image",
          child: Image.network(
            "https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=800",
          ),
        ),
      ),
    );
  }
}

// Reusable Animated Card (same as your original)
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(width: double.infinity, child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}
