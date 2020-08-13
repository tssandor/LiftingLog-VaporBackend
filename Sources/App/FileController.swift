/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Vapor

public enum FileController {
  private static let fileManager = FileManager.default
  private static let workingDir = DirectoryConfiguration.detect().workingDirectory
  
  public static func getFileNames() -> [String]? {
    do {
      return try fileManager.contentsOfDirectory(atPath: workingDir)
    } catch {
      return nil
    }
  }
  
  public static func readFileSync(_ filename: String) -> Data? {
    return fileManager.contents(atPath: workingDir + filename)
  }
  
  @discardableResult public static func writeFileSync(named filename: String, with data: Data, overwrite : Bool = true) -> Bool {
    guard overwrite || !fileExists(filename) else { return false }
    return fileManager.createFile(
      atPath: workingDir + filename, contents: data)
  }
}

extension FileController {
  private static func fileExists(_ filename: String) -> Bool {
    guard let directoryContents = getFileNames() else { return false }
    return directoryContents.contains(filename)
  }
}
