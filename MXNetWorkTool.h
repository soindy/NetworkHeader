////
////  MXNetWorkTool.h
////  Fondle
////
////  Created by soindy on 14-10-13.
////  Copyright (c) 2014年 soindy. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//
///**
// *  错误域名
// */
//extern NSString *const MXServerAPIErrorDomain;
//
///**
// *  错误码
// */
//typedef enum {
//    MXAPICodeSuccess = 0,                       // 成功
//    MXAPICodeUndefinedError = 1 ,               // 未知错误
//    MXAPICodeInvalidDataStruct = 2,             // 数据格式不合法
//    MXNetDissConnectError = 3,                  // 无网络
//}MXAPIErrorCode;
//
///**
// *  一般root网址
// */
//extern NSString *const MXServerAPIRootPath;
//
///**
// *  Token
// */
//extern NSString *const MXServerToken;
//
///**
// *  添加用户与绑定设备信息action
// */
//extern NSString *const MXAPIAddUserWithBindingDeviceAction;
//
///**
// *  更新用户使用信息action
// */
//extern NSString *const MXAPIUpdateUserUsageInfoAction;
//
///**
// *  更新用户设备信息action
// */
//extern NSString *const MXAPIUpdateDeviceInfoAction;
//
///**
// *  保存音乐信息action
// */
//extern NSString *const MXAPISaveMusicAction;
//
///**
// *  保存曲线信息action
// */
//extern NSString *const MXAPISaveCurveAction;
//
///**
// *  上传设备传感器数据action
// */
//extern NSString *const MXAPIPutSensorDataAction;
//
///**
// *  添加文章信息action
// */
//extern NSString *const MXAPIAddArticleAction;
//
///**
// *  生成远程控制链接action
// */
//extern NSString *const MXAPIGenRemoteControlLinkAction;
//
//
//extern NSString *const MXServerAPIErrorDomain;
//
//@interface MXNetWorkTool : NSObject
//
///**
// *  根据错误码 构建NSError.NSError的域为TCAstroServerAPIErrorDomain 服务器产生的错误
// *  errorCode 错误码  message 错误描述  返回值：nil，没有错误；非nil，，errorCode相关的错误信息
// */
//+ (NSError *)errorWithCode:(NSNumber *)errorCode message:(NSString *)meaasge;
//
///**
// *  检查jsonObject是否符合规范，并根据jsonObject中错误码构建NSError，没有错误，返回nil
// *
// *  @return jsonObject必须包含result对象, ...部分表示实际数据，具体视接口而定
// */
//+ (NSError *)errorWithJsonObject:(id)jsonObject;
//
///**
// *  网络接口状态
// */
//+ (BOOL)networkReachabilityStatus;
//
///**
// *  将NSDictionary或者NSArray等json对象转换成json字符串
// */
//+ (NSString *)jsonStringWithJsonObject:(id)object;
//
//
///**
// *  发送一个GET请求
// *
// *  @param url     请求路径
// *  @param params  请求参数
// *  @param success 请求成功后的回调
// *  @param failure 请求失败后的回调
// */
//+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
//
///**
// *  发送一个POST请求
// *
// *  @param url     请求路径
// *  @param params  请求参数
// *  @param success 请求成功后的回调
// *  @param failure 请求失败后的回调
// */
//+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
//
//
//
///**
// *  发送一个POST请求(上传文件数据)
// *
// *  @param url           请求lujing
// *  @param params        请求参数
// *  @param formDataArray 文件参数
// *  @param success       请求成功的回调
// *  @param failure       请求失败的回调
// */
//+ (void)uploadImage:(UIImage *)image withUrl:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure;
//
///**
// *  发送一个POST请求上传文件
// *
// *  @param data    数据
// *  @param url     url
// *  @param success 成功回调
// *  @param failure 失败回调
// */
//+ (void)uploadData:(NSData *)data withUrl:(NSString *)url success:(void (^)(id))success failure:(void (^)(NSError *))failure;
//
///**
// *  下载语音文件
// */
//+ (void)downloadVoiceDateWithUrl:(NSString *)url success:(void (^)(NSData *))success failure:(void (^)(NSError *))failure;
//
//+ (void)postWithAction:(NSString *)action
//                     parameters:(NSDictionary*)parameters
//                        success:(void (^)(AFHTTPRequestOperation* operation, id responseObject))success
//                        failure:(void (^)(AFHTTPRequestOperation* operation, NSError* error))failure;
//+ (void)getWithAction:(NSString *)action
//            parameters:(NSString *)parameters
//               success:(void (^)(NSString *url))success
//               failure:(void (^)(NSString *errorStr))failure;
//@end
//
//
///**
// *  用来封装文件数据的模型
// */
//@interface MXFormData : NSObject
///**
// *  文件数据
// */
//@property (nonatomic , strong)NSData *data;
///**
// *  参数名
// */
//@property (nonatomic , copy)NSString *name;
///**
// *  文件名
// */
//@property (nonatomic , copy)NSString *filename;
///**
// *  文件类型
// */
//@property (nonatomic , copy)NSString *mimeType;
//
//@end