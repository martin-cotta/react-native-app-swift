#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "SwiftBridgeModule.h"

@interface RCT_EXTERN_MODULE_SWIFT(CalendarManager, NSObject)

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date)

@end
