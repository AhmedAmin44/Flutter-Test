import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/core/utils/app_string.dart';
import 'package:interview/features/home/presentation/cubit/home_cubit.dart';
import 'package:interview/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:interview/features/home/presentation/widgets/search_field.dart';
import 'package:interview/features/home/presentation/widgets/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onSearchPressed: () {},
        title: AppStrings.searchView,
        isSearch: false,
        isArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              controller: _searchController,
              onSearch: () => _performSearch(context),
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: SearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  void _performSearch(BuildContext context) {
    if (_searchController.text.isNotEmpty) {
      context.read<ProductCubit>().searchProducts(_searchController.text);
    }
  }
}