part of '../photo_main_page.dart';

class _BottomWidget extends StatefulWidget {
  const _BottomWidget({
    Key? key,
    this.onGalleryChange,
    this.options,
    this.provider,
    this.selectedProvider,
    this.galleryName = '',
    this.galleryListProvider,
    this.onTapPreview,
  }) : super(key: key);

  final ValueChanged<AssetPathEntity>? onGalleryChange;
  final Options? options;
  final I18nProvider? provider;
  final SelectedProvider? selectedProvider;
  final String galleryName;
  final GalleryListProvider? galleryListProvider;
  final VoidCallback? onTapPreview;

  @override
  __BottomWidgetState createState() => __BottomWidgetState();
}

class __BottomWidgetState extends State<_BottomWidget> {
  Options? get options => widget.options;

  I18nProvider? get i18nProvider => widget.provider;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14.0);
    const textPadding = EdgeInsets.symmetric(horizontal: 16.0);
    return Container(
      color: options!.themeColor,
      child: SafeArea(
        bottom: true,
        top: false,
        child: Container(
          height: 52.0,
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: _showGallerySelectDialog,
                child: Container(
                  alignment: Alignment.center,
                  height: 44.0,
                  padding: textPadding,
                  child: Text(
                    widget.galleryName,
                    style: textStyle.copyWith(color: options!.textColor),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              TextButton(
                onPressed: widget.onTapPreview,
                child: Container(
                  height: 44.0,
                  alignment: Alignment.center,
                  padding: textPadding,
                  child: Text(
                    i18nProvider!.getPreviewText(
                        options, widget.selectedProvider),
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showGallerySelectDialog() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (ctx) => ChangeGalleryDialog(
        galleryList: widget.galleryListProvider!.galleryPathList,
        i18n: i18nProvider,
        options: options,
      ),
    );

    if (result != null) {
      widget.onGalleryChange?.call(result);
    }
  }
}
