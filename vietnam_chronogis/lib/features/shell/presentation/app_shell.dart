import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../../map/presentation/map_view_screen.dart';
import '../../explorer/presentation/explorer_screen.dart';
import '../../map/presentation/widgets/timeline_panel.dart';
import '../../ai_chat/presentation/ai_insights_screen.dart';

import '../../../shared/providers/map_provider.dart';
import '../../../core/database/app_database.dart';

// FIX: StateProvider<int> đã bị xóa trong Riverpod 3.x
// Migration: StateProvider → Notifier + NotifierProvider
class SelectedTab extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}

final selectedTabProvider = NotifierProvider<SelectedTab, int>(SelectedTab.new);

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(selectedTabProvider);
    final isSidebarExpanded = MediaQuery.of(context).size.width >= 1000;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildNavigationRail(selectedTab),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: isSidebarExpanded ? 280 : 0,
                  child: const SidebarWidget(),
                ),
                Expanded(child: _buildMainContent(selectedTab)),
              ],
            ),
          ),
          if (selectedTab == 0) const TimelinePanel(),
        ],
      ),
    );
  }

  Widget _buildNavigationRail(int selectedTab) {
    return NavigationRail(
      selectedIndex: selectedTab,
      onDestinationSelected: (index) {
        // FIX: dùng .select() thay vì .state = (state là @protected trong Notifier)
        ref.read(selectedTabProvider.notifier).select(index);
      },
      backgroundColor: const Color(0xFF1A1D23),
      indicatorColor: const Color(0xFF2D5A8E),
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.map), label: Text('Map')),
        NavigationRailDestination(
          icon: Icon(Icons.explore),
          label: Text('Explorer'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.book),
          label: Text('Archives'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.smart_toy),
          label: Text('AI'),
        ),
      ],
    );
  }

  Widget _buildMainContent(int selectedTab) {
    return IndexedStack(
      index: selectedTab,
      children: const [
        MapViewScreen(),
        ExplorerScreen(),
        Center(child: Text('Archives Placeholder')),
        AiInsightsScreen(),
      ],
    );
  }
}

class SidebarWidget extends ConsumerStatefulWidget {
  const SidebarWidget({super.key});

  @override
  ConsumerState<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends ConsumerState<SidebarWidget> {
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
    final searchQuery = ref.watch(mapSearchQueryProvider);

    // Sync input field if cleared from other providers
    if (searchQuery.isEmpty && _searchController.text.isNotEmpty) {
      _searchController.text = '';
    }

    final searchResultsAsync = ref.watch(mapSearchResultsProvider);
    final savedAdministrativeUnitsAsync = ref.watch(
      savedAdministrativeUnitsProvider,
    );

    return Container(
      color: const Color(0xFF1A1D23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Administrative Search',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search province...',
              hintStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white38, fontSize: 14),
              ),
              textStyle: const WidgetStatePropertyAll(
                TextStyle(color: Colors.white, fontSize: 14),
              ),
              backgroundColor: const WidgetStatePropertyAll(Color(0xFF12151C)),
              leading: const Icon(
                Icons.search,
                color: Colors.white54,
                size: 20,
              ),
              trailing: [
                if (searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white54,
                      size: 18,
                    ),
                    onPressed: () {
                      ref.read(mapSearchQueryProvider.notifier).updateQuery('');
                      _searchController.clear();
                    },
                  ),
              ],
              onChanged: (value) {
                ref.read(mapSearchQueryProvider.notifier).updateQuery(value);
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: searchQuery.isNotEmpty
                ? _buildSearchResults(searchResultsAsync)
                : _buildSavedLocations(savedAdministrativeUnitsAsync),
          ),
          const Divider(height: 1, color: Colors.white12),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Database Sync Online',
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    AsyncValue<List<AdministrativeUnit>> resultsAsync,
  ) {
    return resultsAsync.when(
      data: (results) {
        if (results.isEmpty) {
          return const Center(
            child: Text(
              'Không tìm thấy địa điểm',
              style: TextStyle(color: Colors.white38, fontSize: 13),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: results.length,
          itemBuilder: (context, index) {
            final unit = results[index];
            return _buildUnitTile(unit);
          },
        );
      },
      loading: () => const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (e, s) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Error: $e',
            style: const TextStyle(color: Colors.redAccent, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedLocations(
    AsyncValue<List<AdministrativeUnit>> savedUnitsAsync,
  ) {
    return savedUnitsAsync.when(
      data: (savedUnits) {
        if (savedUnits.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bookmark_outline, color: Colors.white24, size: 36),
                SizedBox(height: 8),
                Text(
                  'Chưa có địa điểm đã lưu',
                  style: TextStyle(color: Colors.white38, fontSize: 13),
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'ĐỊA ĐIỂM ĐÃ LƯU',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: savedUnits.length,
                itemBuilder: (context, index) {
                  return _buildUnitTile(savedUnits[index]);
                },
              ),
            ),
          ],
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      error: (e, s) => const SizedBox.shrink(),
    );
  }

  Widget _buildUnitTile(AdministrativeUnit unit) {
    return ListTile(
      dense: true,
      title: Text(
        unit.ten,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        unit.type.toUpperCase(),
        style: const TextStyle(color: Colors.white38, fontSize: 11),
      ),
      leading: const Icon(
        Icons.location_on_outlined,
        color: Colors.white54,
        size: 20,
      ),
      onTap: () {
        ref.read(selectedProvinceProvider.notifier).select(unit.ma);
        if (unit.centroidLat != null && unit.centroidLon != null) {
          ref
              .read(mapControllerStateProvider)
              .move(
                LatLng(unit.centroidLat!, unit.centroidLon!),
                unit.kind == 'commune' ? 12.0 : 8.5,
              );
        }
      },
    );
  }
}
