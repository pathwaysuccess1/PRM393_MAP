import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/providers/search_provider.dart';

class AdminSearchBar extends ConsumerStatefulWidget {
  final FocusNode? externalFocusNode;

  const AdminSearchBar({super.key, this.externalFocusNode});

  @override
  ConsumerState<AdminSearchBar> createState() => AdminSearchBarState();
}

class AdminSearchBarState extends ConsumerState<AdminSearchBar> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = widget.externalFocusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    if (widget.externalFocusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void requestFocus() {
    _focusNode.requestFocus();
  }

  void _onChanged(String value) {
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchQueryProvider.notifier).state = value;
    });
  }

  void clearText() {
    _controller.clear();
    setState(() {});
    ref.read(searchQueryProvider.notifier).state = '';
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Tìm tỉnh, thành phố...',
        hintStyle: TextStyle(
          color: const Color(0xFF9AA0B0).withOpacity(0.7),
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF9AA0B0)),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: clearText,
                color: const Color(0xFF9AA0B0),
              )
            : null,
        filled: true,
        fillColor: const Color(0xFF252830),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF2D5A8E), width: 1.5),
        ),
      ),
    );
  }
}
