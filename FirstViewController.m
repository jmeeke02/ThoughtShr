//
//  FirstViewController.m
//  SongShare
//
//  Created by Jordan Meeker on 5/19/15.
//  Copyright (c) 2015 Jordan Meeker. All rights reserved.
//

#import "FirstViewController.h"
#import "SHRPostStore.h"
#import "SHRSong.h"
#import "SecondViewController.h"

@interface FirstViewController ()


@end

@implementation FirstViewController

- (instancetype)init
{
   // Call the superclass's designated initializer
   self = [super initWithStyle:UITableViewStylePlain];
   
      if (self) {
      
      UINavigationItem *navItem = self.navigationItem;
      navItem.title = @"PostR";
      
      //Create a new bar button itme that will send addNewItem: to BNRItemsViewController
      UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewPost:)];
      
      //Set this bar button item as the right item in navigationITem
      navItem.rightBarButtonItem = bbi;
      
      navItem.leftBarButtonItem = self.editButtonItem;
      
   }
   
   
   return self;
}

   
   
#pragma mark - table view


//These are the cell types
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
   // Get a new or recycled cell
   
   //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
   
   UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellIdentifier"];
   
   // Set the text on the cell with the description of the item
   // that is at the nth index of items, where n = row this cell
   // will appear in on the tableview
   NSArray *posts = [[SHRPostStore sharedStore] allPosts];
   SHRSong *postUser = posts[indexPath.row];
   
   UIImage *image = [UIImage imageNamed:@"User"];
   
   cell.textLabel.text = postUser.post;
   cell.detailTextLabel.text = postUser.userName;
   cell.imageView.image = image;
   
   return cell;
}

//Need to know the number of rows in the table //allPosts NOT ALL ITEMS!!!!
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
   return [[[SHRPostStore sharedStore] allPosts] count];
   
}

//Load the table
- (void)viewDidLoad {
   [super viewDidLoad];
   
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
   
   //Load the Nib Button to create a profile
   
   //NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"UserProfile" owner:self options:nil];
   //UIView *mainView = [subviewArray objectAtIndex:0];
   //[self.view addSubview:mainView];
}

- (void)viewWillAppear:(BOOL)animated {
   
   [super viewWillAppear:animated];
   
   [self.tableView reloadData];
   
}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (IBAction)createNewPost:(id)sender {
   
   //Push new view controller on screen
   
   SecondViewController *addViewController = [[SecondViewController alloc] init];
   
   //Push the detail view controller onto the top of the navigation controllers stack
   [self.navigationController pushViewController:addViewController animated:YES];
   
  
   
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
   return [self init];
   
}


//When asked to move a row, table will automatically send this message

- (void) tableView:(UITableView *) tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
   
   [[SHRPostStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}



@end
