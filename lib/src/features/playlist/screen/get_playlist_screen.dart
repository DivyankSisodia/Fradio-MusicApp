import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayListScreen extends StatefulWidget {
  static const String routeName = '/playlist-track';
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  final ScrollController _scrollController = ScrollController();
  double _searchBarHeight = 0;
  final double _maxSearchBarHeight = 60;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset < 0 && offset > -60) {
      setState(() {
        _searchBarHeight = -offset.clamp(0.0, _maxSearchBarHeight);
      });
    } else if (offset >= 0 && _searchBarHeight != 0) {
      setState(() {
        _searchBarHeight = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B6E1B), // Olive green background
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://i.scdn.co/image/ab67616d00001e0244d3ba1bb25084d20dc66d52',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    // ... rest of your content
                  ],
                ),
              ),
              // ... rest of your list
            ],
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              height: _searchBarHeight,
              color: const Color(0xFF6B6E1B).withOpacity(0.8),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find on this page',
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.sort, color: Colors.white),
                    onPressed: () {
                      // Implement sort functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
