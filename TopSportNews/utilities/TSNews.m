//
//  TSNews.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "TSNews.h"

@implementation TSNews

+ (TSNews *)sharedInstance {
    static TSNews *sharedInstance;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[TSNews alloc] init];
        }
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.arrArticles=[[NSMutableArray alloc]init];
        self.arrObservers=[[NSMutableArray alloc]init];
    }
    
    return self;
    
}

- (void) refreshNew:(NSString*)category
{
    
}
- (void) refreshOld:(NSString*)category
{
    
}
- (void) notifyObeservers
{
    
}

@end
