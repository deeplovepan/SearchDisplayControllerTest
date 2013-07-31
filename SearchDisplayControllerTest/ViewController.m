//
//  ViewController.m
//  SearchDisplayControllerTest
//
//  Created by Pan Peter on 13/7/31.
//  Copyright (c) 2013年 Pan Peter. All rights reserved.
//

#import "ViewController.h"

static NSString *CellIdentifier = @"SongCell";


@interface ViewController () <UITableViewDataSource>
{
    NSMutableArray *songArray;
    UISearchDisplayController *searchController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.wantsFullScreenLayout = YES;
    
    songArray = [[NSMutableArray alloc] init];
    [songArray addObject:@"全心全意"];
    [songArray addObject:@"關心"];
    [songArray addObject:@"愈懂你愈疼你"];
    [songArray addObject:@"習慣"];
    [songArray addObject:@"提醒"];
    [songArray addObject:@"留下來好嗎"];
    [songArray addObject:@"跟你要好一輩子"];
    [songArray addObject:@"臨別贈言"];
    [songArray addObject:@"情願一個人"];
    [songArray addObject:@"後悔"];
    [songArray addObject:@"我對你最好"];
    [songArray addObject:@"如果沒有你"];
    [songArray addObject:@"愛你心不變"];
    [songArray addObject:@"讓我照顧你"];

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    searchController.searchResultsDataSource = self;
    searchController.searchResultsDelegate = self;
    searchController.delegate = self;
    tableView.tableHeaderView = searchBar;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return songArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = songArray[indexPath.row];
    
    return cell;
    
}


@end
