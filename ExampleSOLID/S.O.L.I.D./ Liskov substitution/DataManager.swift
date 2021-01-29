//
//  DataManager.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//
//  ----------------------------  Liskov substitution --------------------------------------
//
//  Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.
//

import Foundation


protocol DataManager {
    func read()
    func write()
}

class DiskRealmManager : DataManager {
    
    func read() {
        print("Reading DiskRealmManager")
    }
    
    func write() {
        print("Save into Realm")
    }
}

class DiskCoreDataManager : DataManager {
    
    func read() {
        print("Reading DiskCoreDataManager")
    }
    
    func write() {
        print("Save into CoreData")
    }
}

class InMemoryRealmManager: DataManager {
    func read() {
        print("Reading DiskRealmManager")
    }
    
    func write() {
        fatalError()
    }
}

class TestDiskManager {
    
    var dataManagers: [DataManager] = [DiskRealmManager(), DiskCoreDataManager(), DiskRealmManager()]
    
    func test() {
        for dm in dataManagers {
            dm.read()
            let inMemoryDM = dm as? InMemoryRealmManager
            if inMemoryDM == nil {
                dm.write()
            }
        }
    }
    
}
