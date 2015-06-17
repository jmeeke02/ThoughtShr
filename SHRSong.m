//
//  SHRSong.m
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import "SHRSong.h"

@interface SHRSong()




@end

@implementation SHRSong


//Creating a new post (needs to be a class method) not an instance method

+ (instancetype) createAPost {
   
   
   SHRSong *aPost = [[self alloc] initWithPost:@"post" forUser:@"Me"];
   
   return aPost;
   
}


- (instancetype) initWithPost:(NSString*)post forUser:(NSString*)user{
   
   self = [super init];
   
   if(self) {
      
      _post = post;
      _userName =user;
      
   }
   return self;
   
}

- (instancetype) init {
   
   return [self initWithPost:@"default" forUser:@"default"];
}


@end
