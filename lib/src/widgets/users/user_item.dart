import 'package:cupizz_app/src/base/base.dart';

class UserItem extends StatelessWidget {
  final SimpleUser? simpleUser;
  final Function(SimpleUser? simpleUser)? onPressed;
  final bool isHighlight;

  const UserItem({
    Key? key,
    required this.simpleUser,
    this.onPressed,
    this.isHighlight = false,
  }) : super(key: key);

  void handlePressed(BuildContext context) {
    if (onPressed != null) {
      onPressed!(simpleUser);
    } else {
      Get.toNamed(Routes.user, arguments: UserScreenParams(user: simpleUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topRight: Radius.circular(50),
    );
    final textColor = !isHighlight
        ? context.colorScheme.primary
        : context.colorScheme.onPrimary;
    final overlayColor = isHighlight
        ? context.colorScheme.primary
        : context.colorScheme.background;
    final shadowColor = isHighlight
        ? context.colorScheme.primary
        : context.colorScheme.onSurface;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: shadowColor.withOpacity(isHighlight ? 1.0 : 0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Skeleton(
          enabled: simpleUser == null,
          autoContainer: true,
          child: GestureDetector(
            onTap: () => handlePressed(context),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: CustomNetworkImage(
                    simpleUser?.avatar?.url ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                if (simpleUser != null)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            overlayColor.withOpacity(0),
                            overlayColor.withOpacity(0),
                            overlayColor.withOpacity(0.03),
                            overlayColor.withOpacity(0.07),
                            overlayColor.withOpacity(0.1),
                            overlayColor.withOpacity(0.3),
                            overlayColor.withOpacity(0.5),
                            overlayColor.withOpacity(0.7),
                            overlayColor.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Wrap(
                        spacing: 5,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(
                            simpleUser?.displayName ?? 'Loading',
                            style: context.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          if (simpleUser?.age != null)
                            Text(
                              simpleUser!.age.toString(),
                              style: context.textTheme.caption,
                            ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
