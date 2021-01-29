//
//  SugDataManager.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 29.01.2021.
//
//---------------------------- Interface sugregation ---------------------------
//
// Many client-specific interfaces are better than one general-purpose interface
//

import Foundation


protocol ReadManager {
    func read()
}

protocol ReadWriteManager : ReadManager {
    func write()
}

protocol AdminManager : ReadWriteManager {
    func delete()
}

class SgDiskRealmManager : ReadWriteManager{
    
    func read() {
        print("Reading DiskRealmManager")
    }
    
    func write() {
        print("Save into Realm")
    }
}

class SgDiskCoreDataManager : ReadWriteManager {
    
    func read() {
        print("Reading DiskCoreDataManager")
    }
    
    func write() {
        print("Save into CoreData")
    }
}

class SgInMemoryRealmManager: ReadManager {
    func read() {
        print("Reading DiskRealmManager")
    }
}

class SgAdminRealmManager: AdminManager {
    func delete() {
        print("Delete any selected DB by Admin")
    }
    func read() {
        print("Reading AdminDataManager")
    }
    
    func write() {
        print("Save into Admin selected DB")
    }
}

class TestSugDiskManager {
    
    var dataManagers: [ReadManager] = [SgDiskRealmManager(), SgDiskCoreDataManager(), SgInMemoryRealmManager(), SgAdminRealmManager()]
    
    func test() {
        for dm in dataManagers {
            dm.read()
            (dm as? ReadWriteManager)?.write()
            (dm as? AdminManager)?.delete()
        }
    }
    
}
