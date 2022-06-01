#import <Cordova/CDV.h>

@interface CDVCustomLogger : CDVPlugin {
  // Member variables go here.
}

- (void)logMessage:(CDVInvokedUrlCommand*)command;

@end