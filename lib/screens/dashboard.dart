import 'package:farmify_app/data/badgedata.dart';
import 'package:farmify_app/model/questmodel.dart';
import 'package:farmify_app/notifiers/questNotifier.dart';
import 'package:farmify_app/screens/questdetails.dart';
import 'package:farmify_app/widgets/sustainibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends ConsumerWidget {
  final Function(int) onCategorySelected;

  const Dashboard({Key? key, required this.onCategorySelected})
    : super(key: key);

  // made async so we can await the pushed route if needed (keeps UI consistent)
  Future<void> _onQuestTap(BuildContext context, Quest quest) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => QuestDetails(quest: quest)));
    // If you want to do something after returning from QuestDetails, do it here.
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(questProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 24.0,
          right: 20.0,
          bottom: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Row
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  maxRadius: 46,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Annamalai Raghuswami',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Farmer',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(flex: 3, child: Sustainability(score: 87)),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Ongoing Quests',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Horizontal Quest Cards
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: quests.length > 5 ? 5 : quests.length,
                itemBuilder: (context, index) {
                  final quest = quests[index];
                  return GestureDetector(
                    key: ValueKey(quest.id), // preserve identity across updates
                    onTap: () => _onQuestTap(context, quest),
                    child: Container(
                      width: 260,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.transparent, width: 0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Quest Image
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:
                                quest.photo.isNotEmpty
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        quest.photo,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    )
                                    : const Icon(
                                      Icons.image,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quest.name,
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "${quest.progress}%",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value:
                                              quest
                                                  .progressRatio, // clearer intent
                                          minHeight: 12,
                                          backgroundColor: Colors.green
                                              .withOpacity(0.2),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(Colors.green),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Badges Earned',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Grid of Badges
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children:
                  badges.take(3).map((badge) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                badge.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            badge.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            badge.questName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
