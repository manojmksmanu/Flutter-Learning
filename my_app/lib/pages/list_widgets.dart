import 'package:flutter/material.dart';

/// ===========================================================================
/// LIST & SCROLL WIDGETS PAGE
/// These widgets make content scrollable or display lists:
///
/// ✔ ListView – simple scrolling list
/// ✔ ListView.builder – large dynamic list
/// ✔ ListTile – ready-made list row
/// ✔ SingleChildScrollView – non-list scrollable content
/// ✔ GridView – 2D grid
/// ✔ GridView.builder – efficient grid
/// ✔ PageView – swipeable pages
/// ✔ Scrollbar – visible scroll indicator
/// ✔ CustomScrollView + SliverAppBar – advanced scrolling UI
///
/// ===========================================================================

class ListWidgetsPage extends StatefulWidget {
  const ListWidgetsPage({super.key});

  @override
  State<ListWidgetsPage> createState() => _ListWidgetsPageState();
}

class _ListWidgetsPageState extends State<ListWidgetsPage>
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
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF3B82F6),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "List & Scroll Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF3B82F6), const Color(0xFF60A5FA)],
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
                            Icons.view_list,
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

                      // 1. LISTVIEW
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "ListView",
                        icon: Icons.list,
                        iconColor: const Color(0xFF6366F1),
                        description:
                            "ListView is a basic vertical scroll list.\nBest for small or fixed items.",
                        child: Container(
                          height: 120,
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
                          child: ListView(
                            children: const [
                              ListTile(title: Text("Item 1")),
                              ListTile(title: Text("Item 2")),
                              ListTile(title: Text("Item 3")),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 2. LISTVIEW.BUILDER
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "ListView.builder",
                        icon: Icons.format_list_bulleted,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "ListView.builder creates items only when needed.\nGreat for large or dynamic lists.",
                        child: Container(
                          height: 150,
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
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (_, i) =>
                                ListTile(title: Text("Dynamic Item ${i + 1}")),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 3. LISTTILE
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "ListTile",
                        icon: Icons.format_line_spacing,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "ListTile is a simple row layout.\nIt includes an icon, title, subtitle, and trailing icon.",
                        child: Container(
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
                          child: const ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Manoj Kumar"),
                            subtitle: Text("Flutter Developer"),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 4. SINGLECHILDSCROLLVIEW
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "SingleChildScrollView",
                        icon: Icons.vertical_align_center,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "SingleChildScrollView makes long content scrollable.\nUse it for forms or long text, not for big lists.",
                        child: Container(
                          height: 120,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                Text("Line 1"),
                                Text("Line 2"),
                                Text("Line 3"),
                                Text("Line 4"),
                                Text("Line 5"),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 5. GRIDVIEW
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "GridView",
                        icon: Icons.grid_view,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "GridView shows items in rows and columns.\nGood for images, galleries, or product grids.",
                        child: Container(
                          height: 150,
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
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(
                              6,
                              (i) => Card(
                                color: Colors.orange.shade100,
                                child: Center(child: Text("Item ${i + 1}")),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 6. GRIDVIEW.BUILDER
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "GridView.builder",
                        icon: Icons.grid_on,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "GridView.builder builds items only when needed.\nIdeal for large or dynamic grids.",
                        child: Container(
                          height: 150,
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
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                            itemCount: 6,
                            itemBuilder: (_, i) {
                              return Card(
                                color: Colors.green.shade100,
                                child: Center(child: Text("Grid ${i + 1}")),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 7. PAGEVIEW
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "PageView",
                        icon: Icons.pages,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "PageView allows swiping between pages.\nUseful for onboarding screens or sliders.",
                        child: Container(
                          height: 150,
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
                          child: PageView(
                            children: [
                              Container(
                                color: Colors.red,
                                child: const Center(child: Text("Page 1")),
                              ),
                              Container(
                                color: Colors.blue,
                                child: const Center(child: Text("Page 2")),
                              ),
                              Container(
                                color: Colors.green,
                                child: const Center(child: Text("Page 3")),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 8. SCROLLBAR
                      _AnimatedWidgetBox(
                        delay: 800,
                        title: "Scrollbar",
                        icon: Icons.linear_scale,
                        iconColor: const Color(0xFF06B6D4),
                        description:
                            "Scrollbar shows the scroll position.\nUseful for long scrollable content.",
                        child: Container(
                          height: 150,
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
                          child: Scrollbar(
                            child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (_, i) =>
                                  ListTile(title: Text("Item ${i + 1}")),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 9. CUSTOMSCROLLVIEW + SLIVERAPPBAR
                      _AnimatedWidgetBox(
                        delay: 900,
                        title: "CustomScrollView + SliverAppBar",
                        icon: Icons.dashboard_customize,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "CustomScrollView with SliverAppBar creates advanced scrolling effects.\nGreat for collapsing headers and custom layouts.",
                        child: Container(
                          height: 200,
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
                          child: CustomScrollView(
                            slivers: [
                              const SliverAppBar(
                                title: Text("Sliver AppBar"),
                                floating: true,
                                backgroundColor: Color(0xFFF59E0B),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, i) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text("Sliver Item ${i + 1}"),
                                    ),
                                  ),
                                  childCount: 5,
                                ),
                              ),
                            ],
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
  /// ===========================================================================
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3B82F6).withOpacity(0.1),
            const Color(0xFF60A5FA).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6),
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
                    color: Color(0xFF3B82F6),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "List and scroll widgets work well with dynamic content.\nUse builder widgets for large data to keep your app fast.",
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

                  Row(
                    children: [
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
