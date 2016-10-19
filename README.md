# UITableview-encapsulation
参照简书上大神的文章:http://www.jianshu.com/p/bf4ad5ecde18 以及更轻量的 View Controllers：https://objccn.io/issue-1-1/
实现下面几行代码即可实现对DataSoure的封装，因为UITableviewDelegate的代理方法的频繁调用，所以还是系统原生的，封装起来也不太好复用
 TableViewCellConfigureBlock  configureCell = ^(TableViewCell *cell,LXModel *model){
        [cell configureForModel:model];
    };
    self.lxDataSource = [[LXDataSource alloc]initWithItems:self.modelArray cellIdentifier:cellIndentifier configureCellBlock:configureCell];
    
    //切换为自己的数据源
    self.tableview.dataSource = self.lxDataSource;
