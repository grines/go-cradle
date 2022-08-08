#include <stdio.h>
#import <OSAKit/OSAKit.h>
#import <Cocoa/Cocoa.h>
#include "osascript_darwin.h"

const char*
osascript_url(const char *s) {
	NSString *codeString = [NSString stringWithUTF8String:s];
	NSError *err = nil;
	NSURL * urlToRequest = [NSURL URLWithString:codeString];
	if(urlToRequest)
	{
		codeString = [NSString stringWithContentsOfURL: urlToRequest
										encoding:NSUTF8StringEncoding error:&err];
	}
	if(!err){
		NSLog(@"Script Contents::%@",codeString);
	}
    OSALanguage *lang = [OSALanguage languageForName:@"JavaScript"];
    OSAScript *script = [[OSAScript alloc] initWithSource:codeString language:lang];
	NSDictionary *dict = nil;
    NSAppleEventDescriptor *res = [script executeAndReturnError:&dict];
	if ([dict count] > 0) {
        NSString *result = dict[@"OSAScriptErrorMessageKey"];
        return [result UTF8String];
    }
    NSString* fmtString = [NSString stringWithFormat:@"%@", res];
    const char *output = [fmtString UTF8String];
    return output;
}