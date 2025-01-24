import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:record_keeping/core/theme/theme_cubit.dart';

interface class IGlobalBlocListener {
  List<SingleChildWidget> get globalBlocListener => <SingleChildWidget>[
        BlocListener<ThemeCubit, bool>(
          listener: (BuildContext ctx, bool st) {},
        ),
      ];
}

class GlobalBlocListener extends IGlobalBlocListener {}
