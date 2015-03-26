//
//  SAReqManager.m
//  Pods
//
//  Created by stonedong on 15/3/11.
//
//

#import "SAReqManager.h"
#import "SAReqAuthProcess.h"
#import "SAAuthWeChatProcess.h"
#import "WXApi.h"
#import "SAAuthQQProcess.h"

@interface SAReqManager () <WXApiDelegate, SAReqAuthDelegate>
@property (nonatomic, strong) SAReqAuthProcess* authProcess;
@property (nonatomic, strong) RequestAuthCompletion completionBlock;
@end
@implementation SAReqManager
+ (SAReqManager*) shareManager
{
    static SAReqManager* share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [SAReqManager new];
    });
    return share;
}

- (void) requestAuth:(SAReqAuthProcess*)process
{
    self.authProcess = process;
    self.authProcess.delegate = self;
    [process request];
}
- (BOOL) canHandleURL
{
    if (self.authProcess) {
        return YES;
    }
    return NO;
}
- (BOOL) handleURL:(NSURL*)url {
    if (![self canHandleURL]) {
        return NO;
    }
    return [self.authProcess handleOpenURL:url];
}

- (void) registerTencentApp:(NSString *)appID
{
    _tencentAPPID = appID;
}

- (void) registerWeChatApp:(NSString *)appID scret:(NSString *)scret
{
    _wechatAppId = appID;
    _wecahtScret = scret;
    [WXApi registerApp:_wechatAppId];
}

- (void) sendCompletion:(SAToken*)token error:(NSError*)error
{
    if (_completionBlock) {
        _completionBlock(token, error);
    }
    _completionBlock = nil;
}

- (void) authProcess:(SAReqAuthProcess *)process succeedWithToken:(SAToken *)token
{
    self.authProcess = nil;
    [self sendCompletion:token error:nil];
    
}

- (void) authProcess:(SAReqAuthProcess *)process failtWithError:(NSError *)error
{
    self.authProcess = nil;
    [self sendCompletion:nil error:error];
}
- (void) requestWeiXinAuth:(RequestAuthCompletion)block
{
    [self requestAuth:[SAAuthWeChatProcess new]];
    _completionBlock = block;
}
@end