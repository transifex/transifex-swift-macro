import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not
// available when cross-compiling. Cross-compiled tests may still make use of
// the macro itself in end-to-end tests.
#if canImport(LocalizedMacros)
import LocalizedMacros

let testMacros: [String: Macro.Type] = [
    "Localized": LocalizedMacro.self,
]
#endif

final class LocalizedTests: XCTestCase {
    func testMacro() throws {
        #if canImport(LocalizedMacros)
        assertMacroExpansion(
            """
            #Localized("a", comment: "b")
            """,
            expandedSource: """
            String(localized: "a", bundle: .tfx, comment: "b")
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroWithArg() throws {
        #if canImport(LocalizedMacros)
        assertMacroExpansion(
            """
            #Localized("a \(8)", comment: "b")
            """,
            expandedSource: """
            String(localized: "a \(8)", bundle: .tfx, comment: "b")
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroNoComment() throws {
        #if canImport(LocalizedMacros)
        assertMacroExpansion(
            """
            #Localized("a")
            """,
            expandedSource: """
            String(localized: "a", bundle: .tfx)
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroMultilineString() throws {
        #if canImport(LocalizedMacros)
        assertMacroExpansion(
            """
            #Localized(\"""
            a
            \""")
            """,
            expandedSource: """
            String(localized: \"""
            a
            \""", bundle: .tfx)
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroMultilineStringAndComment() throws {
        #if canImport(LocalizedMacros)
        assertMacroExpansion(
            """
            #Localized(\"""
            a
            \""", comment: \"""
            b
            \""")
            """,
            expandedSource: """
            String(localized: \"""
            a
            \""", bundle: .tfx, comment: \"""
            b
            \""")
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
