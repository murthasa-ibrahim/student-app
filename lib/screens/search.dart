import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_student_app/providers/search_provider.dart';
import 'package:getx_student_app/screens/student_details.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.read<SearchProvider>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => searchProvider.filterSearch(value),
              controller: searchProvider.searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchProvider.searchController.clear();
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                  fillColor: Colors.teal,
                  filled: true,
                  hintText: 'Type something...',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            Expanded(
                child: Consumer<SearchProvider>(
              builder: (context, value, child) => ListView.builder(
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: value.tempList.length,
                  itemBuilder: (context, index) {
                    final details = value.tempList[index];
                    return ListTile(
                      leading: details.imagString.isEmpty
                          ? const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage('asset/image/userimage.jpg'))
                          : CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black,
                              backgroundImage: MemoryImage(const Base64Decoder()
                                  .convert(details.imagString))),
                      title: Text(details.name),
                      subtitle: Text(details.name),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentDetails(details: details),
                      )),
                    );
                  }),
            ))
          ],
        ),
      )),
    );
  }
}
