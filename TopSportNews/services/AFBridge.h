//
//  AFBridge.h
//  Quiz King
//
//  Created by George Kastour on 01/10/15.
//  Copyright © 2015 George. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFBridge : NSObject

+(void)executeRequest:(NSString*)link withMothod:(NSString*)method withParameters:(NSDictionary*)parameters
          withSuccess:(void (^)(id json))success withFailure:(void (^)(NSInteger statusCode))failure;



@end
