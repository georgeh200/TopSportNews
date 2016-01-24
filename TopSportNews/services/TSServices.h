//
//  TSServices.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSServices : NSObject

@property(nonatomic,copy) NSString* host;
@property(nonatomic,copy) NSString* version;
@property(nonatomic,copy) NSString* days;
@property(nonatomic,copy) NSString* section;
@property(nonatomic,copy) NSString* APIKey;
@property(nonatomic,strong) NSDictionary* urlDictionary;

-(void)executeAPI:(NSString*)urlString withPath:(NSString*)path withParameters: (NSMutableDictionary*) parameters withMethod:(NSString*)method withSuccess:(void (^)(id json))success
      withFailure:(void (^)(NSInteger statusCode))failure;


-(void) loadArticles:(NSString*)category withOffset:(NSInteger)offset withSuccess:(void (^)(id json))success
         withFailure:(void (^)(NSInteger statusCode))failure;

@end
