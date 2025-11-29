import 'package:flutter/material.dart';

/// ===========================================================================
/// BUTTON WIDGETS PAGE
///
/// Buttons user interaction ke liye use hote hain:
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
/// Saare buttons clear examples ke saath niche explain kiye gaye hain.
/// ===========================================================================

class ButtonWidgetsPage extends StatelessWidget {
  const ButtonWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Widgets"),
        backgroundColor: Colors.redAccent,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --------------------------------------------------------------
          // 1. Elevated Button
          // --------------------------------------------------------------
          _box(
            title: "ElevatedButton",
            description:
                "Raised button (shadow ke saath).\n"
                "Important actions jaise: Submit, Save, Login ke liye use hota hai.",
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 2. Outlined Button
          // --------------------------------------------------------------
          _box(
            title: "OutlinedButton",
            description:
                "Border wala button (light actions ke liye).\n"
                "Secondary actions ke liye perfect: Cancel, Skip, Later.",
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button"),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 3. Text Button
          // --------------------------------------------------------------
          _box(
            title: "TextButton",
            description:
                "Sirf text wala button (no border no background).\n"
                "Links, small actions: 'Forgot Password?', 'View More'.",
            child: TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 4. Icon Button
          // --------------------------------------------------------------
          _box(
            title: "IconButton",
            description:
                "Icon ko button jaisa clickable banata hai.\n"
                "Back, Menu, Like, Share jaise icons ke liye.",
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 5. Floating Action Button
          // --------------------------------------------------------------
          _box(
            title: "FloatingActionButton",
            description:
                "Round floating button.\n"
                "Har screen ka main action hota hai: Add, Create, Message.",
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.add),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 6. MaterialButton
          // --------------------------------------------------------------
          _box(
            title: "MaterialButton",
            description:
                "Old-style customizable button.\n"
                "Color, shape, padding sab set kar sakte ho.",
            child: MaterialButton(
              color: Colors.orange,
              onPressed: () {},
              child: const Text("Material Button"),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 7. InkWell (Ripple Effect)
          // --------------------------------------------------------------
          _box(
            title: "InkWell",
            description:
                "InkWell kisi bhi widget ko tappable bana deta hai.\n"
                "Ripple effect deta hai = button jaisa feel.\n"
                "Custom buttons banane ke liye best.",
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("Tap using InkWell"),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 8. GestureDetector
          // --------------------------------------------------------------
          _box(
            title: "GestureDetector",
            description:
                "Sabse flexible gesture listener.\n"
                "Tap, Double Tap, Long Press — sab support karta hai.\n"
                "Completely custom button banane ke liye useful.",
            child: GestureDetector(
              onTap: () {},
              onDoubleTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.yellow.shade200,
                child: const Text("Tap using GestureDetector"),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===========================================================================
  // REUSABLE BOX UI (Title + Description + Widget Example)
  // ===========================================================================
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

        /// Card-style shadow
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
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
