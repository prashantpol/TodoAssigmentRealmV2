//
//  Todo.swift
//  TodoAssigmentRealm
// id : 300906092

//  Created by Prashant Pol on 2017-02-21.
//  Copyright © 2017 Polorg. All rights reserved.
//

import Foundation
import RealmSwift

class Todo:Object{
    dynamic var name: String = ""
    dynamic var notes: String = ""
    dynamic var status = false
}
