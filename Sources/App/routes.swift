import Vapor

func routes(_ app: Application) throws {
  app.get { req in
    return "Total: \(totalWeight)"
  }
  
  app.get("resetWeight", "noSeriouslyResetTheCounter") { req -> String in
    resetTheCounter()
  }
  
  app.get("getWeight") { req -> String in
    return String(totalWeight)
  }
  
  app.post("addWeight") { req -> String in
    let weightToAdd = try req.content.decode(Weight.self)
    return "New total: \(newTotalWeight(weightToAdd.weight))"
  }
}

struct Weight: Content {
  let weight: String
}
