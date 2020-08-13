var totalWeight: Float = 0

func initializeWeightData() {
  totalWeight = 0
  // if a backup exists, we load that
}

func newTotalWeight(_ weightToAdd: String) -> String {
  if let weightFloat = Float(weightToAdd) {
    totalWeight = totalWeight + weightFloat
  }
  print(totalWeight)
  return String(totalWeight)
}

