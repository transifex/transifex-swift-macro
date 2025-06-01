# Transifex Swift Localized Macro

> [!WARNING]
>
> **HIGHLY EXPERIMENTAL LOGIC**
>
> Please be advised that the following tool is still under active development.

The Transifex Swift Localized Macro allows developers to create
`String(localized: ...)` calls where the custom Transifex bundle (`Bundle.tfx`)
is added automatically.

This is a helper macro that can be used alongside the
[custom bundle approach](https://github.com/transifex/transifex-swift/tree/2.0.9-alpha?tab=readme-ov-file#custom-bundle-approach)
of the Transifex iOS SDK.

## Installation

Add the current Swift Package in your application, selecting the Localized
library to be added to your application target(s) when the 'Choose Package
products' popup appears.

You will then have to 'Trust & Enable' the macro before the application can
be able to use it.

After that you can `import Localized` and you will be ready to use the macro.

## Usage

Specifying the following macros:

```swift
#Localized("You cannot pass.")

#Localized("The wise speak only of what they know.", comment: "Gandalf quote")
```

will be expanded to:

```swift
String(localized: "You cannot pass.", bundle: .tfx)

String(localized: "The wise speak only of what they know.", bundle: .tfx, comment: "Gandalf quote")
```

## Minimum Requirements

| Swift           | Xcode           | Platforms    |
|-----------------|-----------------|--------------|
| Swift 6.1       | Xcode 16.3      | MacOS 15     |

## License

Licensed under Apache License 2.0, see [LICENSE](LICENSE) file.
