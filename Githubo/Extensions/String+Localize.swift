extension String {
    func localize() -> String {
        return self.localized(using: "Localization", in: .main)
    }
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + self.lowercased().dropFirst()
    }
}
