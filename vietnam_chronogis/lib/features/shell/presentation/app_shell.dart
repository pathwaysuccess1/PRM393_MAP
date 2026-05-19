import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../map/presentation/map_view_screen.dart';
import '../../map/presentation/widgets/timeline_panel.dart';
import '../../ai_chat/presentation/ai_insights_screen.dart';
import '../../explorer/presentation/explorer_screen.dart';
import '../../archives/presentation/archives_screen.dart';
import '../../map/presentation/widgets/admin_search_bar.dart';
import '../../map/presentation/widgets/search_results_list.dart';
import '../../map/presentation/widgets/region_list_widget.dart';
import '../../settings/presentation/settings_drawer.dart';
import '../../../shared/providers/search_provider.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  final _searchBarKey = GlobalKey<AdminSearchBarState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(selectedTabProvider);
    final isSidebarExpanded = MediaQuery.of(context).size.width >= 1000;

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.keyF, control: true): () {
          _searchBarKey.currentState?.requestFocus();
        },
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: const SettingsDrawer(),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _buildNavigationRail(selectedTab),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isSidebarExpanded ? 280 : 0,
                      child: _SidebarWidget(searchBarKey: _searchBarKey),
                    ),
                    Expanded(
                      child: _buildMainContent(selectedTab),
                    ),
                  ],
                ),
              ),
              if (selectedTab == 0) const TimelinePanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationRail(int selectedTab) {
    return NavigationRail(
      selectedIndex: selectedTab,
      onDestinationSelected: (index) {
        ref.read(selectedTabProvider.notifier).state = index;
      },
      backgroundColor: const Color(0xFF1A1D23),
      indicatorColor: const Color(0xFF2D5A8E),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: IconButton(
              icon: const Icon(Icons.settings, size: 22),
              color: const Color(0xFF9AA0B0),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              tooltip: 'Cài đặt',
            ),
          ),
        ),
      ),
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.map), label: Text('Map')),
        NavigationRailDestination(
            icon: Icon(Icons.explore), label: Text('Explorer')),
        NavigationRailDestination(
            icon: Icon(Icons.book), label: Text('Archives')),
        NavigationRailDestination(
            icon: Icon(Icons.smart_toy), label: Text('AI')),
      ],
    );
  }

  Widget _buildMainContent(int selectedTab) {
    return IndexedStack(
      index: selectedTab,
      children: const [
        MapViewScreen(),
        ExplorerScreen(),
        ArchivesScreen(),
        AiInsightsScreen(),
      ],
    );
  }
}

class _SidebarWidget extends ConsumerWidget {
  final GlobalKey<AdminSearchBarState> searchBarKey;

  const _SidebarWidget({required this.searchBarKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final hasQuery = query.trim().isNotEmpty;

    return Container(
      color: const Color(0xFF1A1D23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Tìm kiếm hành chính',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AdminSearchBar(key: searchBarKey),
          ),
          const SizedBox(height: 4),
          if (hasQuery)
            const Expanded(child: SearchResultsList())
          else
            const Expanded(child: RegionListWidget()),
          const Divider(height: 1),
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
                const Text('Database Sync Online',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
