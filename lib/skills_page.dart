import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "select skills",
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),


              ),
              Expanded(child: 
              child:listView.builder(
                itemCount:skills.length,
                itemBuilder:(context,index){
                  final skill = skills[index];
                  return Card(
                    color:Colors.white,
                    shape:RoundedRectangleBorder( 
                      borderRadius:BorderradiusGemoetry.circular(15),

                    ),
                    margin:EdgeInsets.all(8),
                    child:CheckboxListTitle(
                      title:Text(skill),
                      value  
                    )
                  )
                }))\
                if(selectedValues[index] ?? false)
                Column(
                  children:ratings.map((ratings){
                    return RadioListTitle<string>)( 
                      tite:Text(ratings),
                      value:rating,
                      groupValue:selectedRating,
                      onchanged:(value){
                        setState(() {
                          selectedRating = value;
                        });
                        print(selectedRating);
                      },
                      activeColor:colors.blue,
                      toggleable:false,
                    );
                  })toList(),
                  
                )            ],
          ),
        ),
      ),
    );
  }
}