import 'package:farmify_app/model/questmodel.dart';
import 'package:farmify_app/screens/questdetails.dart';
import 'package:farmify_app/notifiers/questnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Quests extends ConsumerStatefulWidget {
  const Quests({super.key});

  @override
  ConsumerState<Quests> createState() => _QuestsState();
}

class _QuestsState extends ConsumerState<Quests> {
  @override
  void initState() {
    super.initState();
    print('Quests screen initialized');
  }

  Future<void> _onQuestTap(BuildContext context, Quest quest) async {
    print('Before navigation - Quest ${quest.name}: ${quest.progress}%');

    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => QuestDetails(quest: quest)));

    print('After navigation - Returned from QuestDetails');

    // Force a rebuild using setState
    if (mounted) {
      setState(() {
        // This will trigger a rebuild, and ref.watch will get fresh data
        print('Forcing rebuild of Quests screen');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quests = ref.watch(questProvider);

    print('Quests screen building with ${quests.length} quests');
    for (var quest in quests) {
      print('Quest: ${quest.name} - Progress: ${quest.progress}%');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Quests',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: quests.length,
          itemBuilder: (context, index) {
            final quest = quests[index];

            print(
              'Building card for quest: ${quest.name} with ${quest.progress}% progress',
            );

            return Card(
              key: Key('quest-card-${quest.id}-${quest.progress}'),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () => _onQuestTap(context, quest),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(quest.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: [0.5, 1.0],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quest.name,
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Progress bar
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: quest.progressRatio,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${quest.progress}%",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
