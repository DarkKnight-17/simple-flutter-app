
import 'package:flutter/material.dart';




class ContactIcons extends StatelessWidget {
 final BuildContext context;
  const ContactIcons({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 1
              ),
              bottom:BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 1
              )
          )
      ),
      padding:const  EdgeInsets.only(top: 30, bottom: 30),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            singleContactIcon(Icons.phone),
            singleContactIcon(Icons.message),
          ],
        ),
      ),
    );

  }


  Widget singleContactIcon(IconData _icon){
    return Container(
      decoration:  BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(5),
      child: IconButton(
        onPressed: (){},
        icon: Icon(_icon, size: 30),
        color: Theme.of(context).colorScheme.onPrimary,

      ),
    );
  }
}
