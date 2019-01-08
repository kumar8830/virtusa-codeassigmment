//
//  ViewController.m
//  virtusa_app
//
//  Created by Bharath Kumar Reddy  Vasipalli Venkata on 07/01/19.
//  Copyright © 2019 IMI. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
@interface ViewController ()
{
    NSMutableArray *tableArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *footerCells  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    tabObj.tableFooterView = footerCells;
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://swapi.co/api/planets/"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            self->tableArray = [json objectForKey:@"results"];
            if (self->tableArray.count>=1) {
                dispatch_async(dispatch_get_main_queue(), ^{
                   // self->tabObj.tableFooterView = UIView()
                    [self->tabObj reloadData];
                });
            }
            NSLog(@"The response is - %@",self->tableArray);
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Tableview methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableArray.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomTableViewCell";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.nameLbl.text=[[tableArray objectAtIndex:indexPath.row]objectForKey:@"name"];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
