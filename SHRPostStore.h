//
//  SHRPostStore.h
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHRSong.h"

@interface SHRPostStore: NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;
@property (nonatomic) NSString *newestPost;

//Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype) sharedStore;
- (SHRSong *) createPost;
- (void) removeItem:(SHRSong *) item;
- (NSArray *) allPosts ;


- (void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;


@end
