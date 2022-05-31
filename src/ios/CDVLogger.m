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

- (void) redirectConsoleLogToDocumentFolder
{
       NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                    NSUserDomainMask, YES);
       NSString *documentsDirectory = [paths objectAtIndex:0];
       NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"MYAPP-LOGS.log"];
        freopen([logPath fileSystemRepresentation],"a+",stderr);
}

- (void) pluginInitialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

- (void) finishLaunching:(NSNotification *)notification
{
    [self redirectConsoleLogToDocumentFolder];
}

@end