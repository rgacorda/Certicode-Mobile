import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/search/searchbar.dart';
import '../../../utils/app_colors.dart';
import '../../features/home/models/seminar_model.dart';
import '../../services/seminar_service.dart';
import '../card/cardBusiness.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  List<Seminar> seminars = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';
  List<String> recentSearches = ['Git', 'Javascript']; // Optional defaults

  @override
  void initState() {
    super.initState();
    _fetchAllSeminars();
  }

  Future<void> _fetchAllSeminars() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final data = await SeminarService().fetchSeminars();
      setState(() {
        seminars = data;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load seminars';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _liveSearch(String query) async {
    await _searchSeminars(query, saveToRecent: false);
  }

  Future<void> _finalSearch(String query) async {
    await _searchSeminars(query, saveToRecent: true);
  }


  Future<void> _searchSeminars(String query, {bool saveToRecent = false}) async {
    if (query.isEmpty) {
      _fetchAllSeminars();
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final data = await SeminarService().searchSeminars(query);
      setState(() {
        seminars = data;

        if (saveToRecent && !recentSearches.contains(query)) {
          recentSearches.insert(0, query);
          if (recentSearches.length > 5) recentSearches.removeLast();
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Search failed';
        seminars = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  void _removeSearch(String title) {
    setState(() {
      recentSearches.remove(title);
    });
  }

  void _clearAllSearches() {
    setState(() {
      recentSearches.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 60.0,
            floating: true,
            pinned: true,
            title: Row(
              children: [
                Expanded(
                  child: Searchbar(
                    controller: searchController,
                    onChanged: _liveSearch,
                    onSubmitted: _finalSearch,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Recent Searches Section
                if (recentSearches.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Searches',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: _clearAllSearches,
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ...recentSearches.map((title) => ListTile(
                  leading: Icon(Icons.history, color: Colors.black54),
                  title: Text(title, style: TextStyle(color: Colors.black87)),
                  trailing: IconButton(
                    icon: Icon(Icons.close, color: Colors.black54),
                    onPressed: () => _removeSearch(title),
                  ),
                  onTap: () {
                    searchController.text = title;
                    _searchSeminars(title);
                  },
                )),

                // Loading, Error, or Results
                if (isLoading)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                if (!isLoading && seminars.isEmpty && errorMessage.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('No seminars found.'),
                  ),
                ...seminars.map((seminar) => CardBusiness(seminar: seminar)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

