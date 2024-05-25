import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/common/widgets/empty_state/general_empty_state.dart';

class AsyncSnapshotResponseView<Loading, Error, Success>
    extends ConsumerWidget {
  AsyncSnapshotResponseView({
    required this.snapshot,
    required this.successWidgetBuilder,
    required this.onTryAgainTap,
    this.loadingWidgetBuilder,
    this.errorWidgetBuilder,
    super.key,
  })  : assert(Loading != dynamic),
        assert(Error != dynamic),
        assert(Success != dynamic);

  final AsyncSnapshot<dynamic> snapshot;
  final Widget Function(BuildContext context, Success success)
      successWidgetBuilder;
  final Widget Function(BuildContext context, Loading? loading)?
      loadingWidgetBuilder;
  final Widget Function(
    BuildContext context,
    Error? error,
    VoidCallback onTryAgain,
  )? errorWidgetBuilder;
  final VoidCallback onTryAgainTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = snapshot.data;
    if (data == null || data is Loading) {
      if (loadingWidgetBuilder != null) {
        return loadingWidgetBuilder!(context, data as Loading?);
      }
      return Center(
        child: CircularProgressIndicator(
          color: ref.colors.primaryColor,
        ),
      );
    }

    if (data is Error) {
      if (errorWidgetBuilder != null) {
        return errorWidgetBuilder!(context, data, onTryAgainTap);
      }
      return GeneralEmptyState(
        onTryAgain: onTryAgainTap,
        errorType: data is GenericErrorView
            ? data.type
            : GenericErrorViewType.unexpected,
      );
    }

    if (data is Success) {
      return successWidgetBuilder(context, data);
    }
    throw UnknownStateTypeException();
  }
}

class UnknownStateTypeException implements Exception {}
