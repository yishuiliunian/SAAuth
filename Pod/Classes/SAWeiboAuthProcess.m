//
//  SAWeiboAuthProcess.m
//  Pods
//
//  Created by stonedong on 15/7/11.
//
//

#import "SAWeiboAuthProcess.h"
#import <WeiboSDK.h>
@interface SAWeiboAuthProcess() <WeiboSDKDelegate>
@end
@implementation SAWeiboAuthProcess
- (BOOL) canRequest:(NSError **)error
{
    return YES;
}
- (BOOL) handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}
- (void) request
{
    WBAuthorizeRequest* request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://www.sina.com";
    [WeiboSDK sendRequest:request];
}

- (void) didReceiveWeiboResponse:(WBBaseResponse *)response
{
    
}
@end
