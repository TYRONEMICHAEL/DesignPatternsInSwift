protocol Database {
    func save() -> String
}

class Adapter: Database {
    let db: RethinkDb
    
    init(db: RethinkDb) {
        self.db = db
    }
    
    func save() -> String {
        return db.saveItem()
    }
}

class RethinkDb {
    func saveItem() -> String {
        return "Item was saved successfully"
    }
}


// Usage

let db: Database = Adapter(db: RethinkDb())
db.save()