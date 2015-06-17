//
//  SHRPostStore.m
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import "SHRPostStore.h"
#import "SHRSong.h"

@interface SHRPostStore()

@property (nonatomic) NSMutableArray *privateItems;


@end

@implementation SHRPostStore

+ (instancetype)sharedStore{
   
   static SHRPostStore *shrStore;

   if (!shrStore) {
      
      shrStore = [[self alloc] initPrivate];
   
   }
   return shrStore;
   
}

//Let you access all posts

- (NSArray *) allPosts {
   
   return [self.privateItems copy];
}

//initialize the secret Array

- (instancetype) initPrivate {
   
   self = [super init];
   
   if (self) {
      
      _privateItems = [[NSMutableArray alloc] init];
   }
   
   return self;
   
}


- (SHRSong *) createPost {
   
   SHRSong *post = [[SHRSong alloc] initWithPost:self.newestPost forUser:@"User"];
   
   [self.privateItems addObject:post];
   
   return post;

}

- (void) removeItem:(SHRSong *) item {
   
   [self.privateItems removeObject:item];
   
}

//Move/ reoder Items in the array

- (void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
   
   if(fromIndex == toIndex) {
      return;
   }
   
   //Get pointer to the object being moved so you can reinsert it
   SHRSong *post = self.privateItems[fromIndex];
   
   //Remove item from array
   [self.privateItems removeObjectAtIndex:fromIndex];
   
   //Insert item in array at new location
   [self.privateItems insertObject:post atIndex:toIndex];
}





@end
