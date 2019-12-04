class FootballPlayer {
    var name: String
    var isGoolKeeper: Bool
    
    init(name: String, isGoolKeeper: Bool) {
        self.name = name
        self.isGoolKeeper = isGoolKeeper
    }
}

class FootballTeam {
    private var players: [FootballPlayer] = []
    
    func makeGoolkeepersIterator() -> GoolKeppersIterator {
        return GoolKeppersIterator(players: self.players)
    }
    
    func addPlayer(player: FootballPlayer) {
        players.append(player)
    }
}

class GoolKeppersIterator: IteratorProtocol {
    private let players: [FootballPlayer]
    private var currentIndex: Int = 0
    
    init(players: [FootballPlayer]) {
        self.players = players.filter({ (player) -> Bool in
            return player.isGoolKeeper
        })
    }
    
    func next() -> FootballPlayer? {
        let result = self.players.count > currentIndex ? self.players[currentIndex] : nil
        currentIndex += 1
        
        return result
    }
    
}
