//
//  AFGitHubAPIRequestOperation.m
//
//  Copyright (c) 2012 Atsushi Nagase (http://ngs.io/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "AFGitHubAPIRequestOperation.h"
#import "AFGitHubAPIResponse.h"

NSString * const AFGitHubErrorDomain = @"io.ngs.AFGitHubErrorDomain";

@interface AFGitHubAPIRequestOperation ()

@property (nonatomic, strong) NSError *apiError;

@end

@implementation AFGitHubAPIRequestOperation

- (id)responseJSON {
  id json = [super responseJSON];
  if([json isKindOfClass:[NSDictionary class]] &&
     json[@"message"] &&
     [json[@"message"] isKindOfClass:[NSString class]] &&
     [json[@"message"] length] > 0) {
    self.apiError = [NSError errorWithDomain:AFGitHubErrorDomain
                                        code:self.response.statusCode
                                    userInfo:json];
  } else {
    _ghResponse = [[AFGitHubAPIResponse alloc] init];
  }
  return json;
}

@end
