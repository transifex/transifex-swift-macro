import Localized
import Foundation

extension Bundle {
    /// Dummy getter to avoid compiler errors.
    public static var tfx: Bundle {
        .main
    }
}
    
let localized = #Localized("a", comment: "b")
print("localized: \(localized)")

let localizedWithArgument = #Localized("a is \(8)", comment: "b")
print("localizedWithArgument: \(localizedWithArgument)")

let localizedWithoutComment = #Localized("b")
print("localizedWithoutComment: \(localizedWithoutComment)")

let localizedWithMultilineStringAndComment = #Localized("""
a
""", comment: """
b
""")
print("localizedWithMultilineStringAndComment: \(localizedWithMultilineStringAndComment)")
