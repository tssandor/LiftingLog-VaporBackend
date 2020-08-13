var totalWeight: Float = 0
let name = "weightDataFile"

func initializeWeightData() {
  totalWeight = 0
  // if a backup exists, we load that
  if let data = FileController.readFileSync(name), let content = String(data: data, encoding: .utf8) {
    if let fromFileToFloat = Float(content) {
      totalWeight = fromFileToFloat
    }
  }
}

func backupWeightData() -> Bool {
  let weightToStr = String(totalWeight)
  guard let data = weightToStr.data(using: .utf8)
       else { return false }
  FileController.writeFileSync(named: name, with: data)
  return true
}

func newTotalWeight(_ weightToAdd: String) -> String {
  if let weightFloat = Float(weightToAdd) {
    totalWeight = totalWeight + weightFloat
  }
  if backupWeightData() {
    print(totalWeight)
  }
  return String(totalWeight)
}

func resetTheCounter() -> Bool {
  guard let data = "0.0".data(using: .utf8)
    else { return false }
  FileController.writeFileSync(named: name, with: data)
  return true
}

