import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CreateTournamentScreen extends StatefulWidget {
  const CreateTournamentScreen({super.key});

  @override
  State<CreateTournamentScreen> createState() => _CreateTournamentScreenState();
}

class _CreateTournamentScreenState extends State<CreateTournamentScreen> {
  int _step = 0;
  bool _created = false;

  final _nameCtrl = TextEditingController(text: 'Ramadan Night Cricket League 2026');
  final _sportCtrl = TextEditingController(text: 'Cricket');
  final _venueCtrl = TextEditingController(text: 'Gaddafi Stadium, Lahore');
  final _descCtrl = TextEditingController(text: 'Annual night cricket tournament during Ramadan. Open to all registered teams.');
  final _prizeCtrl = TextEditingController(text: '500,000 PKR');
  DateTime _startDate = DateTime(2026, 3, 1);
  DateTime _endDate = DateTime(2026, 3, 28);

  String _format = 'Round Robin';
  int _teamCount = 8;
  DateTime _regDeadline = DateTime(2026, 2, 20);

  @override
  void dispose() {
    _nameCtrl.dispose(); _sportCtrl.dispose(); _venueCtrl.dispose();
    _descCtrl.dispose(); _prizeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final tp = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final ts = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;
    final purple = Colors.purple.shade600;

    if (_created) return _buildSuccessState(bg, cardColor, tp, ts, purple);

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(width: 48, height: 48,
                decoration: BoxDecoration(color: purple.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(Icons.emoji_events, color: purple, size: 26)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Create Tournament', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                Text('Set up a new tournament for teams to register', style: TextStyle(fontSize: 13, color: ts)),
              ])),
            ]),
            const SizedBox(height: 24),

            // Step indicator
            Row(children: [
              for (int i = 0; i < 3; i++) ...[
                if (i > 0) Expanded(child: Container(height: 2, color: i <= _step ? purple : (isDark ? AppColors.dividerDark : AppColors.divider))),
                _stepDot(i, ['Details', 'Format', 'Review'][i], i <= _step, purple, ts),
              ],
            ]),
            const SizedBox(height: 28),

            // Step content
            Card(color: cardColor, child: Padding(padding: const EdgeInsets.all(24), child: switch (_step) {
              0 => _buildStep1(tp, ts, isDark, purple),
              1 => _buildStep2(tp, ts, isDark, purple),
              _ => _buildStep3(tp, ts, isDark, cardColor, purple),
            })),
            const SizedBox(height: 20),

            // Navigation buttons
            Row(children: [
              if (_step > 0) OutlinedButton.icon(
                onPressed: () => setState(() => _step--),
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Back'),
              ),
              const Spacer(),
              if (_step < 2) FilledButton.icon(
                onPressed: () => setState(() => _step++),
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('Next'),
                style: FilledButton.styleFrom(backgroundColor: purple),
              ),
              if (_step == 2) FilledButton.icon(
                onPressed: () => setState(() => _created = true),
                icon: const Icon(Icons.check, size: 18),
                label: const Text('Create Tournament'),
                style: FilledButton.styleFrom(backgroundColor: purple),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _stepDot(int index, String label, bool active, Color purple, Color ts) {
    return Column(children: [
      Container(width: 32, height: 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: active ? purple : Colors.transparent,
          border: Border.all(color: active ? purple : ts.withValues(alpha: 0.3), width: 2)),
        child: Center(child: Text('${index + 1}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: active ? Colors.white : ts)))),
      const SizedBox(height: 4),
      Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: active ? purple : ts)),
    ]);
  }

  Widget _buildStep1(Color tp, Color ts, bool isDark, Color purple) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Tournament Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
      const SizedBox(height: 16),
      _field('Tournament Name', _nameCtrl, Icons.emoji_events),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _field('Sport', _sportCtrl, Icons.sports_cricket)),
        const SizedBox(width: 12),
        Expanded(child: _field('Prize Pool', _prizeCtrl, Icons.monetization_on)),
      ]),
      const SizedBox(height: 12),
      _field('Venue', _venueCtrl, Icons.place),
      const SizedBox(height: 12),
      _field('Description', _descCtrl, Icons.description_outlined, maxLines: 3),
      const SizedBox(height: 12),
      Row(children: [
        Expanded(child: _dateField('Start Date', _startDate, (d) => setState(() => _startDate = d))),
        const SizedBox(width: 12),
        Expanded(child: _dateField('End Date', _endDate, (d) => setState(() => _endDate = d))),
      ]),
    ]);
  }

  Widget _buildStep2(Color tp, Color ts, bool isDark, Color purple) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Tournament Format', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
      const SizedBox(height: 16),
      Text('Format Type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: tp)),
      const SizedBox(height: 8),
      Wrap(spacing: 8, runSpacing: 8, children: ['Round Robin', 'League', 'Knockout', 'League + Knockout'].map((f) => ChoiceChip(
        label: Text(f), selected: _format == f,
        onSelected: (_) => setState(() => _format = f),
        selectedColor: purple.withValues(alpha: 0.15),
      )).toList()),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Number of Teams', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: tp)),
          const SizedBox(height: 8),
          Row(children: [
            IconButton.outlined(onPressed: () => setState(() { if (_teamCount > 2) _teamCount--; }), icon: const Icon(Icons.remove, size: 18)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text('$_teamCount', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp))),
            IconButton.outlined(onPressed: () => setState(() => _teamCount++), icon: const Icon(Icons.add, size: 18)),
          ]),
        ])),
        Expanded(child: _dateField('Registration Deadline', _regDeadline, (d) => setState(() => _regDeadline = d))),
      ]),
    ]);
  }

  Widget _buildStep3(Color tp, Color ts, bool isDark, Color cardColor, Color purple) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Review & Create', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
      const SizedBox(height: 16),
      Container(padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: purple.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(12), border: Border.all(color: purple.withValues(alpha: 0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _reviewRow('Name', _nameCtrl.text, ts),
          _reviewRow('Sport', _sportCtrl.text, ts),
          _reviewRow('Venue', _venueCtrl.text, ts),
          _reviewRow('Prize Pool', _prizeCtrl.text, ts),
          _reviewRow('Format', _format, ts),
          _reviewRow('Teams', '$_teamCount', ts),
          _reviewRow('Dates', '${_startDate.day}/${_startDate.month}/${_startDate.year} — ${_endDate.day}/${_endDate.month}/${_endDate.year}', ts),
          _reviewRow('Reg. Deadline', '${_regDeadline.day}/${_regDeadline.month}/${_regDeadline.year}', ts),
        ])),
    ]);
  }

  Widget _buildSuccessState(Color bg, Color cardColor, Color tp, Color ts, Color purple) {
    return Scaffold(backgroundColor: bg, body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 80, height: 80, decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.12), shape: BoxShape.circle),
        child: const Icon(Icons.check_circle, color: AppColors.success, size: 48)),
      const SizedBox(height: 20),
      Text('Tournament Created!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: tp)),
      const SizedBox(height: 8),
      Text(_nameCtrl.text, style: TextStyle(fontSize: 14, color: ts)),
      const SizedBox(height: 24),
      Row(mainAxisSize: MainAxisSize.min, children: [
        OutlinedButton(onPressed: () => setState(() { _created = false; _step = 0; }), child: const Text('Create Another')),
        const SizedBox(width: 12),
        FilledButton(onPressed: () => Navigator.of(context).pop(), style: FilledButton.styleFrom(backgroundColor: purple), child: const Text('Go to Tournaments')),
      ]),
    ])));
  }

  Widget _reviewRow(String label, String value, Color ts) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 120, child: Text(label, style: TextStyle(fontSize: 12, color: ts))),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600))),
      ],
    ));
  }

  Widget _field(String label, TextEditingController ctrl, IconData icon, {int maxLines = 1}) {
    return TextFormField(controller: ctrl, maxLines: maxLines,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _dateField(String label, DateTime date, ValueChanged<DateTime> onChanged) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      InkWell(onTap: () async {
        final d = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2024), lastDate: DateTime(2030));
        if (d != null) onChanged(d);
      }, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(border: Border.all(color: AppColors.divider), borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Icon(Icons.calendar_today, size: 18, color: Colors.purple.shade600),
          const SizedBox(width: 8),
          Text('${date.day}/${date.month}/${date.year}', style: const TextStyle(fontSize: 13)),
        ]))),
    ]);
  }
}
