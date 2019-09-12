//  
//  LoginViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/12.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextf;
@property (weak, nonatomic) IBOutlet UITextField *vadCodeTextF;
@property (nonatomic,strong)NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *vcodebtn;


@end

@implementation LoginViewController
{
    int  num;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    num = 59;
}

- (void)timeAction:(NSTimer *)time{
    num--;
    NSString *title =  nil;
    if(num<1){
        title = @"发送验证码";
        [self.timer invalidate];
    }else{
        title = [NSString stringWithFormat:@"%d秒重新发送",num];
    }
    [self.vcodebtn setTitle:title forState:UIControlStateNormal];
}

- (IBAction)secode:(id)sender {
    if(self.phoneTextf.text.length>0){
         self.timer  = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    }else{
        UIAlertController *ale = [UIAlertController alertControllerWithTitle:@"温馨 提示" message:@"您输入的账号有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [ale addAction:alc];
        [self  presentViewController:ale animated:YES completion:nil];
    }

}


- (IBAction)loginAc:(id)sender {
   
    if([self testAva]){
         [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        
    }
}

- (BOOL)testAva{
    if(![self.phoneTextf.text isEqualToString:@"18763230659"] ||![self.vadCodeTextF.text isEqualToString:@"223456"]){
        UIAlertController *ale = [UIAlertController alertControllerWithTitle:@"温馨 提示" message:@"您输入的账号密码有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [ale addAction:alc];
        [self  presentViewController:ale animated:YES completion:nil];
        return NO;
    }
    
    return YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)dealloc{
    [self.timer invalidate];
}
@end
