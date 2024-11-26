part of 'home_page.dart';

typedef OnLikeCallback = void Function(String? id, String title, bool isLiked)?;

class _MyCardWidget extends StatelessWidget {
  final String text;
  final String description;
  final String? image;
  final OnLikeCallback onLike;
  final VoidCallback? onTap;
  final String? id;
  final bool isLiked;
  const _MyCardWidget(
    this.text, {
    required this.description,
    this.image,
    this.onLike,
    this.onTap,
        this.id,
        this.isLiked = false,
  });
  factory _MyCardWidget.formData(
    CardData data, {
    OnLikeCallback onLike,
    VoidCallback? onTap,
        bool isLiked = false,
  }) =>
      _MyCardWidget(
        data.text,
        description: data.description,
        image: data.image,
        onLike: onLike,
        onTap: onTap,
        isLiked: isLiked,
        id: data.id,
      );

  /*@override
  State<_MyCardWidget> createState() => _MyCardWidgetState();*/
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        constraints: const BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.purple,
              width: 3,
            )),
        child: IntrinsicHeight(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 150,
                  child: Image.network(
                    image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16, bottom: 16),
                  child: GestureDetector(
                    onTap: () => onLike?.call(id, text, isLiked),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isLiked
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.lightGreenAccent,
                        key: ValueKey<int>(0),
                      )
                          : const Icon(
                        Icons.favorite_border,
                        key: ValueKey<int>(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class _MyCardWidgetState extends State<_MyCardWidget> {
  bool isLiked = false;*/

//}
