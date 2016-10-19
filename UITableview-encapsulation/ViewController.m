//
//  ViewController.m
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "LXDataSource.h"
#import "TableViewCell.h"
#import "NextViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface ViewController ()<UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)LXDataSource *lxDataSource;
@property(nonatomic,strong)NSMutableArray *modelArray;
@end
static NSString *cellIndentifier = @"cellIndentifier";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = @"UITableview封装";
    [self setupTableview];
    
}
#pragma mark---子视图添加-----
-(void)setupTableview
{
    [self.view addSubview:self.tableview];
    TableViewCellConfigureBlock  configureCell = ^(TableViewCell *cell,LXModel *model){
        [cell configureForModel:model];
    };
    self.lxDataSource = [[LXDataSource alloc]initWithItems:self.modelArray cellIdentifier:cellIndentifier configureCellBlock:configureCell];
    
    //切换为自己的数据源
    self.tableview.dataSource = self.lxDataSource;
}
#pragma mark---UITableviewDelegate代理方法----
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController *next =[[NextViewController alloc]init];
    next.model = [self.lxDataSource itemAtIndexPath:indexPath];
    next.view.backgroundColor = LBRandomColor;
    
    [self.navigationController pushViewController:next animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:cellIndentifier configuration:^(TableViewCell * cell) {
        
        [cell configureForModel:[self.lxDataSource itemAtIndexPath:indexPath]];
    }];
}
#pragma mark---懒加载-------
-(NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray =[NSMutableArray array];
        NSArray *array =@[@"小明",@"小红",@"小张",@"小李",@"小声"];
        NSArray *desA = @[@"我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥",@"我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥我就说你不行，你瞅啥"];
        
        for (int i = 0; i< array.count; i++) {
            LXModel *model =[[LXModel alloc]init];
            model.title = array[i];
            model.body = desA[i];
            [_modelArray addObject:model];
        }

    }
    return _modelArray;
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Device_Width, Device_Height - 64) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.showsHorizontalScrollIndicator = NO;
        [_tableview registerNib:[TableViewCell nib] forCellReuseIdentifier:cellIndentifier];
        _tableview.tableFooterView =[UIView new];
        
    }
    return _tableview;
}

@end
