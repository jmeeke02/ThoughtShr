//
//  SHRSong.h
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHRSong : NSObject



+ (instancetype) createAPost;

@property (nonatomic, weak) NSString *userName;
@property (nonatomic) int numberUpVotes;
@property (nonatomic, strong) NSString *post;



- (instancetype) initWithPost:(NSString*)post forUser:(NSString*)user;

@end
