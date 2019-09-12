//
//  DataManager.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/9.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "DataManager.h"
#import <MJExtension/MJExtension.h>
#import "MainCellModel.h"
#import "AppDelegate.h"
 NSString *dataListKeyCollect = @"DataListKeyCollect";



@implementation DataManager
{
    UINavigationController *currnavi;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
          [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(noti:) name:@"notification" object:nil];
    }
    return self;
}

//增
+ (void)setItem:(id<MainSectionModelProtocol>)item forkey:(NSString *)datalist{
    
    id mitem = item;
    NSMutableArray *dataListArr = [[[NSUserDefaults standardUserDefaults]objectForKey:datalist] mutableCopy];
    if(!dataListArr){
        dataListArr = [@[] mutableCopy];
    }
    NSDictionary *dataDic = [mitem mj_keyValues];
    if(![DataManager  isAvaThisItem:dataDic]){
       
      //  [[NSNotificationCenter defaultCenter]postNotificationName:@"已收藏" object:nil];
        return;
    }
    [dataListArr addObject:dataDic];
    [[NSUserDefaults standardUserDefaults]setObject:dataListArr forKey:datalist];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isAvaThisItem:(NSDictionary *)dic{
    NSMutableArray *arr = [DataManager getDataListWithListkey:dataListKeyCollect];
    for (NSDictionary *mdic in arr) {
        if([dic[@"title"] isEqualToString:mdic[@"title"]]){
            return NO;
        }
    }
    return YES;
}

-  (void)noti:(NSNotification *)noti{
    NSDictionary *dic =  noti.userInfo;
    UINavigationController *nvi =  dic[@"noti"];
    currnavi  = nvi;
}
//删除
+ (void)deleteItem:(id<MainSectionModelProtocol>)item forkey:(NSString *)datalist{
     id mitem = item;
    NSMutableArray *dataListArr = [[[NSUserDefaults standardUserDefaults]objectForKey:datalist] mutableCopy];
    if(!dataListArr)return;
    NSDictionary *dic = [mitem mj_keyValues];
    for (NSDictionary *mdic in dataListArr) {
        if([mdic[@"title"] isEqualToString:dic[@"title"]]){
            [dataListArr removeObject:mdic];
            break;
        }
    }
    //[dataListArr removeObject:mitem];
    [[NSUserDefaults standardUserDefaults]setObject:dataListArr forKey:datalist];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

//取
+ (NSMutableArray *)getDataListWithListkey:(NSString *)listkey{
    NSMutableArray *dataListArr = [[[NSUserDefaults standardUserDefaults]objectForKey:listkey] mutableCopy];
    if(!dataListArr){
        return [@[] mutableCopy];
    }else{
        return [dataListArr mutableCopy];
    }
}

- (void)showText:(NSString *)text{
    UIAlertController *ale = [UIAlertController alertControllerWithTitle:@"温馨 提示" message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ale addAction:alc];
    [currnavi presentViewController:ale animated:YES completion:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
