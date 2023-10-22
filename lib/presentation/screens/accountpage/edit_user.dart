import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stepout/presentation/core/constants.dart';

class EditUserPage extends StatelessWidget {
  EditUserPage({super.key, required this.displayName});
  final nameController = TextEditingController();
  final String? displayName;
  @override
  Widget build(BuildContext context) {
    // final String? name = FirebaseAuth.instance.currentUser!.displayName;
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    nameController.text = displayName.toString();
    return AlertDialog(
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Stack(
                  children: [
                    Image.network(
                      image.toString(),
                      fit: BoxFit.cover,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        child: Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),
                radius: 50,
              ),
            ),
            kheight20,
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              
              // FirebaseAuth.instance.currentUse
              Navigator.of(context).pop();
            },
            child: const Text('SUBMIT')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL'))
      ],
    );
  }
}
