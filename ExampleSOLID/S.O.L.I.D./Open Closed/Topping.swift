//
//  Topping.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//
// -------------------------------- Open Closed Principle --------------------------------------------
//
// Modules/Classes/entities should be open for extension but closed for modification. (to some extent)
//

import Foundation
import RealmSwift



//MARK: Demo with Class

class RassportRepository {
    
    var dbManager: RealmDataBaseManager
    
    init(_ dbManager: RealmDataBaseManager) {
        self.dbManager = dbManager
    }
    
    func savePassport(_ passport: Passport) {
        do {
            try self.dbManager.save(object: passport)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

class RealmDataBaseManager: DataBaseManager {
    
    private let realm: Realm?
    
    init(_ realm: Realm? = try! Realm()) {
        self.realm = realm
    }
    
    func save(object: Any) throws {
        guard let realm = realm, let object = object as? Object else {
            throw Realm.Error(.fail)
        }
        try realm.write {
            realm.add(object)
        }
    }
}

class Passport : Object {
    @objc dynamic var name = ""
    @objc dynamic var created = Date()
}

protocol DataBaseManager {
    func save(object: Any) throws
}



//MARK: Demo with Protocol

protocol Toping  {
    var milk: Bool {get set}
    var soy: Bool {get set}
    var mocha: Bool {get set}
    func calculateTopping() -> Int
    func cost() -> Int
}

extension Toping {
    
    func calculateTopping() -> Int {
        var price = 0
        if milk { price += 1 }
        if soy { price += 2 }
        if mocha { price += 3 }
        return price
    }
}

class Expresso: Toping {
    
    var milk: Bool
    var soy: Bool
    var mocha: Bool
    
    init(milk: Bool, soy: Bool, mocha: Bool) {
        self.milk = milk
        self.soy = soy
        self.mocha = mocha
    }
    
    func cost() -> Int {
        return calculateTopping() * 10
    }
    
    
}


protocol Beverage {
   func cost() -> Int
}

protocol CondimentDecorator: Beverage {
    var beverage: Beverage {get set}
}

class Milk: CondimentDecorator {
    var beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Int {
        return 1 + beverage.cost()
    }
}

class Mocha: CondimentDecorator {
    var beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Int {
        return 3 + beverage.cost()
    }
}

class Soy: CondimentDecorator {
    var beverage: Beverage
    
    init(_ beverage: Beverage) {
        self.beverage = beverage
    }
    
    func cost() -> Int {
        return 4 + beverage.cost()
    }
}

class SimpleExpresso: Beverage {
    func cost() -> Int {
        return 1
    }
}

class MakeCoffe {
    
    func getSomeCoffe() {
        
        var expresso: Beverage = SimpleExpresso()
        expresso = Milk(expresso)
        expresso = Mocha(expresso)
        expresso = Soy(expresso)
        
        print(expresso.cost())
    }
    
}
