//
//  TSNews.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSObserver.h"

@interface TSNews : NSObject
@property(strong,nonatomic) NSMutableArray* arrArticles;
@property(strong,nonatomic) NSMutableArray* arrObservers;

+ (TSNews*)sharedInstance;
- (TSNews*)init;

- (void) refreshNew:(NSString*)category;
- (void) refreshOld:(NSString*)category;
- (void) notifyObeservers;
-(void) addTSObserver:(id<TSObserver>*)observer;
-(void) removeTSObserver:(id<TSObserver>*)observer;




@end
