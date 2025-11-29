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

class _InputWidgetsPageState extends State<InputWidgetsPage> {
  // States for widgets
  bool checkValue = false;
  bool switchValue = false;
  String? selectedGender = "Male";
  double sliderValue = 20;
  String dropdownValue = "India";

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Widgets"),
        backgroundColor: Colors.green,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -----------------------------------------------------------
          // 1. TEXTFIELD
          // -----------------------------------------------------------
          _box(
            title: "TextField",
            description:
                "Simple text input ke liye use hota hai.\n"
                "Username, search bar ya simple form fields ke liye perfect.",
            child: const TextField(
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 2. TEXTFORMFIELD (with validation)
          // -----------------------------------------------------------
          _box(
            title: "TextFormField",
            description:
                "TextField ka upgraded version.\n"
                "Validation + Form ke sath work karta hai.",
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
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
          _box(
            title: "Checkbox",
            description:
                "Checkbox multiple options ko ON/OFF karne ke liye use hota hai.\n"
                "True/False type input deta hai.",
            child: Checkbox(
              value: checkValue,
              onChanged: (v) => setState(() => checkValue = v ?? false),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 4. SWITCH
          // -----------------------------------------------------------
          _box(
            title: "Switch",
            description:
                "Switch ek toggle button hota hai.\n"
                "Night mode, notifications ON/OFF jaise features me use hota hai.",
            child: Switch(
              value: switchValue,
              onChanged: (v) => setState(() => switchValue = v),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 5. RADIO BUTTON
          // -----------------------------------------------------------
          _box(
            title: "Radio",
            description:
                "Radio button ek hi option choose karne ke liye hota hai.\n"
                "Gender, payment method jaisi choices ke liye perfect.",
            child: Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v),
                ),
                const Text("Male"),
                const SizedBox(width: 20),
                Radio(
                  value: "Female",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v),
                ),
                const Text("Female"),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 6. SLIDER
          // -----------------------------------------------------------
          _box(
            title: "Slider",
            description:
                "Slider drag karne par value change karta hai.\n"
                "Volume, brightness ya rating jaisi cheezein control karne me use hota hai.",
            child: Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => sliderValue = v),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 7. DROPDOWN
          // -----------------------------------------------------------
          _box(
            title: "Dropdown",
            description:
                "Dropdown list me se ek option choose karne ke liye use hota hai.\n"
                "Country, City, Category selection me useful.",
            child: DropdownButton<String>(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(value: "India", child: Text("India")),
                DropdownMenuItem(value: "USA", child: Text("USA")),
                DropdownMenuItem(value: "Japan", child: Text("Japan")),
              ],
              onChanged: (v) => setState(() => dropdownValue = v!),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 8. DATE PICKER
          // -----------------------------------------------------------
          _box(
            title: "Date Picker",
            description:
                "Date picker calendar open karta hai.\n"
                "Birthday, booking, appointment date select karne me use hota hai.",
            child: ElevatedButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                );

                setState(() => selectedDate = date);
              },
              child: Text(
                selectedDate == null
                    ? "Pick a Date"
                    : "Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              ),
            ),
          ),

          const SizedBox(height: 16),

          // -----------------------------------------------------------
          // 9. TIME PICKER
          // -----------------------------------------------------------
          _box(
            title: "Time Picker",
            description:
                "Time picker clock open karta hai.\n"
                "Alarm, notification time set karne me useful.",
            child: ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                setState(() => selectedTime = time);
              },
              child: Text(
                selectedTime == null
                    ? "Pick a Time"
                    : "Selected: ${selectedTime!.hour}:${selectedTime!.minute}",
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ===========================================================================
  // REUSABLE BOX UI
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
