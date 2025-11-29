import 'package:flutter/material.dart';

/// ===========================================================================
/// FEEDBACK WIDGETS PAGE
///
/// Feedback widgets user ko response/notification dene ke liye use hotay:
///
/// ✔ SnackBar – screen ke bottom me small message
/// ✔ AlertDialog – popup dialog
/// ✔ BottomSheet – bottom se upar slide hone wala panel
/// ✔ ModalBottomSheet – draggable sheet
/// ✔ Tooltip – hover/tap par short info
/// ✔ Progress Indicators – loading circle/line
/// ✔ ExpansionTile – expandable section
/// ✔ PopupMenuButton – overflow menu (3 dots)
///
/// ===========================================================================

class FeedbackWidgetsPage extends StatelessWidget {
  const FeedbackWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Widgets"),
        backgroundColor: Colors.teal,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ----------------------------------------------------------------
          // 1. SNACKBAR
          // ----------------------------------------------------------------
          _box(
            title: "SnackBar",
            description:
                "SnackBar bottom me short message show karta hai.\n"
                "Form submit, copy text, delete item dikhane ke liye best.",
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("This is a SnackBar")),
                );
              },
              child: const Text("Show SnackBar"),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 2. ALERT DIALOG
          // ----------------------------------------------------------------
          _box(
            title: "AlertDialog",
            description:
                "AlertDialog ek popup window hota hai.\n"
                "Confirmations, warnings, inputs ke liye use hota hai.",
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Alert"),
                      content: const Text("This is an AlertDialog."),
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
              child: const Text("Show AlertDialog"),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 3. SIMPLE BOTTOM SHEET
          // ----------------------------------------------------------------
          _box(
            title: "BottomSheet",
            description:
                "BottomSheet bottom se slide hoke aata hai.\n"
                "Options, menus ya extra info dikhane ke liye.",
            child: ElevatedButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      height: 150,
                      color: Colors.teal.shade100,
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
              child: const Text("Show BottomSheet"),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 4. MODAL BOTTOM SHEET
          // ----------------------------------------------------------------
          _box(
            title: "ModalBottomSheet",
            description:
                "Modal sheet tap outside karne par close hota hai.\n"
                "Draggable, smooth & modern style ka sheet.",
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      height: 300,
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
              child: const Text("Show ModalBottomSheet"),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 5. TOOLTIP
          // ----------------------------------------------------------------
          _box(
            title: "Tooltip",
            description:
                "Tooltip ek short hint show karta hai.\n"
                "Icons ko explain karne ke liye best.",
            child: const Tooltip(
              message: "This is a Tooltip",
              child: Icon(Icons.info, size: 35),
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 6. PROGRESS INDICATORS
          // ----------------------------------------------------------------
          _box(
            title: "Progress Indicators",
            description:
                "Loading dikhane ke liye use hote hain.\n"
                "Circular → spinner\n"
                "Linear → loading bar",
            child: Column(
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 12),
                LinearProgressIndicator(),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 7. EXPANSION TILE
          // ----------------------------------------------------------------
          _box(
            title: "ExpansionTile",
            description:
                "Expandable section.\n"
                "FAQ section, expandable category list ke liye perfect.",
            child: const ExpansionTile(
              title: Text("Tap to Expand"),
              children: [
                ListTile(title: Text("Item A")),
                ListTile(title: Text("Item B")),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ----------------------------------------------------------------
          // 8. POPUP MENU BUTTON
          // ----------------------------------------------------------------
          _box(
            title: "PopupMenuButton",
            description:
                "Overflow 3-dot menu jaise options show karta hai.\n"
                "Profile edit, delete, share options ke liye perfect.",
            child: PopupMenuButton(
              itemBuilder: (_) {
                return const [
                  PopupMenuItem(value: 1, child: Text("Edit")),
                  PopupMenuItem(value: 2, child: Text("Delete")),
                  PopupMenuItem(value: 3, child: Text("Share")),
                ];
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.teal.shade100,
                child: const Text("Open Menu"),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===========================================================================
  // REUSABLE UI BOX
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
