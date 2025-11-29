import 'package:flutter/material.dart';

/// ===========================================================================
/// DISPLAY WIDGETS PAGE
///
/// Display widgets ka kaam hota hai screen par content show karna:
///
/// ✔ Text – likha hua content show karta hai
/// ✔ Icon – symbols show karta hai
/// ✔ Image – network ya asset image show karta hai
/// ✔ CircleAvatar – rounded image ya profile icon
/// ✔ Card – material design ka raised box
/// ✔ Chip – small labeled element
/// ✔ Tooltip – hover/tap pe extra info
/// ✔ Divider – line separator
///
/// Yeh page sabko simple examples ke sath explain karta hai.
/// ===========================================================================

class DisplayWidgetsPage extends StatelessWidget {
  const DisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Widgets"),
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ----------------------------------------------------------------
          // 1. TEXT
          // ----------------------------------------------------------------
          _box(
            title: "Text",
            description:
                "Text widget likha hua content show karta hai.\n"
                "Hum isme fontSize, fontWeight, color sab change kar sakte hain.",
            child: const Text(
              "This is a Text widget",
              style: TextStyle(fontSize: 18),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 2. ICON
          // ----------------------------------------------------------------
          _box(
            title: "Icon",
            description:
                "Icon widget symbols show karta hai.\n"
                "Material Icons ya custom icons use kar sakte ho.",
            child: const Icon(Icons.favorite, color: Colors.red, size: 40),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 3. IMAGE
          // ----------------------------------------------------------------
          _box(
            title: "Image",
            description:
                "Image widget photos show karta hai.\n"
                "Network image, asset image, file image sab load hoti hain.",
            child: Image.network(
              "https://flutter.dev/images/flutter-logo-sharing.png",
              height: 100,
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 4. CIRCLE AVATAR
          // ----------------------------------------------------------------
          _box(
            title: "CircleAvatar",
            description:
                "Profile picture ya initials show karne ke liye use hota hai.\n"
                "Round shape automatically apply hota hai.",
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 5. CARD
          // ----------------------------------------------------------------
          _box(
            title: "Card",
            description:
                "Card Material Design ka shadow wala box hota hai.\n"
                "Lists, settings, profile items banane me use hota hai.",
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

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 6. CHIP
          // ----------------------------------------------------------------
          _box(
            title: "Chip",
            description:
                "Chip ek small component hota hai jisme label + icon show hota hai.\n"
                "Filters, tags, categories me use hota hai.",
            child: const Chip(
              label: Text("Flutter"),
              avatar: Icon(Icons.star, color: Colors.orange),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 7. TOOLTIP
          // ----------------------------------------------------------------
          _box(
            title: "Tooltip",
            description:
                "Tooltip touch ya hover par extra information show karta hai.\n"
                "Buttons ya icons samjhani ke liye perfect.",
            child: const Tooltip(
              message: "This is a tooltip",
              child: Icon(Icons.info, size: 35),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 8. DIVIDER
          // ----------------------------------------------------------------
          _box(
            title: "Divider",
            description:
                "Divider ek horizontal line hoti hai.\n"
                "Sections ya items ko visually separate karne ke liye use hota hai.",
            child: const Divider(thickness: 2, color: Colors.deepPurple),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===========================================================================
  // REUSABLE BOX WIDGET (UI CARD)
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

        /// Soft shadow for card UI
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          /// Description
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 12),

          /// Example widget
          child,
        ],
      ),
    );
  }
}
