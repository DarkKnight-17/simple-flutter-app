import 'package:flutter/material.dart';

import '../components/third_page_components.dart';
class ThirdPage extends StatefulWidget{
  const ThirdPage({super.key});


  @override
  State<ThirdPage> createState() => ThirdPageState();
}



class ThirdPageState extends State<ThirdPage> {
  String currentDropDownValue = 'one';
  String? currentOptionalNumberOfDays;
   String? currentComment;
   TextEditingController commentController = TextEditingController();
   TextEditingController dayInputController = TextEditingController();
   @override
   void initState(){
     super.initState();
   commentController.addListener(() {
     setState((){
  currentComment = commentController.text;
  });
  });

   dayInputController.addListener(() {
     setState(() {
       currentOptionalNumberOfDays = dayInputController.text;
     });
   });
   }

   @override
   void dispose(){
     commentController.clear();
     dayInputController.clear();
     super.dispose();
   }

  void changeCurrentValue(String newValue){
    setState(() {
      currentDropDownValue = newValue;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
              personDetails(),
              ((currentDropDownValue == 'one' || currentDropDownValue == 'two')
                  ? contactIcons()
                  : Container(
                height: 40,
                   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                   decoration: const BoxDecoration(
          
                     border: Border(
                       top: BorderSide(
                         width: 1, color: Colors.grey
                       ),
                       bottom: BorderSide(
                         width: 1, color: Colors.grey
                       )
                     )
                   ) ,
              )),
          
              commentForms(currentDropDownValue,
                  currentComment,
                  commentController,
                  changeCurrentValue,
                  dayInputController,
              ),
            ],
          ),
    );
  }
}
