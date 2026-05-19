import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../map/presentation/map_view_screen.dart';
import '../../map/presentation/widgets/timeline_panel.dart';
import '../../ai_chat/presentation/ai_insights_screen.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

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
                Expanded(
                  child: _buildMainContent(selectedTab),
                ),
              ],
            ),
          ),
          // We moved the TimelinePanel into MapViewScreen for better overlay, 
          // or we can keep it here. Let's keep it global if needed, but since 
          // MapViewScreen has it, we just omit the placeholder if we use it inside MapViewScreen.
          // Actually, let's use the real TimelinePanel here globally so it persists across tabs.
          if (selectedTab == 0)
            const TimelinePanel(),
        ],
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
      destinations: const [
        NavigationRailDestination(icon: Icon(Icons.map), label: Text('Map')),
        NavigationRailDestination(icon: Icon(Icons.explore), label: Text('Explorer')),
        NavigationRailDestination(icon: Icon(Icons.book), label: Text('Archives')),
        NavigationRailDestination(icon: Icon(Icons.smart_toy), label: Text('AI')),
      ],
    );
  }

  Widget _buildMainContent(int selectedTab) {
    return IndexedStack(
      index: selectedTab,
      children: const [
        MapViewScreen(),
        Center(child: Text('Explorer Placeholder')),
        Center(child: Text('Archives Placeholder')),
        AiInsightsScreen(),
      ],
    );
  }
}

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1D23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Administrative Search',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchBar(
              hintText: 'Search province...',
            ),
          ),
          const Expanded(
            child: Center(child: Text('List Placeholder')),
          ),
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
                const Text('Database Sync Online', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TimelinePanelPlaceholder removed
