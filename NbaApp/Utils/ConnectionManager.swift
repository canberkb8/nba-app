//
//  ConnectionManager.swift
//  NbaApp
//
//  Created by Canberk Bibican on 9.04.2022.
//
import Reachability

class ConnectionManager {

    static let sharedInstance = ConnectionManager()
    private var reachability: Reachability!
    let utils = Utils()

    func observeReachability() {
        self.reachability = try! Reachability()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }

    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .cellular:
            print("Network available via Cellular Data.")
            break
        case .wifi:
            print("Network available via WiFi.")
            break
        case .none:
            print("Network is not available.")
            utils.globalAlert(title: "", message: CustomError.internetConnection.errorDescription ?? "Connection Problem")
            break
        case .unavailable:
            print("Network is  unavailable.")
            utils.globalAlert(title: "", message: CustomError.internetConnection.errorDescription ?? "Connection Problem")
            break
        }
    }
}
