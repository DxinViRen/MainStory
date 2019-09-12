//
//  MainTabVC.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/7.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MainTabVC.h"
#import "HomeViewController.h"
#import "ConnectUsVC.h"
#import "CollectionVC.h"

@interface MainTabVC ()

@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        
        [self setChildControllers];
        self.tabBar.backgroundColor = [UIColor whiteColor];
        self.tabBar.translucent  =NO ;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
        imageView.image  = [UIImage imageNamed:@"bgImg"];
        [self.tabBar insertSubview:imageView atIndex:0];
        self.tabBar.tintColor = [UIColor darkTextColor];
      
        
    }
    return self;
}


- (void)setChildControllers
{
    HomeViewController * mine  = [[HomeViewController alloc]init];
    //    mine.view.backgroundColor = [UIColor orangeColor];
    [self addChildViewController:mine title:@"典故书架" selectImage:@"shujia3232" image:@"shujia32hui"];
    CollectionVC * more  = [[CollectionVC alloc]init];
    //      more.view.backgroundColor = [UIColor cyanColor];
    [self addChildViewController:more title:@"我的收藏" selectImage:@"sc" image:@"schui"];
    ConnectUsVC * user  = [[ConnectUsVC alloc]init];
    //      user.view.backgroundColor = [UIColor darkGrayColor];
    [self addChildViewController:user title:@"读者中心" selectImage:@"duzhe3232" image:@"duzhe32hui"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title selectImage:(NSString *)selectImage image:(NSString *)image
{
    //childController.view.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1];//设置页面的颜色为随机色
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    childController.tabBarItem.selectedImage = selImage;
    
    //改变字体颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#8a8a8a"],NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    //选中状态颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#2c2c2c"],NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
     UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:childController];
    
    
    [self addChildViewController:navigation];
    
    //  添加一个自定义选项卡按钮
    //[self.customTabBar addTabBarButton:childVc.tabBarItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
