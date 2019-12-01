class OldCassetPlayer{
    func playCasset() -> String {
        return "playing casset"
    }
}

protocol ModernMusicPlayer{
    func playMusic() -> String
}

class OldCassetAdapter: ModernMusicPlayer {
    var oldCassetPlayer: OldCassetPlayer
    
    init(oldCasset: OldCassetPlayer) {
        oldCassetPlayer = oldCasset;
    }
    
    func playMusic() -> String {
        return oldCassetPlayer.playCasset()
    }
}
