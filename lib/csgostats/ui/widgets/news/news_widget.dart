import 'package:csgostats/csgostats/Theme/constats.dart';
import 'package:csgostats/csgostats/Theme/image.dart';
import 'package:csgostats/csgostats/domain/entity/news/news_vk_response_items.dart';
import 'package:csgostats/csgostats/library/Widgets/Inherited/provider.dart';
import 'package:csgostats/csgostats/ui/widgets/news/news_model.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvidere.watch<NewsModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: model.items.length,
          itemBuilder: (BuildContext context, int index) {
            model.showedNewsAtIndex(index);
            final news = model.items[index];
            return newsTile(news, model, context, index);
          },
        ),
      ],
    );
  }
}

Container newsTile(
  VkResponseItems news,
  NewsModel model,
  BuildContext context,
  int index,
) {
  String myMarkerThumb = (news.attachments?[0].photo?.sizes[3].url).toString();
  if (news.attachments?[0].photo?.sizes[3].url == null) {
    myMarkerThumb = 'noImage';
  }

  return Container(
    decoration: BoxDecoration(
      color: const Color.fromRGBO(45, 56, 68, 1),
      border: Border.all(color: Colors.black.withOpacity(0.2)),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    margin: const EdgeInsets.only(
      left: 10,
      right: 10,
      top: 10,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                        image: AssetImage(ImagePath().qcpl),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Flexible(
                  child: Text(
                    'QCPL - Казахстанская Премьер-Лига CS:GO',
                    style: listDefaultHeaderStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: Text(
              '${news.text}',
              style: newsTextStyle,
              softWrap: true,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: myMarkerThumb != 'noImage'
                        ? NetworkImage(myMarkerThumb)
                        : AssetImage(ImagePath().x) as ImageProvider,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  news.views.count.toString(),
                  style: newsViewsStyle,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(width: 4),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
