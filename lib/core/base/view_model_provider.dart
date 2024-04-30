import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellusapp/core/base/base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final Widget? child;
  final Create<T> create;
  final Widget Function(BuildContext context, T provider, Widget? child)
      builder;

  const ViewModelProvider({
    super.key,
    this.child,
    required this.create,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => create(context),
      builder: (context, child) {
        final T provider = Provider.of<T>(context);
        return builder(context, provider, child);
      },
      child: child,
    );
  }
}
