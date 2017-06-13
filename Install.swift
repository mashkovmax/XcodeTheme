import Foundation
import Files // marathon:https://github.com/JohnSundell/Files.git
import ShellOut // marathon:https://github.com/JohnSundell/ShellOut.git

print("🎨  Downloading Max's Xcode theme...")

let themeURL = URL(string: "https://raw.githubusercontent.com/mashkovmax/XcodeTheme/master/Max.xccolortheme")!
let themeData = try Data(contentsOf: themeURL)

print("🎨  Installing Max's Xcode theme...")

let xcodeFolder = try Folder.home.subfolder(atPath: "Library/Developer/Xcode")
let userDataFolder = try xcodeFolder.createSubfolderIfNeeded(withName: "UserData")
let themeFolder = try userDataFolder.createSubfolderIfNeeded(withName: "FontAndColorThemes")

let themeFile = try themeFolder.createFile(named: "Max.xccolortheme")
try themeFile.write(data: themeData)

print("")
print("🎉 Max's theme successfully installed")
print("👍 Select it in Xcode's preferences to start using it (you may have to restart Xcode first)")
