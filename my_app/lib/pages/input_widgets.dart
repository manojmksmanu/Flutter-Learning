import 'package:flutter/material.dart';

/// ===========================================================================
/// INPUT WIDGETS PAGE
///
/// Input widgets ka kaam hota hai user se data lena:
///
/// ✔ TextField – normal text input
/// ✔ TextFormField – validation ke sath input
/// ✔ Checkbox – true/false input
/// ✔ Switch – toggle on/off
/// ✔ Radio – single option selection
/// ✔ Slider – value drag karke set karna
/// ✔ Dropdown – list me se choose karna
/// ✔ DatePicker – date select karna
/// ✔ TimePicker – time select karna
///
/// Yeh page saare input widgets ko explain karta hai.
/// ===========================================================================

class InputWidgetsPage extends StatefulWidget {
  const InputWidgetsPage({super.key});

  @override
  State<InputWidgetsPage> createState() => _InputWidgetsPageState();
}

class _InputWidgetsPageState extends State<InputWidgetsPage>
    with SingleTickerProviderStateMixin {
  // States for widgets
  bool checkValue = false;
  bool switchValue = false;
  String? selectedGender = "Male";
  double sliderValue = 20;
  String dropdownValue = "India";

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    /// Animation Controller setup
    /// Page load hone pe fade-in animation ke liye
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    /// Fade Animation banaya (0 se 1 tak)
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    /// Animation start
    _controller.forward();
  }

  @override
  void dispose() {
    /// Memory leak avoid karne ke liye cleanup
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      /// Custom Scrollable View with SliverAppBar
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // iOS-style smooth scroll
        slivers: [
          /// SliverAppBar: Expandable gradient header
          SliverAppBar(
            expandedHeight: 160,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFF59E0B),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Input Widgets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFFF59E0B), const Color(0xFFFBBF24)],
                  ),
                ),
                child: Stack(
                  children: [
                    /// Decorative circles
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
                            Icons.edit_note,
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

          /// SliverPadding: Content with padding
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      /// Info Banner
                      _buildInfoBanner(),
                      const SizedBox(height: 20),

                      // -----------------------------------------------------------
                      // 1. TEXTFIELD
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 100,
                        title: "TextField",
                        icon: Icons.text_fields,
                        iconColor: const Color(0xFFF59E0B),
                        description:
                            "TextField is used for simple text input.\n"
                            "Good for username fields, search bars, or basic forms.",
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter your name",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFFF59E0B),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 2. TEXTFORMFIELD (with validation)
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 200,
                        title: "TextFormField",
                        icon: Icons.email,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "TextFormField is an advanced version of TextField.\n"
                            "It works with forms and supports validation.",
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF10B981),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return "Email required";
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 3. CHECKBOX
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 300,
                        title: "Checkbox",
                        icon: Icons.check_box,
                        iconColor: const Color(0xFF6366F1),
                        description:
                            "A Checkbox lets the user turn an option ON or OFF.\n"
                            "It gives a simple true/false input.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF6366F1).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: checkValue,
                                activeColor: const Color(0xFF6366F1),
                                onChanged: (v) =>
                                    setState(() => checkValue = v ?? false),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  checkValue
                                      ? "Checkbox is checked ✓"
                                      : "Click to check the box",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 4. SWITCH
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 400,
                        title: "Switch",
                        icon: Icons.toggle_on,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "A Switch is a toggle button.\n"
                            "Used for things like enabling notifications or dark mode.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8B5CF6).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Enable Notifications",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    switchValue ? "Enabled" : "Disabled",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: switchValue,
                                activeColor: const Color(0xFF8B5CF6),
                                onChanged: (v) =>
                                    setState(() => switchValue = v),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 5. RADIO BUTTON
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 500,
                        title: "Radio",
                        icon: Icons.radio_button_checked,
                        iconColor: const Color(0xFFEC4899),
                        description:
                            "A Radio button lets the user pick only one option.\n"
                            "Useful for things like choosing gender or payment method.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC4899).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEC4899).withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Select Gender:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Male",
                                    groupValue: selectedGender,
                                    activeColor: const Color(0xFFEC4899),
                                    onChanged: (v) =>
                                        setState(() => selectedGender = v),
                                  ),
                                  const Text("Male"),
                                  const SizedBox(width: 20),
                                  Radio(
                                    value: "Female",
                                    groupValue: selectedGender,
                                    activeColor: const Color(0xFFEC4899),
                                    onChanged: (v) =>
                                        setState(() => selectedGender = v),
                                  ),
                                  const Text("Female"),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEC4899),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Selected: $selectedGender",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 6. SLIDER
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 600,
                        title: "Slider",
                        icon: Icons.tune,
                        iconColor: const Color(0xFF3B82F6),
                        description:
                            "A Slider changes a value when you drag it.\n"
                            "Commonly used for volume, brightness, or rating controls.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B82F6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF3B82F6).withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Volume Level:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3B82F6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${sliderValue.toInt()}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Slider(
                                value: sliderValue,
                                min: 0,
                                max: 100,
                                activeColor: const Color(0xFF3B82F6),
                                onChanged: (v) =>
                                    setState(() => sliderValue = v),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 7. DROPDOWN
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 700,
                        title: "Dropdown",
                        icon: Icons.arrow_drop_down_circle,
                        iconColor: const Color(0xFFEF4444),
                        description:
                            "A Dropdown lets the user choose one option from a list.\n"
                            "Useful for selecting country, city, or categories.",
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFEF4444).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Select Country:",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFFEF4444),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: "India",
                                    child: Text("🇮🇳 India"),
                                  ),
                                  DropdownMenuItem(
                                    value: "USA",
                                    child: Text("🇺🇸 USA"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Japan",
                                    child: Text("🇯🇵 Japan"),
                                  ),
                                ],
                                onChanged: (v) =>
                                    setState(() => dropdownValue = v!),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 8. DATE PICKER
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 800,
                        title: "Date Picker",
                        icon: Icons.calendar_today,
                        iconColor: const Color(0xFF10B981),
                        description:
                            "A Date Picker opens a calendar to choose a date.\n"
                            "Used for selecting birthdays, bookings, or appointments.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF10B981).withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (selectedDate != null)
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF10B981),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF10B981),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      initialDate: DateTime.now(),
                                    );
                                    setState(() => selectedDate = date);
                                  },
                                  icon: const Icon(Icons.calendar_month),
                                  label: Text(
                                    selectedDate == null
                                        ? "Pick a Date"
                                        : "Change Date",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // -----------------------------------------------------------
                      // 9. TIME PICKER
                      // -----------------------------------------------------------
                      _AnimatedWidgetBox(
                        delay: 900,
                        title: "Time Picker",
                        icon: Icons.access_time,
                        iconColor: const Color(0xFF8B5CF6),
                        description:
                            "A Time Picker opens a clock to pick a time.\n"
                            "Useful for setting alarms or reminder times.",
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF8B5CF6).withOpacity(0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (selectedTime != null)
                                Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8B5CF6),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.alarm,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Selected: ${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF8B5CF6),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () async {
                                    TimeOfDay? time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    setState(() => selectedTime = time);
                                  },
                                  icon: const Icon(Icons.schedule),
                                  label: Text(
                                    selectedTime == null
                                        ? "Pick a Time"
                                        : "Change Time",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
  /// Learning tip banner
  /// ===========================================================================
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFF59E0B).withOpacity(0.1),
            const Color(0xFFFBBF24).withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFF59E0B).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.info, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Interactive Inputs",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF59E0B),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Try each widget and see how it works when you interact with it!",
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
/// Reusable animated card component
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

    /// Animation Controller
    /// Har card apni delay ke baad animate hoga
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    /// Scale animation with bounce
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    /// Delayed start
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
              /// Title Row with Icon Badge
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

              /// Description
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              /// Divider
              Container(height: 1, color: Colors.black.withOpacity(0.1)),

              const SizedBox(height: 16),

              /// Example Label
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
                      "INTERACTIVE",
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

              /// Actual widget
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
