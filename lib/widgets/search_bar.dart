import 'package:flutter/material.dart';
import 'package:local_restaurants/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarrState();
}

class _SearchBarrState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context, listen: true);

    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).devicePixelRatio * 120,
      child: TextField(
        onSubmitted: ((value) => searchProvider.setFilteredCountry(value)),
        controller: _controller,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: 'Ingresa el país que deseas buscar.',
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: GestureDetector(
              onTap: () =>
                  {searchProvider.setFilteredCountry(_controller.text)},
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
