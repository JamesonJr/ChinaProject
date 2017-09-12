//
//  Subcategories.m
//  ChinaProject
//
//  Created by Eugenie Tyan on 02.06.17.
//  Copyright © 2017 Eugenie Tyan. All rights reserved.
//

#import "Subcategories.h"
#import "CustomSubcategoryCell.h"

@interface Subcategories ()

@end

@implementation Subcategories {
    NSMutableArray *cell1;
    NSMutableArray *cell2;
    NSMutableArray *cell3;
    NSMutableArray *cell4;
    NSMutableArray *cell0;
    NSDictionary *dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Когда будет готова база заменим это на нормальные массивы
    cell0 = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [cell0 count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([cell0 count]%3)+1], @"image",
                      nil];
        [cell0 addObject:dictionary];
    }
    
    cell1 = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [cell1 count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([cell1 count]%3)+1], @"image",
                      nil];
        [cell1 addObject:dictionary];
    }
    
    cell2 = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [cell2 count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([cell2 count]%3)+1], @"image",
                      nil];
        [cell2 addObject:dictionary];
    }
    
    cell3 = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [cell3 count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([cell3 count]%3)+1], @"image",
                      nil];
        [cell3 addObject:dictionary];
    }
    
    cell4 = [[NSMutableArray alloc] init];
    for (int i = 1; i <=5; i++)
    {
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSString stringWithFormat: @"Cell #%ld", [cell4 count]], @"title",
                      [NSString stringWithFormat:@"%ld.png", ([cell4 count]%3)+1], @"image",
                      nil];
        [cell4 addObject:dictionary];
    }
    
    [self.tableView registerNib: [UINib nibWithNibName: NSStringFromClass([CustomSubcategoryCell class]) bundle:nil] forCellReuseIdentifier: NSStringFromClass([CustomSubcategoryCell class])];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_subcategoriesName isEqualToString: @"Cell #0"])
    {
        return [cell0 count];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #1"])
    {
        return [cell1 count];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #2"])
    {
        return [cell2 count];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #3"])
    {
        return [cell3 count];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #4"])
    {
        return [cell4 count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"subcategoryCell";
    //Кастомная ячейка для сабкатегорий
    CustomSubcategoryCell *cell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([CustomSubcategoryCell class]) forIndexPath:indexPath];
    
    
    if ([_subcategoriesName isEqualToString: @"Cell #0"])
    {
        NSDictionary *tmp = [cell0 objectAtIndex:indexPath.row];
        cell.subcategoryCellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        
        //cell.subcategoryCellImage.image = [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #1"])
    {
        NSDictionary *tmp = [cell1 objectAtIndex:indexPath.row];
        cell.subcategoryCellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #2"])
    {
        NSDictionary *tmp = [cell2 objectAtIndex:indexPath.row];
        cell.subcategoryCellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #3"])
    {
        NSDictionary *tmp = [cell3 objectAtIndex:indexPath.row];
        cell.subcategoryCellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    }
    if ([_subcategoriesName isEqualToString: @"Cell #4"])
    {
        NSDictionary *tmp = [cell4 objectAtIndex:indexPath.row];
        cell.subcategoryCellTitle.text = [NSString stringWithFormat: @"%@", [tmp objectForKey: @"title"]];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed: [NSString stringWithFormat: @"%@", [tmp objectForKey: @"image"]]] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.0f;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
