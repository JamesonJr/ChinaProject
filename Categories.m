//
//  Categories.m
//  ChinaProject
//
//  Created by Eugenie Tyan on 02.06.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import "Categories.h"
#import "CustomCategoryCell.h"
#import "Subcategories.h"

@interface Categories ()

@end

@implementation Categories {
    NSMutableArray *categories;
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Categories";
    categories = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [categories count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([categories count]%3)+1], @"image",
                      nil];
        [categories addObject:dictionary];
    }
    //Register CustomCell
    
    [self.tableView registerNib: [UINib nibWithNibName: NSStringFromClass([CustomCategoryCell class]) bundle:nil] forCellReuseIdentifier: NSStringFromClass([CustomCategoryCell class])];
    
    //[self.tableView registerNib: [UINib nibWithNibName: NSStringFromClass([CustomCategoryCell class]) bundle:nil] forCellReuseIdentifier: @"categoriesIdentifier"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    //Пока для примера 1 дальше поменяю, я пока не разобрался что это
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return [categories count];
}

- (NSString *)classString
{
    return NSStringFromClass([CustomCategoryCell class]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //static NSString *simpleTableIdentifier = @"categoriesIdentifier";
    
    //Тут подставляем нашу кастомную ячейку
    //CustomCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
    //CustomCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier forIndexPath:indexPath];
    
    CustomCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([CustomCategoryCell class]) forIndexPath:indexPath];
    //NSLog(@"%@", [self classString]);
    NSDictionary *tmp = [categories objectAtIndex:indexPath.row];
    
    cell.cellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
    cell.cellImage.image = [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]];
    //NSStringFromClass return Class string name
    
    // Configure the cell...
    NSInteger buffer = indexPath.row%3;
    cell.cellTitle.text = [NSString stringWithFormat:@"Cell #%ld", indexPath.row];
    cell.cellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", buffer+1]];
    return cell;
}

//Меняем высоту ячейки

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 150.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString: @"showArrayDetail"])
    {
        //NSLog(@"Условие перехода выполнилось");
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *tmp = [categories objectAtIndex:indexPath.row];
        Subcategories *destViewController = segue.destinationViewController;
        destViewController.subcategoriesName = [NSString stringWithFormat:
                                                @"%@", [tmp objectForKey: @"title"]];
        destViewController.title = destViewController.subcategoriesName;
    }
}


@end
