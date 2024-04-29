import 'package:flutter/material.dart';

import '../components/comment_form.dart';
import '../components/contact_icons.dart';
import '../components/person_details.dart';

class ThirdPage extends StatefulWidget {
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
  void initState() {
    super.initState();
    commentController.addListener(() {
      setState(() {
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
  void dispose() {
    commentController.dispose();
    dayInputController.dispose();
    super.dispose();
  }

  void changeCurrentDropDownValue(String newValue) {
    setState(() {
      currentDropDownValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView(
        children: [
          PersonDetails(context: context),
          ((currentDropDownValue == 'one' || currentDropDownValue == 'two')
              ? ContactIcons(context: context)
              : Container(
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.tertiary),
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.tertiary))),
                )),
          CommentForm(
            currentDropDownValue: currentDropDownValue,
            currentComment: currentComment,
            commentInputController: commentController,
            changeCurrentDropDownValue: changeCurrentDropDownValue,
            dayInputController: dayInputController,
            context: context,
          ),
        ],
      ),
    );
  }
}
