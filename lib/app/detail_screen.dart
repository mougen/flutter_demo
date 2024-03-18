import 'package:demo/models/contact_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.c});
  final ContactModel c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:  ${c.firstname} - ${c.lastname}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Gender:  ${c.gender == 'M' ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'DoB:  ${c.dob}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Address:  ${c.address}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Email:  ${c.email}',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
