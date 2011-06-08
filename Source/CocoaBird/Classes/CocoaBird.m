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


#pragma API

+ (NSArray*) getPublicTimeline
{
    return [self getPublicTimeline:nil];
}

+ (NSArray*) getPublicTimeline:(NSError**)error
{
    /*
    ASIHTTPRequest* request = [ASIHTTPRequest 
        requestWithURL:[NSURL URLWithString:@"http://api.twitter.com/1/statuses/public_timeline.json"]
        consumerKey:[CocoaBirdSettings oAuthConsumerKey]
        consumerSecret:[CocoaBirdSettings oAuthConsumerSecret]
        token:[CocoaBirdSettings oAuthToken]
        tokenSecret:[CocoaBirdSettings oAuthTokenSecret]];
    [request startSynchronous];
    if ([request error]) {
        *error = [request error];
        return nil;
    }
    NSString* json = [request responseString];
    */
    
    NSString* json = @"[{\"in_reply_to_user_id_str\":null,\"contributors\":null,\"user\":{\"profile_background_image_url\":\"http://a1.twimg.com/images/themes/theme18/bg.gif\",\"friends_count\":268,\"protected\":false,\"is_translator\":false,\"statuses_count\":5422,\"name\":\"Saulo Mattiello\",\"id_str\":\"39839989\",\"follow_request_sent\":null,\"verified\":false,\"notifications\":null,\"profile_text_color\":\"333333\",\"profile_image_url\":\"http://a3.twimg.com/profile_images/1326330630/3215abb3-e57a-43a6-96f8-2d2e4b4393e5_normal.png\",\"utc_offset\":-10800,\"profile_sidebar_fill_color\":\"F6F6F6\",\"location\":\"ChapecSC\",\"profile_background_tile\":false,\"favourites_count\":0,\"description\":\"Algu me explica...?!?!?!\",\"screen_name\":\"saulomattiello\",\"lang\":\"en\",\"url\":null,\"listed_count\":3,\"profile_link_color\":\"038543\",\"created_at\":\"Wed May 13 21:26:46 +0000 2009\",\"profile_sidebar_border_color\":\"EEEEEE\",\"id\":39839989,\"time_zone\":\"Brasilia\",\"default_profile\":false,\"show_all_inline_media\":false,\"contributors_enabled\":false,\"geo_enabled\":true,\"profile_use_background_image\":true,\"followers_count\":219,\"default_profile_image\":false,\"following\":null,\"profile_background_color\":\"ACDED6\"},\"retweeted\":false,\"id_str\":\"77430294134784000\",\"in_reply_to_status_id\":null,\"text\":\"RT  \u201c@garotasemfio: celular contra quem usa vaga de deficiente? http://bit.ly/lA5uO2 Fa\u00e7am o mesmo e ap\u00f3iem @estavaganaoesua\u201d\",\"place\":null,\"in_reply_to_user_id\":null,\"retweet_count\":0,\"id\":77430294134784000,\"created_at\":\"Sun Jun 05 17:43:15 +0000 2011\",\"favorited\":false,\"source\":\"a href=\\\"http://www.tweetdeck.com\\\" rel=\\\"nofollow\\\"TweetDeck/a\",\"in_reply_to_status_id_str\":null,\"coordinates\":null,\"geo\":null,\"in_reply_to_screen_name\":null,\"truncated\":false}]";
    
    NSArray* statusDics = [json JSONValue];
    NSMutableArray* statuses = [NSMutableArray array];
    for(NSDictionary* statusDic in statusDics){
        CBStatus* status = [[[CBStatus alloc] initWithDictionary:statusDic] autorelease];
        [statuses addObject:status];
    }
    return statuses;
}


#pragma Cleanup

- (void)dealloc {
    
    self.delegate = nil;
    
    [super dealloc];
}

@end
