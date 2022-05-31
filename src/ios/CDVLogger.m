#import "CDVLogger.h"
#import <Cordova/CDV.h>

@implementation CDVLogger

/* log a message */
- (void)logLevel:(CDVInvokedUrlCommand*)command
{
    id level = [command argumentAtIndex:0];
    id message = [command argumentAtIndex:1];

    if ([level isEqualToString:@"LOG"]) {
        NSLog(@"%@", message);
    } else {
        NSLog(@"%@: %@", level, message);
    }
}

@end