// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that generates the localized string version of a string using Transifex SDK custom bundle
/// argument. For example,
///
///     #Localized("a string", comment: "a comment")
///
/// produces the following:
///
///     String(localized: "a string", bundle: .tfx, comment: "a comment")
@freestanding(expression)
public macro Localized(_ value: String,
                       comment: StaticString? = nil) -> String = #externalMacro(module: "LocalizedMacros",
                                                                                type: "LocalizedMacro")
