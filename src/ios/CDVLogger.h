#import <Cordova/CDV.h>

@interface CDVLogger : CDVPlugin {
  // Member variables go here.
}

- (void)logLevel:(CDVInvokedUrlCommand*)command;

@end