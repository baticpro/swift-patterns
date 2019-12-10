class Client {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

protocol RemoteServer {
    func denyAccess(client: Client) -> String
    func grandAccess(client: Client) -> String
}

class MainServer: RemoteServer {
    func denyAccess(client: Client) -> String {
        return "for user \(client.name) access is denied"
    }
    
    func grandAccess(client: Client) -> String {
        return "for user \(client.name) access is granted"
    }
}

class ProxyServer: RemoteServer {
    let server: MainServer = MainServer()
    var clients: [String: Bool] = [:]
    
    func authenticate(client: Client) {
        clients[client.name] = true
    }
    
    func isAthenticated(client: Client) -> Bool {
        guard let result = clients[client.name] else {
            return false
        }
        
        return result
    }
    
    func denyAccess(client: Client) -> String {
        return isAthenticated(client: client) ? server.denyAccess(client: client) : notLoggedInfo(client: client)
    }
    
    func grandAccess(client: Client) -> String {
        return isAthenticated(client: client) ? server.grandAccess(client: client) : notLoggedInfo(client: client)
    }
    
    func notLoggedInfo(client: Client) -> String {
        return "user \(client.name) not logged"
    }
}
