import 'package:flutter/material.dart';

import '../../../../application/app_view/app_view.dart';
import '../../../../shared/widgets/app_loading_indicator_widget.dart';

class PassengersAtStopWidget extends StatelessWidget {
  const PassengersAtStopWidget({Key? key, required this.stopName})
      : super(key: key);
  final String stopName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeMg.padH(20.0)),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageIcon(
                  AssetsMg.busIconRounded,
                  size: SizeMg.radius(18),
                  color: ColorsMg.greenDark,
                ),
                SizedBox(width: SizeMg.width(6)),
                Expanded(
                  child: Text(
                    '$stopName Passengers',
                    style: StyleMg.medium14,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeMg.padV(8)),
            Container(
              padding: const EdgeInsets.all(2),
              height: SizeMg.height(24),
              decoration: const BoxDecoration(
                color: ColorsMg.grey10,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: TabBar(
                tabs: const [
                  Text('Pick ups'),
                  Text('Drop offs'),
                ],
                labelStyle: StyleMg.alt5medium.copyWith(color: ColorsMg.black1),
                labelColor: ColorsMg.black1,
                unselectedLabelColor: ColorsMg.grey5,
                unselectedLabelStyle: StyleMg.alt5medium,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  color: ColorsMg.backgroundWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                4,
                (_) => const _PassengerListTile(),
              ),
            ),
          ],
        ),
        // )
        //   ],
        // ),
      ),
    );
  }
}

class _PassengerListTile extends StatelessWidget {
  const _PassengerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeMg.padV(8.0)),
      child: Row(
        children: [
          CircleAvatar(
            radius: SizeMg.radius(12),
            backgroundColor: ColorsMg.greenDark,
            backgroundImage: AssetsMg.dummyImage,
          ),
          SizedBox(width: SizeMg.padH(8)),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'Dianne Russell',
                style: StyleMg.alt5medium.copyWith(
                  color: ColorsMg.black1,
                ),
                children: [
                  TextSpan(
                    text: ' •  OJ86TF',
                    style: StyleMg.alt5medium,
                  ),
                ],
              ),
            ),
          ),
          _PassengerButton.checkIn(
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 3));
              return true;
            },
          ),
        ],
      ),
    );
  }
}

class _PassengerButton extends StatefulWidget {
  const _PassengerButton.checkIn({
    Key? key,
    required this.onPressed,
    this.enabled = true,
  })  : _enabledLabel = 'Check in',
        _lockedLabel = 'Checked in',
        _loadingLabel = 'Checking in',
        super(key: key);

  const _PassengerButton.checkOut({
    Key? key,
    required this.onPressed,
    this.enabled = true,
  })  : _enabledLabel = 'Check out',
        _lockedLabel = 'Checked out',
        _loadingLabel = 'Checking out',
        super(key: key);

  final bool enabled;
  final String _enabledLabel;
  final String _lockedLabel;
  final String _loadingLabel;
  final Future<bool> Function() onPressed;

  @override
  State<_PassengerButton> createState() => _PassengerButtonState();
}

class _PassengerButtonState extends State<_PassengerButton> {
  static const _enabledDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(4)),
    border: Border.fromBorderSide(
      BorderSide(color: ColorsMg.grey6),
    ),
  );

  static const _disabledDecoration = BoxDecoration(
    color: ColorsMg.grey10,
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );

  late bool _enabled;
  late bool _loading;

  @override
  void initState() {
    _enabled = widget.enabled;
    _loading = false;
    super.initState();
  }

  void onTap() async {
    if (_loading || !_enabled) return;
    setState(() {
      _loading = true;
    });
    final success = await widget.onPressed();
    setState(() {
      _enabled = !success;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String label = _loading
        ? widget._loadingLabel
        : _enabled
            ? widget._enabledLabel
            : widget._lockedLabel;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeMg.height(24),
        padding: EdgeInsets.symmetric(
          horizontal: SizeMg.padH(8),
          vertical: SizeMg.padV(3),
        ),
        decoration: _enabled ? _enabledDecoration : _disabledDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: StyleMg.alt5medium.copyWith(
                color: !_enabled ? ColorsMg.greenDark : ColorsMg.grey2,
              ),
            ),
            if (_loading)
              Padding(
                padding: EdgeInsets.only(left: SizeMg.padH(4)),
                child: AppLoadingIndicator(
                  ticks: 8,
                  radius: SizeMg.radius(7),
                  backColor: ColorsMg.grey3,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
