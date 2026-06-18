import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ManageTeamScreen extends StatefulWidget {
  const ManageTeamScreen({super.key});

  @override
  State<ManageTeamScreen> createState() => _ManageTeamScreenState();
}

class _ManageTeamScreenState extends State<ManageTeamScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(text: 'Lahore Strikers');
  final _sportCtrl = TextEditingController(text: 'Cricket');
  final _groundCtrl = TextEditingController(text: 'Gaddafi Stadium, Lahore');
  final _descCtrl = TextEditingController(text: 'Premier cricket team competing in regional tournaments since 2021. Known for aggressive batting and disciplined bowling.');
  final _coachCtrl = TextEditingController();

  final List<_Coach> _coaches = [
    _Coach('Imran Shahid', 'Head Coach', '10 years experience'),
    _Coach('Ali Raza', 'Batting Coach', 'Specialist in T20 format'),
    _Coach('Kamran Akmal', 'Bowling Coach', 'Former first-class player'),
  ];

  bool _isPublic = true;
  bool _requireApproval = true;
  bool _visibleOnSearch = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _sportCtrl.dispose();
    _groundCtrl.dispose();
    _descCtrl.dispose();
    _coachCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.shield, color: AppColors.accent, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Manage Team', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: textPrimary)),
                    Text('Configure team details, coaching staff, and settings', style: TextStyle(fontSize: 13, color: textSecondary)),
                  ],
                )),
                FilledButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Team settings saved'), backgroundColor: AppColors.success),
                      );
                    }
                  },
                  icon: const Icon(Icons.save, size: 18),
                  label: const Text('Save Changes'),
                ),
              ]),
              const SizedBox(height: 28),

              // Two-column layout on desktop
              width >= 900
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: _buildTeamInfoCard(cardColor, textPrimary, textSecondary, isDark)),
                        const SizedBox(width: 20),
                        Expanded(flex: 2, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCoachingStaffCard(cardColor, textPrimary, textSecondary, isDark),
                            const SizedBox(height: 20),
                            _buildSettingsCard(cardColor, textPrimary, textSecondary, isDark),
                          ],
                        )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTeamInfoCard(cardColor, textPrimary, textSecondary, isDark),
                        const SizedBox(height: 20),
                        _buildCoachingStaffCard(cardColor, textPrimary, textSecondary, isDark),
                        const SizedBox(height: 20),
                        _buildSettingsCard(cardColor, textPrimary, textSecondary, isDark),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamInfoCard(Color cardColor, Color tp, Color ts, bool isDark) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.info_outline, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text('Team Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
            ]),
            const SizedBox(height: 20),
            _field('Team Name', _nameCtrl, Icons.sports_cricket),
            const SizedBox(height: 14),
            _field('Sport', _sportCtrl, Icons.sports_cricket_outlined),
            const SizedBox(height: 14),
            _field('Home Ground', _groundCtrl, Icons.place),
            const SizedBox(height: 14),
            _field('Description', _descCtrl, Icons.description_outlined, maxLines: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachingStaffCard(Color cardColor, Color tp, Color ts, bool isDark) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.people_alt, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text('Coaching Staff', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
            ]),
            const SizedBox(height: 16),
            ..._coaches.map((c) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: isDark ? 0.08 : 0.04),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.accent.withValues(alpha: 0.15)),
              ),
              child: Row(children: [
                Container(
                  width: 36, height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: AppColors.accent, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: tp)),
                    Text('${c.role} · ${c.detail}', style: TextStyle(fontSize: 11, color: ts)),
                  ],
                )),
                IconButton(
                  icon: Icon(Icons.close, size: 16, color: ts),
                  onPressed: () => setState(() => _coaches.remove(c)),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                ),
              ]),
            )),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: TextFormField(
                controller: _coachCtrl,
                decoration: InputDecoration(
                  hintText: 'Add coach name...',
                  hintStyle: TextStyle(color: ts, fontSize: 13),
                  prefixIcon: Icon(Icons.person_add, size: 18, color: ts),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.divider)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: isDark ? AppColors.dividerDark : AppColors.divider)),
                ),
              )),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () {
                  if (_coachCtrl.text.isNotEmpty) {
                    setState(() {
                      _coaches.add(_Coach(_coachCtrl.text, 'Coach', 'New'));
                      _coachCtrl.clear();
                    });
                  }
                },
                icon: const Icon(Icons.add, size: 18),
                style: IconButton.styleFrom(backgroundColor: AppColors.accent),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(Color cardColor, Color tp, Color ts, bool isDark) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.tune, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text('Team Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
            ]),
            const SizedBox(height: 16),
            _toggle('Public Team', 'Visible on platform search', _isPublic, (v) => setState(() => _isPublic = v), ts),
            Divider(color: isDark ? AppColors.dividerDark : AppColors.divider, height: 20),
            _toggle('Require Approval', 'New members need manager approval', _requireApproval, (v) => setState(() => _requireApproval = v), ts),
            Divider(color: isDark ? AppColors.dividerDark : AppColors.divider, height: 20),
            _toggle('Search Visibility', 'Appear in tournament search results', _visibleOnSearch, (v) => setState(() => _visibleOnSearch = v), ts),
          ],
        ),
      ),
    );
  }

  Widget _toggle(String title, String subtitle, bool value, ValueChanged<bool> onChanged, Color ts) {
    return Row(children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 11, color: ts)),
        ],
      )),
      Switch.adaptive(value: value, onChanged: onChanged, activeColor: AppColors.accent),
    ]);
  }

  Widget _field(String label, TextEditingController ctrl, IconData icon, {int maxLines = 1}) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
    );
  }
}

class _Coach {
  final String name;
  final String role;
  final String detail;
  const _Coach(this.name, this.role, this.detail);
}
