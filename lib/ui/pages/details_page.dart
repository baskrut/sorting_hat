import 'package:flutter/material.dart';
import 'package:sorting_hat/models/answered_model.dart';
import 'package:sorting_hat/models/character_model.dart';
import 'package:sorting_hat/ui/widgets/avatar_widget.dart';

class DetailsPage extends StatelessWidget {
  static const String id = '/DetailsPage';

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as AnsweredModel;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: const Row(
                children: [Icon(Icons.arrow_back_ios_new_rounded), Text('Back')],
              )),
        ),
        centerTitle: true,
        title: Text(character.name ?? 'not specified'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarWidget(url: character.image ?? ''),
            const SizedBox(
              width: 16.0,
            ),
            character.isSuccess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('House: ${character.house == Houses.other ? 'Not in House' : character.house?.name}'),
                      Text('Date of birth: ${character.dateOfBirth ?? ''}'),
                      Text('Actor: ${character.actor ?? ''}'),
                      Text('Species: ${character.species ?? ''}'),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                      child: Text(
                        'ACCESS DENIED',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
