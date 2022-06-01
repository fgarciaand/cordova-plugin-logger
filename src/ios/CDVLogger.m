#import "CDVLogger.h"
#import <Cordova/CDV.h>

@implementation CDVLogger

- (void)writeLogToFile:(NSString *)message
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [paths objectAtIndex:0];

    NSString *pathFile = [NSString stringWithFormat:@"%@/myapp_log.txt", docPath];
    NSString* content = [NSString stringWithContentsOfFile:pathFile
                                                encoding:NSUTF8StringEncoding
                                                    error:NULL];
    NSString* newContent = [NSString stringWithFormat:@"%@\n%@", content,message];
    NSError *error = nil;
    [newContent writeToFile:pathFile atomically:YES encoding:NSUTF8StringEncoding error:&error];
    content = [NSString stringWithContentsOfFile:pathFile
                                                encoding:NSUTF8StringEncoding
                                                    error:NULL];
    NSLog(@"%@", content);
}


/* log a message */
- (void)logLevel:(CDVInvokedUrlCommand*)command
{
    id message = [command argumentAtIndex:0];
    [self writeLogToFile:message];
}

@end