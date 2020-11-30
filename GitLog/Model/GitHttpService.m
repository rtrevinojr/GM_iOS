//
//  GitHttpService.m
//  GitLog
//
//  Created by Hector Rene Trevino Jr. on 11/29/20.
//

#import <Foundation/Foundation.h>


@interface GitHttpService

@end

@implementation GitHttpService

- (NSString *) getDataFrom: (NSString *)url {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }

    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

@end
