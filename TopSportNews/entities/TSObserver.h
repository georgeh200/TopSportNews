//
//  TSObserver.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSObserver <NSObject>
-(void)articlesAvailable:(NSString*) category;
@end
