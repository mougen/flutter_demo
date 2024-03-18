import 'package:demo/app/detail_screen.dart';
import 'package:demo/models/contact_model.dart';
import 'package:demo/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerData = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts"),
      ),
      body: providerData.when(
          data: (providerData) {
            List<ContactModel> contactList =
                providerData.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (contactList.isEmpty)
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No contacts'),
                          Text('to add some, visit:'),
                          Text(
                            'nanashikenta.pythonanywhere.com',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text('then refresh'),
                        ],
                      ),
                    )
                  else
                    Expanded(
                        child: ListView.builder(
                            itemCount: providerData.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            c: providerData[index]))),
                                child: Card(
                                  color: Colors.blue,
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    title: Text(
                                        '${contactList[index].firstname} - ${contactList[index].lastname}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ),
                              );
                            }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(conatctProvider);
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
