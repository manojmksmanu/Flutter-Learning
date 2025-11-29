import 'package:flutter/material.dart';

/// ===========================================================================
/// LIST & SCROLL WIDGETS PAGE
///
/// These widgets content ko scrollable banate hain ya lists show karte hain:
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

class ListWidgetsPage extends StatelessWidget {
  const ListWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List & Scroll Widgets"),
        backgroundColor: Colors.orange,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ------------------------------------------------------------
          // 1. LISTVIEW
          // ------------------------------------------------------------
          _box(
            title: "ListView",
            description:
                "ListView vertically scroll hone wali list hoti hai.\n"
                "Small list ya static content ke liye perfect.",
            child: SizedBox(
              height: 120,
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

          // ------------------------------------------------------------
          // 2. LISTVIEW.BUILDER
          // ------------------------------------------------------------
          _box(
            title: "ListView.builder",
            description:
                "Builder large lists ke liye best hota hai.\n"
                "Items tabhi create hoti hain jab screen pe dikhti hain.\n"
                "Performance best hoti hai.",
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, i) =>
                    ListTile(title: Text("Dynamic Item ${i + 1}")),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ------------------------------------------------------------
          // 3. LISTTILE
          // ------------------------------------------------------------
          _box(
            title: "ListTile",
            description:
                "List ka ready-made row widget.\n"
                "Left icon + title + subtitle + right icon ek hi line me.",
            child: const ListTile(
              leading: Icon(Icons.person),
              title: Text("Manoj Kumar"),
              subtitle: Text("Flutter Developer"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),

          const SizedBox(height: 16),

          // ------------------------------------------------------------
          // 4. SINGLECHILD SCROLL VIEW
          // ------------------------------------------------------------
          _box(
            title: "SingleChildScrollView",
            description:
                "Jab content kaafi long ho aur ek column me ho,\n"
                "tab isse scrolling milti hai.\n"
                "Lists ke liye nahi use karna chahiye.",
            child: SizedBox(
              height: 120,
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

          // ------------------------------------------------------------
          // 5. GRIDVIEW
          // ------------------------------------------------------------
          _box(
            title: "GridView",
            description:
                "GridView rows + columns me items dikhata hai.\n"
                "Gallery, product grid, cards ke liye useful.",
            child: SizedBox(
              height: 150,
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

          // ------------------------------------------------------------
          // 6. GRIDVIEW.BUILDER
          // ------------------------------------------------------------
          _box(
            title: "GridView.builder",
            description:
                "Dynamic grid banane ke liye best.\n"
                "Large data ya products ke liye ideal.",
            child: SizedBox(
              height: 150,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

          // ------------------------------------------------------------
          // 7. PAGEVIEW
          // ------------------------------------------------------------
          _box(
            title: "PageView",
            description:
                "Swipeable pages banane ke liye.\n"
                "Onboarding, carousel, sliders ke liye perfect.",
            child: SizedBox(
              height: 150,
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

          // ------------------------------------------------------------
          // 8. SCROLLBAR
          // ------------------------------------------------------------
          _box(
            title: "Scrollbar",
            description:
                "Scrollbar visible scroll indicator deta hai.\n"
                "Long scrollable content me useful.",
            child: SizedBox(
              height: 150,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (_, i) => Text("Item ${i + 1}"),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ------------------------------------------------------------
          // 9. CUSTOM SCROLL VIEW + SLIVER APPBAR
          // ------------------------------------------------------------
          _box(
            title: "CustomScrollView + SliverAppBar",
            description:
                "Advanced scrolling layouts.\n"
                "Collapsing AppBar, custom scroll effects ke liye use hota hai.",
            child: SizedBox(
              height: 200,
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text("Sliver AppBar"),
                    floating: true,
                    backgroundColor: Colors.orange,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Sliver Item ${i + 1}"),
                      ),
                      childCount: 5,
                    ),
                  ),
                ],
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
