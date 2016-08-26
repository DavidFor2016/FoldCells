//
//  ViewController.m
//  FoldCells
//
//  Created by Yesi on 16/8/26.
//  Copyright © 2016年 Yesi. All rights reserved.
//

#import "ViewController.h"
#import "TopTableViewCell.h"

#import "DataModel.h"

#define kFullHeight 172.5
#define kFoldHeight 61
#define kTopTableViewCellID @"TopTableViewCell"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** UItableView */
@property (nonatomic, weak) UITableView *tableView;
/** data */
@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupData];
}
-(void)setupData{
    DataModel *model1 =[DataModel new];
    model1.name = @"清迈";
    model1.time = @"2016年12月23日";
    model1.des = @"可以看到和乐佩看到的一样的水灯额。因为每逢水灯节的夜晚，无论是城市或在乡镇，只要是频临河港或湖边的地方，水面上都会飘满水灯，闪亮着一片烛光，辉映着青年男女们双双的幸福靓影，而一片花香和轻快抑扬的“放水灯”歌声中，构成一个欢乐的水灯节之夜。";
    model1.image = @"rapunzel";
    model1.isFold = NO;
    DataModel *model2 =[DataModel new];
    model2.name = @"瑞士";
    model2.time = @"2017年12月23日";
    model2.des = @"欢迎来到Elsa&Anna的国度。瑞士北邻德国，西邻法国，南邻意大利，东邻奥地利和列支敦士登。全境以高原和山地为主，有“欧洲屋脊”之称。瑞士旅游资源丰富，有世界公园的美誉；伯尔尼是联邦政府所在地，瑞士历史上曾有雇佣兵制度，后来才改采武装中立，瑞士中立的历史相当悠久，是一个永久中立国，自1815年后从未卷入过任何局部战争和国际战争（包括一战和二战在内），但同时也参与国际事务，许多国际性组织的总部都设在瑞士。";
    model2.image = @"frozen";
    model2.isFold = NO;
    DataModel *model3 =[DataModel new];
    model3.name = @"名古屋";
    model3.time = @"2018年12月23日";
    model3.des = @"名古屋市（英文：Nagoya，日文：なごやし），是日本爱知县的首府，也是日本三大都市圈（东京大都市圈，京阪神大都市圈，名古屋大都市圈）之一，名古屋大都市圈的中心城市，属于日本二战前规定的国内六大都市之一。全市总面积326.45平方公里，总人口228.4万人（2015年）。作为重要的港口城市，名古屋港也是日本的五大国际贸易港之一。中国在名古屋市设立有中华人民共和国驻名古屋总领事馆。";
    model3.image = @"なごやし";
    model3.isFold = NO;

    self.array = @[model1,model2,model3];
}
-(NSArray *)array{
    if (!_array) {
        _array = [NSArray array];
    }
    return _array;

}
- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopTableViewCell class]) bundle:nil] forCellReuseIdentifier:kTopTableViewCellID];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//  Row number in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

//  Each cell like
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID;
    ID = kTopTableViewCellID;

    TopTableViewCell *cell = (TopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    
    __block DataModel *model = self.array[indexPath.section];
   
    cell.buttonClickBlock = ^(UIImageView *imageView){
        model.isFold = !model.isFold;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [UIView animateWithDuration:2 animations:^{
            if (model.isFold) {
                imageView.transform = CGAffineTransformIdentity;
            }else{
                imageView.transform = CGAffineTransformMakeRotation(M_PI);
            }
        }];
    };

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.array[indexPath.section];
    cell.clipsToBounds = YES;
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   DataModel *model = self.array[indexPath.section];

    if (model.isFold) {
        return 61;
    }
    return 172.5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
