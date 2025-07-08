import 'package:flutter/material.dart';
import 'package:portfolio/data/appdata.dart';
import 'package:portfolio/education_info.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<bool?> selectedValues = List<bool?>.filled(skills.length, false);
  List<String> selectedSkills = [];
  Map<String, String> skillRatings = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF4FF),
      appBar: AppBar(
        title: const Text(
          'Skills Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 42, 20, 103),
        elevation: 5,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
              child: Text(
                '3. Select Skills',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  final isSelected = selectedValues[index] ?? false;

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(skill),
                          value: isSelected,
                          activeColor: Colors.deepPurple,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (value) {
                            setState(() {
                              selectedValues[index] = value;
                              if (value == true) {
                                selectedSkills.add(skill);
                                skillRatings[skill] = ratings.first;
                              } else {
                                selectedSkills.remove(skill);
                                skillRatings.remove(skill);
                              }
                            });
                          },
                        ),
                        if (isSelected)
                          Column(
                            children: ratings.map((rating) {
                              return RadioListTile<String>(
                                title: Text(rating),
                                value: rating,
                                groupValue: skillRatings[skill],
                                onChanged: (value) {
                                  setState(() {
                                    skillRatings[skill] = value!;
                                  });
                                },
                                activeColor: Colors.purple,
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EducationInfo()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text("Next Page", style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

