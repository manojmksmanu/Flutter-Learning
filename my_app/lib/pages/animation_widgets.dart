import 'package:flutter/material.dart';

/// =======================================================================
/// ANIMATION WIDGETS PAGE
///
/// Animation widgets app ko smooth & interactive banate hain.
/// Yaha mostly "Implicit Animations" diye gaye hain:
///
/// ✔ AnimatedContainer
/// ✔ AnimatedOpacity
/// ✔ AnimatedAlign
/// ✔ AnimatedPadding
/// ✔ AnimatedRotation
/// ✔ AnimatedScale
/// ✔ AnimatedSwitcher
/// ✔ AnimatedCrossFade
/// ✔ TweenAnimationBuilder
/// ✔ Hero Animation
///
/// =======================================================================

class AnimationWidgetsPage extends StatefulWidget {
  const AnimationWidgetsPage({super.key});

  @override
  State<AnimationWidgetsPage> createState() => _AnimationWidgetsPageState();
}

class _AnimationWidgetsPageState extends State<AnimationWidgetsPage> {
  double opacity = 1.0;
  bool big = false;
  bool rotate = false;
  bool showFirst = true;
  double paddingValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Widgets"),
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ----------------------------------------------------------------
          // 1. AnimatedContainer
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedContainer",
            description:
                "AnimatedContainer apne width, height, color, border-radius ko \n"
                "smoothly animate karta hai.\n"
                "State change hote hi animation start ho jati hai.",
            child: GestureDetector(
              onTap: () => setState(() => big = !big),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                height: big ? 100 : 60,
                width: big ? 100 : 60,
                decoration: BoxDecoration(
                  color: big ? Colors.purple : Colors.purple.shade200,
                  borderRadius: BorderRadius.circular(big ? 0 : 20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 2. AnimatedOpacity
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedOpacity",
            description:
                "Widget ki visibility ko smooth fade animation ke sath change karta hai.\n"
                "Opacity 0 = invisible, opacity 1 = fully visible.",
            child: Column(
              children: [
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(seconds: 1),
                  child: Container(height: 60, width: 60, color: Colors.teal),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () =>
                      setState(() => opacity = opacity == 1.0 ? 0.0 : 1.0),
                  child: const Text("Toggle Opacity"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 3. AnimatedAlign
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedAlign",
            description:
                "Widget ka alignment smoothly animate hota hai.\n"
                "Left → Right → Center jaise movement ke liye best.",
            child: SizedBox(
              height: 120,
              child: GestureDetector(
                onTap: () => setState(() => big = !big),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  alignment: big ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(height: 50, width: 50, color: Colors.blue),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 4. AnimatedPadding
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedPadding",
            description:
                "Padding ko smoothly animate karta hai.\n"
                "Tap par size increase/decrease hoti hai.",
            child: GestureDetector(
              onTap: () =>
                  setState(() => paddingValue = paddingValue == 10 ? 40 : 10),
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.all(paddingValue),
                child: Container(height: 60, width: 60, color: Colors.orange),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 5. AnimatedRotation
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedRotation",
            description:
                "Widget ko smoothly rotate karta hai.\n"
                "Rotate = true → 360 degrees rotation.",
            child: GestureDetector(
              onTap: () => setState(() => rotate = !rotate),
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 600),
                turns: rotate ? 1 : 0,
                child: const Icon(Icons.refresh, size: 40, color: Colors.teal),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 6. AnimatedScale
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedScale",
            description:
                "Widget ko zoom-in / zoom-out smoothly animate karta hai.",
            child: GestureDetector(
              onTap: () => setState(() => big = !big),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: big ? 1.4 : 1.0,
                child: const Icon(Icons.star, size: 40, color: Colors.amber),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 7. AnimatedSwitcher
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedSwitcher",
            description:
                "Widget change hone par animation play hoti hai.\n"
                "Buttons, numbers, images, toggles ke liye perfect.",
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    showFirst ? "Hello" : "Welcome",
                    key: ValueKey(showFirst),
                    style: const TextStyle(fontSize: 26),
                  ),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () => setState(() => showFirst = !showFirst),
                  child: const Text("Switch Text"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 8. AnimatedCrossFade
          // ----------------------------------------------------------------
          _box(
            title: "AnimatedCrossFade",
            description:
                "Do widgets ke beech smooth fade + size animation.\n"
                "Photo switcher, banner changer ke liye best.",
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Container(
                height: 60,
                width: double.infinity,
                color: Colors.green.shade300,
                child: const Center(child: Text("First Widget")),
              ),
              secondChild: Container(
                height: 60,
                width: double.infinity,
                color: Colors.red.shade300,
                child: const Center(child: Text("Second Widget")),
              ),
              crossFadeState: showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 9. TweenAnimationBuilder
          // ----------------------------------------------------------------
          _box(
            title: "TweenAnimationBuilder",
            description:
                "TweenAnimationBuilder custom animations create karta hai.\n"
                "Value 0 → 1 animate hoti hai automatically.",
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    child: Container(height: 60, width: 60, color: Colors.pink),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // ----------------------------------------------------------------
          // 10. Hero Animation
          // ----------------------------------------------------------------
          _box(
            title: "Hero Animation",
            description:
                "Screen change karte time widget smoothly transition hota hai.\n"
                "Images, profile pictures me commonly use hota hai.",
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HeroSecondPage()),
                );
              },
              child: const Hero(
                tag: "heroTag",
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // =======================================================================
  // UI BOX (Reusable Card Style)
  // =======================================================================
  Widget _box({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            description,
            style: TextStyle(color: Colors.black.withOpacity(0.7)),
          ),

          const SizedBox(height: 12),

          child,
        ],
      ),
    );
  }
}

/// =======================================================================
/// SECOND PAGE FOR HERO ANIMATION
/// =======================================================================

class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hero Animation Example")),

      body: Center(
        child: Hero(
          tag: "heroTag",
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.person, color: Colors.white, size: 70),
          ),
        ),
      ),
    );
  }
}
