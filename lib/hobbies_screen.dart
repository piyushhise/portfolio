import 'package:flutter/material.dart';
import 'package:portfolio/contact_screen.dart';
import 'package:portfolio/data/appdata.dart';

class HobbiesAndInterestsScreen extends StatefulWidget {
  const HobbiesAndInterestsScreen({super.key});

  @override
  State<HobbiesAndInterestsScreen> createState() =>
      _HobbiesAndInterestsScreenState();
}

class _HobbiesAndInterestsScreenState
    extends State<HobbiesAndInterestsScreen> {
  final _formKey = GlobalKey<FormState>();
  final otherHobbyController = TextEditingController();

  List<bool?> selectedValues = List<bool?>.filled(hobbies.length, false);
  List<String> selectedHobbies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      appBar: AppBar(
        title: const Text(
          "Hobbies & Interests",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2A1467),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
                child: Text(
                  '3. Select hobbies',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: hobbies.length,
                  itemBuilder: (context, index) {
                    final hobby = hobbies[index];
                    final isSelected = selectedValues[index] ?? false;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: CheckboxListTile(
                        title: Text(hobby),
                        value: isSelected,
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() {
                            selectedValues[index] = value;
                            if (value == true) {
                              selectedHobbies.add(hobby);
                            } else {
                              selectedHobbies.remove(hobby);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              
              if (selectedHobbies.contains("Other"))
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _buildInputField(
                    label: "Enter other hobbies",
                    controller: otherHobbyController,
                    icon: Icons.sports_handball,
                    validatorMsg: "Please enter your custom hobby",
                    maxLines: 2,
                  ),
                ),

              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add custom hobby if entered
                      if (selectedHobbies.contains("Other") &&
                          otherHobbyController.text.isNotEmpty) {
                        selectedHobbies
                            .add(otherHobbyController.text.trim());
                      }

                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String validatorMsg,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (selectedHobbies.contains("Other") &&
              (value == null || value.trim().isEmpty)) {
            return validatorMsg;
          }
          return null;
        },
      ),
    );
  }
}
