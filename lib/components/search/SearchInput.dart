import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/search/searchbar.dart';
import '../../../utils/app_colors.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  List<String> recentSearches = ['Web design', 'Graphics design'];

  void _removeItem(String title) {
    setState(() {
      recentSearches.remove(title);
    });
  }

  void _clearAll() {
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
                  child: Searchbar(),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox.shrink(),
            ),
          ),

          // Recent Searches
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                      if (recentSearches.isNotEmpty)
                        GestureDetector(
                          onTap: _clearAll,
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
                ...recentSearches.map((title) => _buildRecentItem(title)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentItem(String title) {
    return ListTile(
      leading: Icon(Icons.history, color: Colors.black54),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close, color: Colors.black54),
        onPressed: () => _removeItem(title),
      ),
      onTap: () {
        // Optional: handle tap on recent search
      },
    );
  }
}
