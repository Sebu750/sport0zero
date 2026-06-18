import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../shared/models/user_model.dart';
import '../../../shared/models/player_stats_model.dart';
import '../domain/achievement_model.dart';
import '../domain/tournament_history_model.dart';

/// Repository for user profile CRUD operations via Firestore
/// and avatar uploads via Firebase Storage.
class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  CollectionReference get _profiles => _firestore.collection('profiles');

  /// Get the current user's UID (null if not signed in)
  String? get currentUid => _auth.currentUser?.uid;

  // ── Helpers ──────────────────────────────────────────────────────────────────

  UserModel _parseProfile(String uid, Map<String, dynamic> data) {
    return UserModel(
      id: uid,
      cnicHash: data['cnicHash'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      email: data['email'] as String? ?? _auth.currentUser?.email ?? '',
      displayName: data['displayName'] as String? ?? _auth.currentUser?.displayName,
      photoUrl: data['photoUrl'] as String? ?? '',
      verified: data['verified'] as bool? ?? false,
      roles: _parseRoles(data['roles']),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      // FR-10 fields
      dateOfBirth: (data['dateOfBirth'] as Timestamp?)?.toDate(),
      city: data['city'] as String?,
      primarySports: _parseStringList(data['primarySports']),
      playingPosition: data['playingPosition'] as String?,
      battingHand: _parseEnum(data['battingHand'], BattingHand.values, BattingHand.right),
      bowlingHand: _parseEnum(data['bowlingHand'], BowlingHand.values, BowlingHand.none),
      dominantHand: _parseEnum(data['dominantHand'], PlayingHand.values, PlayingHand.right),
      // FR-11 fields
      whatsappNumber: data['whatsappNumber'] as String?,
      showContactToScouts: data['showContactToScouts'] as bool? ?? false,
      // FR-18 fields
      privacyMode: _parseEnum(data['privacyMode'], PrivacyMode.values, PrivacyMode.public),
    );
  }

  List<String> _parseStringList(dynamic data) {
    if (data is List) return data.cast<String>();
    return [];
  }

  T _parseEnum<T extends Enum>(dynamic value, List<T> values, T fallback) {
    if (value == null) return fallback;
    return values.firstWhere(
      (e) => e.name == value.toString(),
      orElse: () => fallback,
    );
  }

  List<UserRole> _parseRoles(dynamic rolesData) {
    if (rolesData is List) {
      return rolesData.map((r) {
        return switch (r.toString()) {
          'player' => UserRole.player,
          'manager' => UserRole.manager,
          'organizer' => UserRole.organizer,
          'admin' => UserRole.admin,
          _ => UserRole.player,
        };
      }).toList();
    }
    return [UserRole.player];
  }

  // ── Profile CRUD ─────────────────────────────────────────────────────────────

  /// Fetch profile document from Firestore for the given UID.
  Future<UserModel?> fetchProfile(String uid) async {
    final doc = await _profiles.doc(uid).get();
    if (!doc.exists) return null;
    return _parseProfile(uid, doc.data()! as Map<String, dynamic>);
  }

  /// Update profile fields in Firestore (merge update — only non-null fields written).
  Future<void> updateProfile({
    String? displayName,
    String? phone,
    String? photoUrl,
    String? cnicHash,
    List<String>? roles,
    bool? verified,
    // FR-10
    DateTime? dateOfBirth,
    bool clearDateOfBirth = false,
    String? city,
    List<String>? primarySports,
    String? playingPosition,
    BattingHand? battingHand,
    BowlingHand? bowlingHand,
    PlayingHand? dominantHand,
    // FR-11
    String? whatsappNumber,
    bool? showContactToScouts,
    // FR-18
    PrivacyMode? privacyMode,
  }) async {
    final uid = currentUid;
    if (uid == null) throw Exception('No user signed in');

    final updates = <String, dynamic>{
      'updatedAt': Timestamp.now(),
    };

    if (displayName != null) updates['displayName'] = displayName;
    if (phone != null) updates['phone'] = phone;
    if (photoUrl != null) updates['photoUrl'] = photoUrl;
    if (cnicHash != null) updates['cnicHash'] = cnicHash;
    if (roles != null) updates['roles'] = roles;
    if (verified != null) updates['verified'] = verified;

    // FR-10
    if (dateOfBirth != null) updates['dateOfBirth'] = Timestamp.fromDate(dateOfBirth);
    if (clearDateOfBirth) updates['dateOfBirth'] = null;
    if (city != null) updates['city'] = city;
    if (primarySports != null) updates['primarySports'] = primarySports;
    if (playingPosition != null) updates['playingPosition'] = playingPosition;
    if (battingHand != null) updates['battingHand'] = battingHand.name;
    if (bowlingHand != null) updates['bowlingHand'] = bowlingHand.name;
    if (dominantHand != null) updates['dominantHand'] = dominantHand.name;

    // FR-11
    if (whatsappNumber != null) updates['whatsappNumber'] = whatsappNumber;
    if (showContactToScouts != null) updates['showContactToScouts'] = showContactToScouts;

    // FR-18
    if (privacyMode != null) updates['privacyMode'] = privacyMode.name;

    await _profiles.doc(uid).set(updates, SetOptions(merge: true));

    if (displayName != null) {
      await _auth.currentUser?.updateDisplayName(displayName);
    }
  }

  /// Stream profile changes in real-time from Firestore.
  Stream<UserModel?> profileStream(String uid) {
    return _profiles.doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return _parseProfile(uid, doc.data()! as Map<String, dynamic>);
    });
  }

  // ── FR-11: Privacy helpers ───────────────────────────────────────────────────

  /// Quick-patch privacy mode.
  Future<void> updatePrivacyMode(PrivacyMode mode) async {
    final uid = currentUid;
    if (uid == null) throw Exception('No user signed in');
    await _profiles.doc(uid).set({
      'privacyMode': mode.name,
      'updatedAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  /// Quick-patch contact visibility for scouts.
  Future<void> updateContactVisibility(bool showToScouts) async {
    final uid = currentUid;
    if (uid == null) throw Exception('No user signed in');
    await _profiles.doc(uid).set({
      'showContactToScouts': showToScouts,
      'updatedAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  // ── FR-16: Achievements subcollection ────────────────────────────────────────

  /// Stream achievements in real-time.
  Stream<List<AchievementModel>> achievementsStream(String uid) {
    return _profiles
        .doc(uid)
        .collection('achievements')
        .orderBy('earnedAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => AchievementModel.fromJson({
                  'id': d.id,
                  ...d.data(),
                }))
            .toList());
  }

  // ── FR-14: Tournament history subcollection ──────────────────────────────────

  /// Stream tournament history in real-time (most recent first).
  Stream<List<TournamentHistoryModel>> tournamentHistoryStream(String uid) {
    return _profiles
        .doc(uid)
        .collection('tournamentHistory')
        .orderBy('startDate', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => TournamentHistoryModel.fromJson({
                  'id': d.id,
                  ...d.data(),
                }))
            .toList());
  }

  // ── FR-13: Per-sport stats subcollection ─────────────────────────────────────

  /// Stream all sport-specific stats as a map keyed by sportId.
  Stream<Map<String, PlayerStatsModel>> multiSportStatsStream(String uid) {
    return _profiles
        .doc(uid)
        .collection('stats')
        .snapshots()
        .map((snap) {
      final map = <String, PlayerStatsModel>{};
      for (final doc in snap.docs) {
        final data = doc.data();
        map[doc.id] = PlayerStatsModel.fromJson({
          'userId': uid,
          'sportId': doc.id,
          ...data,
        });
      }
      return map;
    });
  }

  // ── FR-17: Public profile URL ────────────────────────────────────────────────

  /// Generate a public profile URL for sharing.
  String getPublicProfileUrl(String uid) {
    return 'https://sport0zero.web.app/p/$uid';
  }

  // ── Avatar ───────────────────────────────────────────────────────────────────

  /// Upload avatar image to Firebase Storage. Returns the download URL.
  Future<String> uploadAvatar(Uint8List imageBytes, {String contentType = 'image/jpeg'}) async {
    final uid = currentUid;
    if (uid == null) throw Exception('No user signed in');

    final ref = _storage.ref().child('avatars/$uid/photo');
    final metadata = SettableMetadata(contentType: contentType);

    await ref.putData(imageBytes, metadata);
    final downloadUrl = await ref.getDownloadURL();

    await _profiles.doc(uid).set({'photoUrl': downloadUrl, 'updatedAt': Timestamp.now()}, SetOptions(merge: true));
    await _auth.currentUser?.updatePhotoURL(downloadUrl);

    return downloadUrl;
  }

  /// Delete the avatar image from Storage.
  Future<void> deleteAvatar() async {
    final uid = currentUid;
    if (uid == null) return;

    try {
      await _storage.ref().child('avatars/$uid/photo').delete();
    } catch (_) {}

    await _profiles.doc(uid).set({'photoUrl': '', 'updatedAt': Timestamp.now()}, SetOptions(merge: true));
    await _auth.currentUser?.updatePhotoURL(null);
  }
}
