import 'package:flutter/material.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:queries/collections.dart';
import 'package:smart_select/smart_select.dart';

class CustomSingleDropdown<TValue> extends StatefulWidget {
  final String label;
  final List<SelectListItem<TValue>> dataSource;
  final TValue value;

  CustomSingleDropdown({
    Key key,
    @required this.label,
    @required this.dataSource,
    @required this.value,
    @required this.onChange,
  })  : assert(label != null),
        assert(dataSource != null),
        assert(onChange != null),
        super(key: key);

  final Function(S2SingleState<TValue> state) onChange;

  @override
  _CustomDropdownState<TValue> createState() => _CustomDropdownState<TValue>();
}

class _CustomDropdownState<TValue> extends State<CustomSingleDropdown<TValue>> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              color: Colors.grey,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: SmartSelect<TValue>.single(
          title: widget.label,
          value: widget.value,
          choiceItems: S2Choice.listFrom<TValue, Map>(
            source: Collection(widget.dataSource)
                .select((arg1) => {'key': arg1.value, 'value': arg1.text})
                .toList(),
            value: (index, item) => item['key'],
            title: (index, item) => item['value'],
          ),
          onChange: (state) {
            widget.onChange(state);
          },
          modalType: S2ModalType.bottomSheet,
          modalConfirm: true,
          modalFilter: true,
          choiceGrouped: false,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: false,
              title: Text(
                widget.label,
                style: TextStyle(color: Colors.grey[700]),
              ),
              padding: EdgeInsets.zero,
            );
          },
        ),
      ),
    );
  }
}
