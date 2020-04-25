//
//  ToReadBook.swift
//  CoreDataToRead
//
//  Created by Sarina Gaines on 4/24/20.
//  Copyright © 2020 Sarina Gaines. All rights reserved.
//

import Foundation
import CoreData

public class ToReadBook:NSManagedObject, Identifiable{
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
}

extension  ToReadBook{
    static func getAllToReadBooks() -> NSFetchRequest<ToReadBook>{
        
        let request: NSFetchRequest<ToReadBook> = ToReadBook.fetchRequest() as!
            NSFetchRequest<ToReadBook>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
