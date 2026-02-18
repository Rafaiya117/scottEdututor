class TalkingAvatarState {
  final bool isTalking;
  final bool isListening;
  final String? lastError;

  TalkingAvatarState({
    this.isTalking = false,
    this.isListening = false,
    this.lastError,
  });

  TalkingAvatarState copyWith({bool? isTalking, bool? isListening, String? lastError}) {
    return TalkingAvatarState(
      isTalking: isTalking ?? this.isTalking,
      isListening: isListening ?? this.isListening,
      lastError: lastError ?? this.lastError,
    );
  }
}