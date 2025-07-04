import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontap;

  const Newstile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.author,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 10),
                      Flexible(child: Text(author, maxLines: 1)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(title, maxLines: 2),
                  Text(time, style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
