import Foundation
import Kitura

let router = Router()

var mike = User()
mike.id = "1"
mike.name = "Mike"
mike.email = "mike@mcdonald.com"

var users: [String: User] = ["1":mike]

router.get("/ok") { request, response, next in
  response.send("ok")
}

router.get("/users/:id") { request, response, next in
  let id: String = request.parameters["id"] ?? ""
  let user: User? = users[id]
  let userData: Data? = try user?.serializedData()
  response.send(data: userData!)
}

router.post("/users") { request, response, next in
  var userData: Data = Data()
  let _ = try request.read(into: &userData)
  let user = try User(serializedData: userData)
  users[user.id] = user
  response.send(data: userData)
}

Kitura.addHTTPServer(onPort: 8080, with: router)

Kitura.run()
