import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediweb/providers/textfields/token_textfield.dart';

import '../../widgets/buttons/primary_button.dart';

class Admin extends ConsumerWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(tokenProvider);
    return Center(
      child: Scaffold(
          body: Center(
        child: SizedBox(
          width: 750,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TokenTextfield(),
              const SizedBox(height: 10),
              PrimaryButton(
                title: 'Set Token',
                initalTextColor: Colors.white,
                initialBgColor: const Color.fromARGB(238, 58, 135, 229),
                hoverInColor: Colors.black,
                hoverInBgColor: Colors.white,
                hoverOutColor: Colors.white,
                hoverOutBgColor: const Color.fromARGB(238, 58, 135, 229),
                onPressed: () {
            final adminInfo =
        FirebaseFirestore.instance.collection('admin').doc('my-admin');

    //update fields ({
    adminInfo.update({
      'token': data,
   
    });
                },
              ),
              const SizedBox(height: 10),
              Text(data)
            ],
          ),
        ),
      )),
    );
  }
}
