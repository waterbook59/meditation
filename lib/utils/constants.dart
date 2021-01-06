enum HeaderType {
  level,
  theme,
  time,
}

//headerPartが押せるのは、beforeStartとfinishedのときだけ
enum RunningStatus {
  beforeStart,
  onStart,
  inhale,
  hold,
  exhale,
  pause,
  finished,
}