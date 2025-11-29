import 'package:flutter/material.dart';

/// ===========================================================================
/// LAYOUT WIDGETS PAGE
/// Yeh page Flutter ke sabse basic aur important layout widgets ko explain karta hai:
///
/// ✔ Container  
/// ✔ Row  
/// ✔ Column  
/// ✔ Padding  
/// ✔ Center  
/// ✔ Expanded  
///
/// Layout widgets ka kaam hota hai *screen pe cheezein arrange karna*.
/// ===========================================================================

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar:
      /// Screen title show karta hai 
      /// backgroundColor se appbar ka color set hota hai
      appBar: AppBar(
        title: const Text("Layout Widgets (Explained)"),
        backgroundColor: Colors.blue,
      ),

      /// ListView:
      /// Scrollable list provide karta hai.
      /// Iske andar hum ek ke baad ek sections rakh rahe hai.
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // --------------------------------------------------------------
          // 1. CONTAINER
          // --------------------------------------------------------------
          _box(
            title: "Container",
            description:
                "Container ek box hota hai jisme hum height, width, color,\n"
                "padding, margin aur decoration use kar sakte hain.\n"
                "Ek basic UI block banane ke liye sabse zyada use hota hai.",
            child: Container(
              height: 60,
              color: Colors.blue.shade100,
              child: const Center(child: Text("This is a Container")),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 2. ROW
          // --------------------------------------------------------------
          _box(
            title: "Row",
            description:
                "Row horizontally widgets ko left to right align karta hai.\n"
                "Jaise icons, buttons ya texts ek line mein rakhna ho.",
            child: Row(
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 10),
                Text("Row Example"),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 3. COLUMN
          // --------------------------------------------------------------
          _box(
            title: "Column",
            description:
                "Column vertically widgets ko top to bottom arrange karta hai.\n"
                "Text lines, form fields, list items dikhane ke liye perfect.",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Line 1"),
                Text("Line 2"),
                Text("Line 3"),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 4. PADDING
          // --------------------------------------------------------------
          _box(
            title: "Padding",
            description:
                "Padding widget ke ANDAR space deta hai.\n"
                "Agar text ya widget chipka chipki lag rahi ho,\n"
                "to Padding se clean look milta hai.",
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Padding Example"),
            ),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 5. CENTER
          // --------------------------------------------------------------
          _box(
            title: "Center",
            description:
                "Center kisi bhi widget ko horizontally + vertically beech me rakh deta hai.\n"
                "Mostly text ya buttons ko screen ke center me lane ke liye use hota hai.",
            child: const Center(child: Text("Centered Text")),
          ),

          const SizedBox(height: 16),

          // --------------------------------------------------------------
          // 6. EXPANDED
          // --------------------------------------------------------------
          _box(
            title: "Expanded",
            description:
                "Expanded Row ya Column ke andar space ko equally divide kar deta hai.\n"
                "UI jab flexible banana ho, screen size ke hisaab se adjust karwana ho,\n"
                "tab ye most important widget hota hai.",
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    color: Colors.red,
                    child: const Center(
                      child: Text("Expanded 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    color: Colors.green,
                    child: const Center(
                      child: Text("Expanded 2"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// ===========================================================================
  /// _box()
  /// Reusable UI box:
  /// Har widget ko ek clean card-style UI me dikhane ke liye use ho raha hai.
  /// ===========================================================================
  Widget _box({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      /// Box decoration for good UI
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        /// Soft shadow to look like a card UI
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),

      /// Content inside the box
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Widget Title
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          /// Widget Description
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 12),

          /// Actual widget example
          child,
        ],
      ),
    );
  }
}
