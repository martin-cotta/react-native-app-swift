import Foundation

@objc(CalendarManager)
class CalendarManager: NSObject {
    @objc(addEvent:location:date:)
    func addEvent(name _: String, location _: String, date _: NSNumber) {
        // Date is ready to use!
    }

    @objc
    func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }
}
