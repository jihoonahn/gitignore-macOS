//
//  SourceEditorExtension.swift
//  gitignore Editor
//
//  Created by Ji-hoon Ahn on 2022/05/30.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    func extensionDidFinishLaunching() {
        debugPrint("gitignore Editor")
    }
}
