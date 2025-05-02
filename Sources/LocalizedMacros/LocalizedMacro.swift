import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `#Localized` macro.
public struct LocalizedMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        let firstIndex = node.arguments.index(node.arguments.startIndex,
                                              offsetBy: 0)
        let localized = node.arguments[firstIndex].expression

        var commentStr = ""
        if node.arguments.count == 2 {
            let secondIndex = node.arguments.index(node.arguments.startIndex,
                                                   offsetBy: 1)
            let comment = node.arguments[secondIndex].expression

            commentStr = ", comment: \(comment)"
        }

        return "String(localized: \(localized), bundle: .tfx\(raw: commentStr))"
    }
}

@main
struct LocalizedPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        LocalizedMacro.self,
    ]
}
