import 'package:flutter/material.dart';
import 'package:newwave_solution/presenters/widgets/suggest_text_widgets.dart';
import 'package:newwave_solution/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: searchText,
                        onChanged: (value) {
                          searchProvider
                              .searchLocations(searchText.text.toString());
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'Enter Keyword',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 13.0),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchText.clear();
                                });
                                searchProvider.searchLocations('');
                              },
                              icon: const Icon(Icons.cancel_outlined)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchProvider.locationSuggest.items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            searchProvider.selectedLocation(searchProvider
                                .locationSuggest.items[index].id!);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.place_outlined,
                                  color: Colors.black),
                              Expanded(
                                  flex: (searchProvider.locationSuggest
                                              .items[index].title!.length >
                                          30)
                                      ? 4
                                      : 1, // Avoid overflowed bugs with Text
                                  child: suggestText(
                                      context,
                                      searchText,
                                      searchProvider.locationSuggest
                                          .items[index].title!)),
                              const Spacer(),
                              const Icon(Icons.turn_right_sharp)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
