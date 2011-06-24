//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"


@interface CBIntentToTweetParams : CBQueryParams {}
@property (retain) NSString* url;
@property (retain) NSString* via;
@property (retain) NSString* text;
@property (retain) NSNumber* in_reply_to;
@property (retain) NSString* hashtags;
@property (retain) NSString* related;
@property (retain) NSString* lang;
@end

@interface CBIntentToRetweetParams : CBQueryParams {}
@property (retain) NSNumber* tweet_id;
@property (retain) NSString* related;
@property (retain) NSString* lang;
@end

@interface CBIntentToFavoriteParams : CBQueryParams {}
@property (retain) NSNumber* tweet_id;
@property (retain) NSString* related;
@property (retain) NSString* lang;
@end

@interface CBIntentToFollowParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSString* lang;
@end


@interface CocoaBird (Intent)

//Intent to Tweet
+ (NSString*) urlOfIntentToTweetText:(NSString*)text;
+ (NSString*) urlOfIntentToTweet:(CBIntentToTweetParams*)params;
+ (void) launchIntentToTweetText:(NSString*)text;
+ (void) launchIntentToTweet:(CBIntentToTweetParams*)params;

//Intent to Retweet
+ (NSString*) urlOfIntentToRetweetTweet:(NSNumber*)tweet_id;
+ (NSString*) urlOfIntentToRetweet:(CBIntentToRetweetParams*)params;
+ (void) launchIntentToRetweetTweet:(NSNumber*)tweet_id;
+ (void) launchIntentToRetweet:(CBIntentToRetweetParams*)params;

//Intent to Favorite
+ (NSString*) urlOfIntentToFavoriteTweet:(NSNumber*)tweet_id;
+ (NSString*) urlOfIntentToFavorite:(CBIntentToFavoriteParams*)params;
+ (void) launchIntentToFavoriteTweet:(NSNumber*)tweet_id;
+ (void) launchIntentToFavorite:(CBIntentToFavoriteParams*)params;

//Intent to Follow
+ (NSString*) urlOfIntentToFollowScreenName:(NSString*)screen_name;
+ (NSString*) urlOfIntentToFollowUserId:(NSNumber*)user_id;
+ (NSString*) urlOfIntentToFollow:(CBIntentToFollowParams*)params;
+ (void) launchIntentToFollowScreenName:(NSString*)screen_name;
+ (void) launchIntentToFollowUserId:(NSNumber*)user_id;
+ (void) launchIntentToFollow:(CBIntentToFollowParams*)params;

@end


