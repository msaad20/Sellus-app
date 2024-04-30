import 'package:flutter/material.dart';
import 'package:sellusapp/config/theme/m3_color.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';
import 'package:sellusapp/widgets/sl_text.dart';

class SlErrorContainer extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onClose;
  final bool showContainer;
  const SlErrorContainer({
    super.key,
    required this.errorMessage,
    required this.onClose,
    required this.showContainer,
  });

  @override
  Widget build(BuildContext context) {
    return showContainer?Container(
      decoration: BoxDecoration(
        color: M3Color.of(context).errorContainer,
        borderRadius: ConfigConstant.circlarRadius2,
      ),
      child: Row(
        children: [
          Container(
            padding:const EdgeInsets.symmetric(
              horizontal: ConfigConstant.padding2*1.5,
              vertical:  ConfigConstant.padding2*1.5,
            ),
            decoration: BoxDecoration(
              color: M3Color.of(context).error,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  ConfigConstant.radius2,
                ),
                bottomLeft: Radius.circular(
                  ConfigConstant.radius2,
                ),
              ),
            ),
          ),
          ConfigConstant.sizedBoxW1,
          Expanded(
            child: SlText(
              errorMessage,
              fontColor: M3Color.of(context).onErrorContainer,
              softWrap: true,
              maxLines: null,
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: const Icon(Icons.close),
          ),
          ConfigConstant.sizedBoxW2,
        ],
      ),
    ):const SizedBox.shrink();
  }
}
