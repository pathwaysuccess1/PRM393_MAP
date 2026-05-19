import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/theme/theme_provider.dart';
import '../../../shared/providers/settings_provider.dart';
import '../../../shared/providers/database_provider.dart';
import '../../../shared/providers/chat_provider.dart';

class SettingsDrawer extends ConsumerStatefulWidget {
  const SettingsDrawer({super.key});

  @override
  ConsumerState<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends ConsumerState<SettingsDrawer> {
  final _apiKeyController = TextEditingController();
  bool _obscureKey = true;
  _ConnectionStatus _connectionStatus = _ConnectionStatus.idle;

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  Future<void> _testConnection() async {
    final key = _apiKeyController.text.trim();
    if (key.isEmpty) return;

    setState(() => _connectionStatus = _ConnectionStatus.testing);

    try {
      final model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: key,
        generationConfig: GenerationConfig(maxOutputTokens: 10),
      );
      await model.generateContent([Content.text('ping')]);
      setState(() => _connectionStatus = _ConnectionStatus.success);
    } catch (e) {
      setState(() => _connectionStatus = _ConnectionStatus.failed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsAsync = ref.watch(settingsStateProvider);

    return Drawer(
      width: 320,
      backgroundColor: const Color(0xFF1A1D23),
      child: SafeArea(
        child: settingsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text('Lỗi: $e')),
          data: (settings) {
            if (_apiKeyController.text.isEmpty && settings.geminiApiKey != null) {
              _apiKeyController.text = settings.geminiApiKey!;
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    const Icon(Icons.settings, size: 22),
                    const SizedBox(width: 8),
                    Text('Cài đặt', style: theme.textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 24),

                // AI Settings
                _SectionHeader(title: 'AI Settings', icon: Icons.smart_toy),
                const SizedBox(height: 12),
                TextField(
                  controller: _apiKeyController,
                  obscureText: _obscureKey,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                  decoration: InputDecoration(
                    labelText: 'Gemini API Key',
                    labelStyle: theme.textTheme.bodySmall,
                    filled: true,
                    fillColor: const Color(0xFF252830),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            _obscureKey
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 18,
                          ),
                          onPressed: () =>
                              setState(() => _obscureKey = !_obscureKey),
                        ),
                        _connectionStatusIcon(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _testConnection,
                        icon: const Icon(Icons.wifi_tethering, size: 16),
                        label: const Text('Kiểm tra kết nối',
                            style: TextStyle(fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF2D5A8E),
                          side: const BorderSide(
                              color: Color(0xFF2D5A8E), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final key = _apiKeyController.text.trim();
                          await ref
                              .read(settingsStateProvider.notifier)
                              .setGeminiApiKey(key.isEmpty ? null : key);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Đã lưu API Key')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D5A8E),
                        ),
                        child: const Text('Lưu',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (settings.geminiApiKey == null ||
                    settings.geminiApiKey!.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBA7517).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Sử dụng khóa mặc định từ hệ thống',
                      style: TextStyle(
                        color: Color(0xFFBA7517),
                        fontSize: 11,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () async {
                    final uri =
                        Uri.parse('https://aistudio.google.com/app/apikey');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: const Text(
                    'Lấy API key tại Google AI Studio →',
                    style: TextStyle(
                      color: Color(0xFF378ADD),
                      fontSize: 11,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Appearance
                _SectionHeader(title: 'Giao diện', icon: Icons.palette),
                const SizedBox(height: 12),
                Text('Chế độ giao diện', style: theme.textTheme.bodySmall),
                const SizedBox(height: 8),
                SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text('Sáng', style: TextStyle(fontSize: 12)),
                      icon: Icon(Icons.light_mode, size: 16),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text('Tối', style: TextStyle(fontSize: 12)),
                      icon: Icon(Icons.dark_mode, size: 16),
                    ),
                    ButtonSegment(
                      value: ThemeMode.system,
                      label:
                          Text('Hệ thống', style: TextStyle(fontSize: 12)),
                      icon: Icon(Icons.settings_suggest, size: 16),
                    ),
                  ],
                  selected: {settings.themeMode},
                  onSelectionChanged: (modes) {
                    ref
                        .read(settingsStateProvider.notifier)
                        .setThemeMode(modes.first);
                  },
                ),
                const SizedBox(height: 16),
                Text('Map Tile Layer', style: theme.textTheme.bodySmall),
                const SizedBox(height: 8),
                DropdownButtonFormField<MapTileLayer>(
                  value: settings.tileLayer,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF252830),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  dropdownColor: const Color(0xFF252830),
                  style:
                      theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                  items: MapTileLayer.values.map((layer) {
                    return DropdownMenuItem(
                      value: layer,
                      child: Text(tileLayerLabel(layer)),
                    );
                  }).toList(),
                  onChanged: (layer) {
                    if (layer != null) {
                      ref
                          .read(settingsStateProvider.notifier)
                          .setTileLayer(layer);
                    }
                  },
                ),
                const SizedBox(height: 24),

                // Data
                _SectionHeader(title: 'Dữ liệu', icon: Icons.storage),
                const SizedBox(height: 12),
                _DataActionTile(
                  icon: Icons.delete_outline,
                  label: 'Xóa cache bản đồ',
                  color: const Color(0xFFE24B4A),
                  onTap: () async {
                    final db = ref.read(databaseProvider);
                    await db.geoJsonDao.clearCache();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Đã xóa cache bản đồ')),
                      );
                    }
                  },
                ),
                _DataActionTile(
                  icon: Icons.chat_bubble_outline,
                  label: 'Xóa lịch sử chat',
                  color: const Color(0xFFBA7517),
                  onTap: () async {
                    await ref.read(chatNotifierProvider.notifier).clearHistory();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Đã xóa lịch sử chat')),
                      );
                    }
                  },
                ),
                _DataActionTile(
                  icon: Icons.cloud_download_outlined,
                  label: 'Cập nhật dữ liệu từ đám mây',
                  color: const Color(0xFF2D5A8E),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Khởi động lại ứng dụng để cập nhật dữ liệu')),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // About
                _SectionHeader(title: 'Giới thiệu', icon: Icons.info_outline),
                const SizedBox(height: 12),
                _AboutRow(label: 'Phiên bản', value: '1.0.0+1'),
                _AboutRow(label: 'Giấy phép', value: 'CC BY-NC 4.0'),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final uri = Uri.parse(
                        'https://github.com/pathwaysuccess1/PRM393_MAP');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.open_in_new,
                          size: 14, color: Color(0xFF378ADD)),
                      SizedBox(width: 6),
                      Text(
                        'GitHub Repository',
                        style: TextStyle(
                          color: Color(0xFF378ADD),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _connectionStatusIcon() {
    switch (_connectionStatus) {
      case _ConnectionStatus.idle:
        return const SizedBox.shrink();
      case _ConnectionStatus.testing:
        return const SizedBox(
          width: 18,
          height: 18,
          child: Padding(
            padding: EdgeInsets.all(2),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      case _ConnectionStatus.success:
        return const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.check_circle, color: Color(0xFF1D9E75), size: 18),
        );
      case _ConnectionStatus.failed:
        return const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.error, color: Color(0xFFE24B4A), size: 18),
        );
    }
  }
}

enum _ConnectionStatus { idle, testing, success, failed }

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF9AA0B0)),
        const SizedBox(width: 6),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xFF9AA0B0),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
        ),
      ],
    );
  }
}

class _DataActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _DataActionTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 20, color: color),
      title: Text(
        label,
        style: TextStyle(fontSize: 13, color: color),
      ),
      onTap: onTap,
    );
  }
}

class _AboutRow extends StatelessWidget {
  final String label;
  final String value;

  const _AboutRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: theme.textTheme.bodySmall),
          const Spacer(),
          Text(value,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
