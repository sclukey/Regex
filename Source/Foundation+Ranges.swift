import Foundation

#if os(Linux)
typealias NSTextCheckingResult = TextCheckingResult
#endif

internal extension NSTextCheckingResult {
  var ranges: [NSRange] {
#if os(Linux)
  return stride(from: 0, to: numberOfRanges, by: 1).map(range)
#else
  return stride(from: 0, to: numberOfRanges, by: 1).map(rangeAt)
#endif
  }
}

internal extension String {
  var entireRange: NSRange {
    return NSRange(location: 0, length: utf16.count)
  }
}
