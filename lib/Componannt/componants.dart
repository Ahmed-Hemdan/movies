import 'package:flutter/material.dart';

Widget horizentalItem(
  list,
  BuildContext context,
  int index,
  Widget screen,
) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(
              width: 90,
              height: 150,
              child: Image.network('${list[index].image}'),
            ),
            Expanded(
              child: SizedBox(
                width: 120,
                child: Text(
                  '${list[index].title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
// =====================================================================================
Widget virticalItem(
  List list,
  BuildContext context,
  int index,
  Widget screen,
) =>
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 90,
            height: 120,
            child: Image.network('${list[index].image}'),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${list[index].title}',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '${list[index].year}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          ClipOval(
            child: Container(
              width: 35,
              height: 35,
              color: Colors.yellow[600],
              child: Center(
                child: Text(
                  '${list[index].imDbRating}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
// =====================================================================================

Widget oneItemShown(list, int index, context) => Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  width: 140,
                  child: Image.network('${list[index].image}'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Rank:  ',
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                        '${list[index].rank}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('The year :  ',
                          style: Theme.of(context).textTheme.bodyText1),
                      Text('${list[index].year}',
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('The name : ',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Expanded(
                child: Text(
                  '${list[index].title}',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('The crew : ',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Expanded(
                child: Text(
                  '${list[index].crew}',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IMDb Rate : ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                child: Text(
                  '${list[index].imDbRating}',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'The count of people who rated it : ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                child: Text(
                  '${list[index].imDbRatingCount}',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        )
      ],
    );
