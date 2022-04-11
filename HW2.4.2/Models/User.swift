struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(login: "Homework",
             password: "Password",
             person: .getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullname: String {
        name + " " + surname
    }
    
    static func getPerson() -> Person {
        Person(name: "Alex", surname: "Shaber")
    }
}
