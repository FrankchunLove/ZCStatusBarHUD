# ZCStatusBarHUD
一个非常简单易用的状态栏指示器小框架

## 显示成功信息
```objc
	[ZCStatusBarHUD showSuccess:@"加载成功"];
```

## 显示失败信息
```objc
        [ZCStatusBarHUD showError:@"加载失败"];
```

## 显示普通信息
```objc
    	[ZCStatusBarHUD showMessage:@"没有事情做的哦" image:nil];
```

## 显示加载信息
```objc
        [ZCStatusBarHUD showLoading:@"加载中..."];
```

## 隐藏
```objc
	 [ZCStatusBarHUD hide];
```
