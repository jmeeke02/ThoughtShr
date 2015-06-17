//
//  SecondViewController.m
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import "SecondViewController.h"
#import "SHRSong.h"
#import "SHRPostStore.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *createdPost;

@end

@implementation SecondViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


- (IBAction)createNewPost:(id)sender {

   
   SHRPostStore *postStore =[SHRPostStore sharedStore];
   
   
      
   postStore.newestPost = self.createdPost.text;
   
   [postStore createPost];
   
   self.createdPost.text = nil;
   
   
}



@end
