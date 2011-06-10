//
//  CocoaBird.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird.h"
#import "CocoaBirdSettings.h"
#import "CocoaBirdAuthenticator.h"

#import "ASIHTTPRequest+OAuth.h"
#import "JSON.h"
#import "CBStatus.h"
#import "ASIFormDataRequest.h"
#import "CBRequestData.h"

@implementation CocoaBird

@synthesize delegate;


#pragma Constructors

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id) initWithDelegate:(NSObject*)_delegate
{
    [self init];
    if (self) {
        self.delegate = _delegate;
    }
    return self;
}


#pragma Authentication

+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret
{
    [CocoaBirdSettings setConsumerKey:_key andSecret:_secret];
}

+ (BOOL) isLoggedIn
{
    return [CocoaBirdSettings hasAuthenticationTokens];
}

+ (void) addLoginDelegate:(NSObject*)_delegate selector:(SEL)_selector
{
    [CocoaBirdAuthenticator addLoginDelegate:_delegate selector:_selector];
}

+ (void) removeLoginDelegate:(NSObject*)_delegate
{
    [CocoaBirdAuthenticator removeLoginDelegate:_delegate];
}

+ (void) removeAllLoginDelegates
{
    [CocoaBirdAuthenticator removeAllLoginDelegates];
}

+ (void) launchLogin:(BOOL)animated
{
    [CocoaBirdAuthenticator launchLogin:animated];
}

+ (void) logout
{
    [CocoaBirdSettings logout];
}


#pragma Request API Helpers

static NSMutableArray* _currentRequests = NULL;
+ (NSMutableArray*) currentRequests
{
    @synchronized(self)
    {
        if(_currentRequests == NULL)
            _currentRequests = [[NSMutableArray alloc] init];
    }
    return _currentRequests;
}

static SBJSON* _serializer = NULL;
+ (SBJSON*) serializer
{
    @synchronized(self)
    {
        if(_serializer == NULL)
            _serializer = [[SBJSON alloc] init];
    }
    return _serializer;
}

+ (CBRequestData*) getRequestDataAndRemove:(ASIHTTPRequest*)request
{
    NSMutableArray* currentRequests = [self currentRequests];
    for(int i=0; i<[currentRequests count]; i++)
    {
        CBRequestData* requestData = [currentRequests objectAtIndex:i];
        if(requestData.request == request)
        {
            [[requestData retain] autorelease];
            [currentRequests removeObjectAtIndex:i];
            return requestData;
        }
    }
    return nil;
}

+ (CBRequestData*) getRequestDataAndRemoveById:(NSString*)requestId
{
    NSMutableArray* currentRequests = [self currentRequests];
    for(int i=0; i<[currentRequests count]; i++)
    {
        CBRequestData* requestData = [currentRequests objectAtIndex:i];
        if([requestData.id isEqualToString:requestId])
        {
            [[requestData retain] autorelease];
            [currentRequests removeObjectAtIndex:i];
            return requestData;
        }
    }
    return nil;
}


+ (ASIFormDataRequest*) buildRequest:(NSString*)url params:(CBPublicTimelineParams*)params
{
    ASIFormDataRequest* request = [ASIFormDataRequest 
                                   requestWithURL:[NSURL URLWithString:url]
                                   consumerKey:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerKey]
                                   consumerSecret:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerSecret]
                                   token:[CocoaBirdSettings oAuthToken]
                                   tokenSecret: [CocoaBirdSettings oAuthTokenSecret]];
    
    [params applyToRequest:request];
    
    return request;
}

+ (id) processResponse:(NSString*)response type:(CBTwitterResponseType)type error:(NSError**)error
{    
    id responseObj = [[self serializer] objectWithString:response error:error];
    
    if(!responseObj)
        return nil;
    
    if(type == CBTwitterResponseTypeStatuses){
        //NSString* json = @"[{\"in_reply_to_user_id_str\":null,\"contributors\":null,\"user\":{\"profile_background_image_url\":\"http://a1.twimg.com/images/themes/theme18/bg.gif\",\"friends_count\":268,\"protected\":false,\"is_translator\":false,\"statuses_count\":5422,\"name\":\"Saulo Mattiello\",\"id_str\":\"39839989\",\"follow_request_sent\":null,\"verified\":false,\"notifications\":null,\"profile_text_color\":\"333333\",\"profile_image_url\":\"http://a3.twimg.com/profile_images/1326330630/3215abb3-e57a-43a6-96f8-2d2e4b4393e5_normal.png\",\"utc_offset\":-10800,\"profile_sidebar_fill_color\":\"F6F6F6\",\"location\":\"ChapecSC\",\"profile_background_tile\":false,\"favourites_count\":0,\"description\":\"Algu me explica...?!?!?!\",\"screen_name\":\"saulomattiello\",\"lang\":\"en\",\"url\":null,\"listed_count\":3,\"profile_link_color\":\"038543\",\"created_at\":\"Wed May 13 21:26:46 +0000 2009\",\"profile_sidebar_border_color\":\"EEEEEE\",\"id\":39839989,\"time_zone\":\"Brasilia\",\"default_profile\":false,\"show_all_inline_media\":false,\"contributors_enabled\":false,\"geo_enabled\":true,\"profile_use_background_image\":true,\"followers_count\":219,\"default_profile_image\":false,\"following\":null,\"profile_background_color\":\"ACDED6\"},\"retweeted\":false,\"id_str\":\"77430294134784000\",\"in_reply_to_status_id\":null,\"text\":\"RT  \u201c@garotasemfio: celular contra quem usa vaga de deficiente? http://bit.ly/lA5uO2 Fa\u00e7am o mesmo e ap\u00f3iem @estavaganaoesua\u201d\",\"place\":null,\"in_reply_to_user_id\":null,\"retweet_count\":0,\"id\":77430294134784000,\"created_at\":\"Sun Jun 05 17:43:15 +0000 2011\",\"favorited\":false,\"source\":\"a href=\\\"http://www.tweetdeck.com\\\" rel=\\\"nofollow\\\"TweetDeck/a\",\"in_reply_to_status_id_str\":null,\"coordinates\":null,\"geo\":null,\"in_reply_to_screen_name\":null,\"truncated\":false}]";
        NSArray* statusDics = responseObj;
        NSMutableArray* statuses = [NSMutableArray array];
        for(NSDictionary* statusDic in statusDics){
            CBStatus* status = [[[CBStatus alloc] initWithDictionary:statusDic] autorelease];
            [statuses addObject:status];
        }
        return statuses;
    }
    
    return nil;
}

+ (id) processRequestSynchronous:(ASIFormDataRequest*)request type:(CBTwitterResponseType)type error:(NSError**)error
{
    [request startSynchronous];
    if ([request error]) {
        *error = [request error];
        return nil;
    }
    return [self processResponse:[request responseString] type:type error:error];
}

+ (NSString *) getGuid
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

+ (NSString*) processRequestAsynchronous:(ASIFormDataRequest*)request type:(CBTwitterResponseType)type delegate:(id)delegate selector:(SEL)selector
{
    NSString* id = [CocoaBird getGuid];
    CBRequestData* data = [[[CBRequestData alloc] initWithId:id request:request type:type delegate:delegate selector:selector] autorelease];
    [[self currentRequests] addObject:data];
    
    [request startAsynchronous];
    [request setDelegate:self];
    
    return id;
}

+ (void) requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished:");
    CBRequestData* data = [self getRequestDataAndRemove:request];    
    NSError* error = nil;
    id result = [self processResponse:[request responseString] type:data.type error:&error];
    [data.delegate performSelector:data.selector withObject:result withObject:error];
}

+ (void) requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed:");
    CBRequestData* data = [self getRequestDataAndRemove:request];
    NSError* error = [request error];
    [data.delegate performSelector:data.selector withObject:nil withObject:error];
}


#pragma Public Timeline

+ (NSArray*) getPublicTimeline
{
    return [self getPublicTimeline:nil];
}

+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params
{
    return [self getPublicTimeline:params error:nil];
}

+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params error:(NSError**)error
{
    ASIFormDataRequest* request = [self buildRequest:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params];
    return [self processRequestSynchronous:request type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
{
    return [self loadPublicTimeline:delegate selector:selector params:nil];
}

+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params
{
    ASIFormDataRequest* request = [self buildRequest:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params];
    return [self processRequestAsynchronous:request type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Cancelling Requests

+ (void) cancelRequest:(NSString*)requestId
{
    CBRequestData* data = [self getRequestDataAndRemoveById:requestId];
    [data.request clearDelegatesAndCancel];
}

+ (void) cancelAllRequests
{
    while([[self currentRequests] count] > 0)
    {
        CBRequestData* data = [[self currentRequests] objectAtIndex:0];
        [self cancelRequest:data.id];
    }
}


#pragma Cleanup

- (void)dealloc {
    
    self.delegate = nil;
    
    [super dealloc];
}

@end
