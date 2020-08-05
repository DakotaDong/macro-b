//
//  DBHelper.swift
//  SlideInTransition
//
//  Created by Chelsea Cui on 7/27/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation
import SQLite3

class DBHelper
{
    init()
    {
        db = openDatabase()
//        createTable()
    }

   let dbPath: String = "macroApp.db"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
//        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//            .appendingPathComponent(dbPath)
      let fileURL = Bundle.main.url(forResource: "macroApp", withExtension: "db")!
//        let fileURL = try! FileManager.default
//        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
      //if sqlite3_open(fileURL.path, &db) != SQLITE_OK
      if sqlite3_open_v2(fileURL.path, &db, SQLITE_OPEN_READWRITE, nil) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
//    func createTable() {
//      let createTableString = """
//          CREATE TABLE IF NOT EXISTS `Order`(
//          id INTEGER PRIMARY KEY AUTOINCREMENT,
//          commonName TEXT ,
//          scientificName TEXT,
//          featuredImage TEXT,
//          pollution TEXT,
//          orderIntro TEXT,
//          lifeHistory TEXT
//        );
//        """
//       // 1
//        var createTableStatement: OpaquePointer?
//        // 2
//        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) ==
//            SQLITE_OK {
//          // 3
//          if sqlite3_step(createTableStatement) == SQLITE_DONE {
//            print("\nOrder table created.")
//          } else {
//            print("\nOrder table is not created.")
//          }
//        } else {
//          print("\nCREATE TABLE statement is not prepared.")
//        }
//        // 4
//        sqlite3_finalize(createTableStatement)
//  }
//
    
//    func insert(id:Int, commonName: String, scientificName: String, featuredImage: String, pollution: String, orderIntro: String, lifeHistory:String)
//    {
//        let orders = read()
//        for o in orders
//        {
//            if o.id == id
//            {
//                return
//            }
//        }
//
//        let insertStatementString = "INSERT INTO `order`(id, commonName, scientificName,featuredImage,pollution,orderIntro,lifeHistory) VALUES (?, ?, ?, ?, ?, ?, ?);"
//        var insertStatement: OpaquePointer? = nil
//        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
//            sqlite3_bind_int(insertStatement, 1, Int32(id))
//            sqlite3_bind_text(insertStatement, 2, (commonName as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 3, (scientificName as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 4, (featuredImage as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 5, (pollution as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 6, (orderIntro as NSString).utf8String, -1, nil)
//            sqlite3_bind_text(insertStatement, 7, (lifeHistory as NSString).utf8String, -1, nil)
//
//
//            if sqlite3_step(insertStatement) == SQLITE_DONE {
//                print("Successfully inserted row.")
//            } else {
//                print("Could not insert row.")
//            }
//        } else {
//            print("INSERT statement could not be prepared.")
//        }
//        sqlite3_finalize(insertStatement)
//    }
    
    func readOrders() -> [Order] {
        let queryStatementString = "SELECT * FROM `order`;"
        var queryStatement: OpaquePointer? = nil
        var psns : [Order] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let commonName = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let scientificName = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let featuredImage = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let pollution = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let orderIntro = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let lifeHistory = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let illustrationImage = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                let secondImage = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
              psns.append(Order(id: Int(id), commonName: commonName, scientificName: scientificName, featuredImage:featuredImage, pollution:pollution, orderIntro:orderIntro,lifeHistory:lifeHistory, illustrationImage:illustrationImage, secondImage:secondImage ))
                print("ReadOrders Query Result:")
                print("\(id) | \(scientificName) | \(commonName)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
    func readOrderDiagCharacters() -> [OrderDiagCharacter] {
        let queryStatementString = "SELECT * FROM OrderDiagCharacter;"
        var queryStatement: OpaquePointer? = nil
        var psns : [OrderDiagCharacter] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let orderId = sqlite3_column_int(queryStatement, 1)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                psns.append(OrderDiagCharacter(id: Int(id), orderId: Int(orderId), name: name, description:description))
                print("ReadOrderDiagCharacters Query Result:")
                print("\(id) | \(orderId) | \(name)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
   func readOrderDiagCharacterByOrder(orderId:Int) -> [OrderDiagCharacter] {
        let queryStatementString = "SELECT * FROM OrderDiagCharacter WHERE orderID = \(orderId);"
        var queryStatement: OpaquePointer? = nil
        var psns : [OrderDiagCharacter] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let orderId = sqlite3_column_int(queryStatement, 1)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
              psns.append(OrderDiagCharacter(id: Int(id), orderId: Int(orderId), name: name, description: description))
                print("ReadOrderDiagCharacterByOrder Query Result:")
                print("\(id) | \(orderId) | \(name)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
    func readFamilyByOrder(orderId:Int) -> [Family] {
        let queryStatementString = "SELECT * FROM Family WHERE orderID = \(orderId);"
        var queryStatement: OpaquePointer? = nil
        var psns : [Family] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let orderId = sqlite3_column_int(queryStatement, 1)
                let commonName = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let scientificName = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let pollution = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
              psns.append(Family(id: Int(id), orderId: Int(orderId), commonName: commonName, scientificName: scientificName, pollution:pollution, description: description))
                print("ReadFamilyByOrder Query Result:")
                print("\(id) | \(orderId) | \(commonName)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
    func readFamilyDiagCharacterByFamily(familyId:Int) -> [FamilyDiagCharacter] {
        let queryStatementString = "SELECT * FROM FamilyDiagCharacter WHERE familyId = \(familyId);"
        var queryStatement: OpaquePointer? = nil
        var psns : [FamilyDiagCharacter] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let familyId = sqlite3_column_int(queryStatement, 1)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
              psns.append(FamilyDiagCharacter(id:Int(id), familyId: Int(familyId), name: name, description:description))
                print("readFamilyDiagCharacterByFamily Query Result:")
                print("\(id) | \(familyId) | \(name)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
    func readGenusByFamily(familyId:Int) -> [Genus] {
        let queryStatementString = "SELECT * FROM Genus WHERE familyID = \(familyId);"
        var queryStatement: OpaquePointer? = nil
        var psns : [Genus] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let familyId = sqlite3_column_int(queryStatement, 1)
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let ventralImage = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let dorsalImage = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
              psns.append(Genus(id:Int(id), familyId: Int(familyId), name: name, ventralImage: ventralImage, dorsalImage: dorsalImage))
                print("ReadGenusByFamily Query Result:")
                print("\(id) | \(familyId) | \(name)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
  
    
}
