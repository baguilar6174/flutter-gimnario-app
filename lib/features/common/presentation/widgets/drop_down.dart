import 'package:flutter/material.dart';

import 'package:flutter_gimnario_app/core/core.dart';

import 'spacer_v.dart';

class DropDown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool hintIsVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;

  const DropDown({
    super.key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
    this.hintIsVisible = true,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hintIsVisible) ...{
            Text(
              hint ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
            SpacerV(value: Dimens.space6),
          },
          ButtonTheme(
            key: key,
            alignedDropdown: true,
            padding: EdgeInsets.zero,
            textTheme: ButtonTextTheme.primary,
            child: DropdownButtonFormField<T>(
              isExpanded: true,
              dropdownColor: Theme.of(context).extension<AppColors>()!.banner,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).extension<AppColors>()!.subtitle,
                  ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                isDense: true,
                isCollapsed: true,
                filled: true,
                fillColor: Theme.of(context).extension<AppColors>()!.card,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: Dimens.space12),
                  child: prefixIcon,
                ),
                prefixIconConstraints: BoxConstraints(
                  minHeight: Dimens.space24,
                  maxHeight: Dimens.space24,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: Dimens.space12),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.card!,
                  ),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.red!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.red!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space4),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<AppColors>()!.pink!,
                  ),
                ),
              ),
              value: value,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
