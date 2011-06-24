//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Intent.h"
#import "CocoaBird+Core.h"
#import "CocoaBirdReflection.h"
#import "CocoaBirdSettings.h"
#import "CocoaBirdModal.h"
#import "CBWebModalController.h"


@implementation CBIntentToTweetParams
@synthesize url, via, text, in_reply_to, hashtags, related, lang;
@end

@implementation CBIntentToRetweetParams
@synthesize tweet_id, related, lang;
@end

@implementation CBIntentToFavoriteParams
@synthesize tweet_id, related, lang;
@end

@implementation CBIntentToFollowParams
@synthesize screen_name, user_id, lang;
@end


@implementation CocoaBird (Intent)



+ (NSString*) buildUrl:(NSString*)url params:(CBQueryParams*)params
{
    if([url hasPrefix:@"http"] == NO)
        url = [NSString stringWithFormat:@"%@%@", ([CocoaBirdSettings useSSL] ? @"https://" : @"http://"), url];
    
    return [self appendQueryString:[CocoaBirdReflection convertObjectToCoreType:params] toUrl:url];    
}

+ (void) launchUrl:(NSString*)url
{
    CBWebModalController* controller = [[[CBWebModalController alloc] initWithUrl:url] autorelease];
    [CocoaBirdModal present:controller];
}



#pragma Intent to Tweet

+ (NSString*) urlOfIntentToTweetText:(NSString*)text
{
    CBIntentToTweetParams* params = [CBIntentToTweetParams params];
    params.text = text;
    return [self urlOfIntentToTweet:params];
}

+ (NSString*) urlOfIntentToTweet:(CBIntentToTweetParams*)params
{
    return [self buildUrl:@"twitter.com/intent/tweet" params:params];
}

+ (void) launchIntentToTweetText:(NSString*)text
{
    [self launchUrl:[self urlOfIntentToTweetText:text]];
}

+ (void) launchIntentToTweet:(CBIntentToTweetParams*)params
{
    [self launchUrl:[self urlOfIntentToTweet:params]];
}


#pragma Intent to Retweet

+ (NSString*) urlOfIntentToRetweetTweet:(NSNumber*)tweet_id
{
    CBIntentToRetweetParams* params = [CBIntentToRetweetParams params];
    params.tweet_id = tweet_id;
    return [self urlOfIntentToRetweet:params];
}

+ (NSString*) urlOfIntentToRetweet:(CBIntentToRetweetParams*)params
{
    return [self buildUrl:@"twitter.com/intent/retweet" params:params];
}

+ (void) launchIntentToRetweetTweet:(NSNumber*)tweet_id
{
    [self launchUrl:[self urlOfIntentToRetweetTweet:tweet_id]];
}

+ (void) launchIntentToRetweet:(CBIntentToRetweetParams*)params
{
    [self launchUrl:[self urlOfIntentToRetweet:params]];
}


#pragma Intent to Favorite

+ (NSString*) urlOfIntentToFavoriteTweet:(NSNumber*)tweet_id
{
    CBIntentToFavoriteParams* params = [CBIntentToFavoriteParams params];
    params.tweet_id = tweet_id;
    return [self urlOfIntentToFavorite:params];
}

+ (NSString*) urlOfIntentToFavorite:(CBIntentToFavoriteParams*)params
{
    return [self buildUrl:@"twitter.com/intent/favorite" params:params];   
}

+ (void) launchIntentToFavoriteTweet:(NSNumber*)tweet_id
{
    [self launchUrl:[self urlOfIntentToFavoriteTweet:tweet_id]];
}

+ (void) launchIntentToFavorite:(CBIntentToFavoriteParams*)params
{
    [self launchUrl:[self urlOfIntentToFavorite:params]];
}


#pragma Intent to Follow

+ (NSString*) urlOfIntentToFollowScreenName:(NSString*)screen_name
{
    CBIntentToFollowParams* params = [CBIntentToFollowParams params];
    params.screen_name = screen_name;
    return [self urlOfIntentToFollow:params];
}

+ (NSString*) urlOfIntentToFollowUserId:(NSNumber*)user_id
{
    CBIntentToFollowParams* params = [CBIntentToFollowParams params];
    params.user_id = user_id;
    return [self urlOfIntentToFollow:params];
}

+ (NSString*) urlOfIntentToFollow:(CBIntentToFollowParams*)params
{
    return [self buildUrl:@"twitter.com/intent/user" params:params];  
}

+ (void) launchIntentToFollowScreenName:(NSString*)screen_name
{
    [self launchUrl:[self urlOfIntentToFollowScreenName:screen_name]];
}

+ (void) launchIntentToFollowUserId:(NSNumber*)user_id
{
    [self launchUrl:[self urlOfIntentToFollowUserId:user_id]];
}

+ (void) launchIntentToFollow:(CBIntentToFollowParams*)params
{
    [self launchUrl:[self urlOfIntentToFollow:params]];
}


@end
