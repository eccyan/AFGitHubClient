//
//  AFGitHubAPIResponse.h
//  AFGitHub
//
//  Created by Atsushi Nagase on 1/31/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** API response class */
@interface AFGitHubAPIResponse : NSObject

/**  */
@property (nonatomic) BOOL success;
/**  */
@property (nonatomic, strong) Class itemClass;
/**  */
@property (nonatomic, strong) NSURL *nextURL;
/**  */
@property (nonatomic, strong) NSURL *prevURL;
/**  */
@property (nonatomic, strong) NSURL *firstURL;
/**  */
@property (nonatomic, strong) NSURL *lastURL;
/**  */
@property (nonatomic, strong) NSHTTPURLResponse *httpResponse;
/**  */
@property (nonatomic, strong) NSError *error;


/**  */
- (id)first;
/**  */
- (id)next;
/**  */
- (void)reset;
/**  */
- (NSArray *)all;
/**  */
- (void)processResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *)error;
/**  */
- (NSDictionary *)parseLinkHeader:(NSString *)headerField;


@end
