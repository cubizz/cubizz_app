part of '../index.dart';

class UserItem extends StatelessWidget {
  final SimpleUser simpleUser;
  final Function(SimpleUser simpleUser) onPressed;

  const UserItem({Key key, @required this.simpleUser, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topRight: Radius.circular(50),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: context.colorScheme.onSurface.withOpacity(0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Skeleton(
          enabled: simpleUser == null,
          autoContainer: true,
          child: InkWell(
            onTap:
                simpleUser != null ? () => onPressed?.call(simpleUser) : null,
            child: Stack(
              children: <Widget>[
                // ignore: can_be_null_after_null_aware
                if (simpleUser?.avatar?.url.isExistAndNotEmpty)
                  Positioned.fill(
                    child: NetworkImage(
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
                            context.colorScheme.background.withOpacity(0),
                            context.colorScheme.background.withOpacity(0),
                            context.colorScheme.background.withOpacity(0.03),
                            context.colorScheme.background.withOpacity(0.07),
                            context.colorScheme.background.withOpacity(0.1),
                            context.colorScheme.background.withOpacity(0.3),
                            context.colorScheme.background.withOpacity(0.5),
                            context.colorScheme.background.withOpacity(0.7),
                            context.colorScheme.background.withOpacity(0.8),
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
                            style: context.textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          if (simpleUser?.age != null)
                            Text(
                              simpleUser.age.toString(),
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