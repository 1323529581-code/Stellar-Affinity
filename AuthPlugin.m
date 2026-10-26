#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

static NSString * const kKeyActiveCode = @"ActiveAuthCode";
static NSString * const kKeyActiveDevice = @"ActiveAuthDevice";
static NSString * const kKeyActivationTime = @"ActiveAuthTime";
static NSString * const kKeyCodeType = @"ActiveCodeType";

static NSArray *getAuthDatabase() {
    static NSArray *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = @[
            @{@"code": @"DAY-Q5YN7-RB84O", @"type": @"日卡"}, @{@"code": @"DAY-41ZV1-D0TT5", @"type": @"日卡"}, @{@"code": @"DAY-MGQ96-9914P", @"type": @"日卡"}, @{@"code": @"DAY-0IPOM-JQT63", @"type": @"日卡"}, @{@"code": @"DAY-Y3CDZ-8EMY9", @"type": @"日卡"}, @{@"code": @"DAY-G6M6D-E9JNI", @"type": @"日卡"}, @{@"code": @"DAY-B4AWU-SL4CH", @"type": @"日卡"}, @{@"code": @"DAY-EWFCX-YYBRU", @"type": @"日卡"}, @{@"code": @"DAY-RRENX-U23AV", @"type": @"日卡"}, @{@"code": @"DAY-VYDWS-26ZK8", @"type": @"日卡"},
            @{@"code": @"DAY-J1Q4T-7Y1KS", @"type": @"日卡"}, @{@"code": @"DAY-1VPFW-843K4", @"type": @"日卡"}, @{@"code": @"DAY-ON9AD-IVGD1", @"type": @"日卡"}, @{@"code": @"DAY-WIMI2-ZJT3P", @"type": @"日卡"}, @{@"code": @"DAY-IF5F3-RQ3YA", @"type": @"日卡"}, @{@"code": @"DAY-7E1F7-8W9CP", @"type": @"日卡"}, @{@"code": @"DAY-3Z5EO-BU9I0", @"type": @"日卡"}, @{@"code": @"DAY-Z2392-LC2GJ", @"type": @"日卡"}, @{@"code": @"DAY-H14TJ-1D7V3", @"type": @"日卡"}, @{@"code": @"DAY-GJ37N-6SFQA", @"type": @"日卡"},
            @{@"code": @"DAY-A4PSI-SS53A", @"type": @"日卡"}, @{@"code": @"DAY-ZD1GO-O48F9", @"type": @"日卡"}, @{@"code": @"DAY-BNGV2-J3GSF", @"type": @"日卡"}, @{@"code": @"DAY-CHE20-M3H4D", @"type": @"日卡"}, @{@"code": @"DAY-DH9KI-DA1X3", @"type": @"日卡"}, @{@"code": @"DAY-W14HT-UYUP9", @"type": @"日卡"}, @{@"code": @"DAY-DA6XR-75Y7X", @"type": @"日卡"}, @{@"code": @"DAY-5O5ZH-0TEDV", @"type": @"日卡"}, @{@"code": @"DAY-DDPKD-EOVTH", @"type": @"日卡"}, @{@"code": @"DAY-IPRBG-64TIK", @"type": @"日卡"},
            @{@"code": @"DAY-LYJY8-AS910", @"type": @"日卡"}, @{@"code": @"DAY-GRYKX-H1FGP", @"type": @"日卡"}, @{@"code": @"DAY-XF5IO-SPS0G", @"type": @"日卡"}, @{@"code": @"DAY-SWC7G-04101", @"type": @"日卡"}, @{@"code": @"DAY-H6M3I-2LLIX", @"type": @"日卡"}, @{@"code": @"DAY-KCL19-W11QS", @"type": @"日卡"}, @{@"code": @"DAY-70PVN-3HYMN", @"type": @"日卡"}, @{@"code": @"DAY-01P3X-A5VPS", @"type": @"日卡"}, @{@"code": @"DAY-HY2IZ-II08V", @"type": @"日卡"}, @{@"code": @"DAY-F8SVQ-YZBPL", @"type": @"日卡"},
            @{@"code": @"DAY-0RDCI-7FR4O", @"type": @"日卡"}, @{@"code": @"DAY-IW01L-7QOJX", @"type": @"日卡"}, @{@"code": @"DAY-2PA5Z-6P9AH", @"type": @"日卡"}, @{@"code": @"DAY-D6QRV-TGZDC", @"type": @"日卡"}, @{@"code": @"DAY-9YXJK-47UCY", @"type": @"日卡"}, @{@"code": @"DAY-3DQT0-EVPMG", @"type": @"日卡"}, @{@"code": @"DAY-2IXN2-6Z8ZS", @"type": @"日卡"}, @{@"code": @"DAY-OITLJ-ZBAI8", @"type": @"日卡"}, @{@"code": @"DAY-Y6R7M-TUQJW", @"type": @"日卡"}, @{@"code": @"DAY-00FU5-5HDEZ", @"type": @"日卡"},
            @{@"code": @"DAY-E54BP-64ZKU", @"type": @"日卡"}, @{@"code": @"DAY-KYQF5-G7G1W", @"type": @"日卡"}, @{@"code": @"DAY-VJPRO-64AZT", @"type": @"日卡"}, @{@"code": @"DAY-V3B30-CLGAR", @"type": @"日卡"}, @{@"code": @"DAY-475Z9-1FKG2", @"type": @"日卡"}, @{@"code": @"DAY-F6P05-JDGL9", @"type": @"日卡"}, @{@"code": @"DAY-K8JAC-MOM18", @"type": @"日卡"}, @{@"code": @"DAY-IPM9C-EXIHG", @"type": @"日卡"}, @{@"code": @"DAY-8KNXP-U5RZ9", @"type": @"日卡"}, @{@"code": @"DAY-DD0WM-0H1PK", @"type": @"日卡"},
            @{@"code": @"DAY-CNM5K-ZN1AD", @"type": @"日卡"}, @{@"code": @"DAY-BRX2K-2V1RD", @"type": @"日卡"}, @{@"code": @"DAY-GF1WX-3VOS2", @"type": @"日卡"}, @{@"code": @"DAY-D9CXV-JYGRP", @"type": @"日卡"}, @{@"code": @"DAY-EXR4Z-N6646", @"type": @"日卡"}, @{@"code": @"DAY-OC25N-18YNB", @"type": @"日卡"}, @{@"code": @"DAY-2VB78-TP4F9", @"type": @"日卡"}, @{@"code": @"DAY-NAXL7-7JX0G", @"type": @"日卡"}, @{@"code": @"DAY-7RQUB-6JGVF", @"type": @"日卡"}, @{@"code": @"DAY-8FWMF-BWCBU", @"type": @"日卡"},
            @{@"code": @"DAY-BNLYO-2CYAJ", @"type": @"日卡"}, @{@"code": @"DAY-687V7-NJPS6", @"type": @"日卡"}, @{@"code": @"DAY-NU9U6-9W70A", @"type": @"日卡"}, @{@"code": @"DAY-E3F2Q-7BL7R", @"type": @"日卡"}, @{@"code": @"DAY-VESO4-S8GQU", @"type": @"日卡"}, @{@"code": @"DAY-M2CGK-ERIFA", @"type": @"日卡"}, @{@"code": @"DAY-I6OM8-DZQJK", @"type": @"日卡"}, @{@"code": @"DAY-0SJCA-TIQJK", @"type": @"日卡"}, @{@"code": @"DAY-2R5LF-RDY62", @"type": @"日卡"}, @{@"code": @"DAY-D4RCM-RRAYD", @"type": @"日卡"},
            @{@"code": @"DAY-LNMCN-7NV6Y", @"type": @"日卡"}, @{@"code": @"DAY-EEYPF-K5XC5", @"type": @"日卡"}, @{@"code": @"DAY-HVPVA-9NCJG", @"type": @"日卡"}, @{@"code": @"DAY-FW1YD-HL1HE", @"type": @"日卡"}, @{@"code": @"DAY-XW52Y-ITANL", @"type": @"日卡"}, @{@"code": @"DAY-KJLZR-W63RB", @"type": @"日卡"}, @{@"code": @"DAY-J0L7X-ZT8EM", @"type": @"日卡"}, @{@"code": @"DAY-P2HE7-T9VY7", @"type": @"日卡"}, @{@"code": @"DAY-5KVGD-BG51B", @"type": @"日卡"}, @{@"code": @"DAY-BFXLO-KM491", @"type": @"日卡"},
            @{@"code": @"DAY-FUSEL-LCJJX", @"type": @"日卡"}, @{@"code": @"DAY-60XSF-8BC43", @"type": @"日卡"}, @{@"code": @"DAY-YOH9G-FMAS0", @"type": @"日卡"}, @{@"code": @"DAY-VY835-7AM77", @"type": @"日卡"}, @{@"code": @"DAY-AMQH0-XTFBY", @"type": @"日卡"}, @{@"code": @"DAY-ABRRR-2Z4T7", @"type": @"日卡"}, @{@"code": @"DAY-RXXV0-FM7QV", @"type": @"日卡"}, @{@"code": @"DAY-0N0PJ-2F6DU", @"type": @"日卡"}, @{@"code": @"DAY-G0ZE9-M6RDE", @"type": @"日卡"}, @{@"code": @"DAY-BHOZB-8YYHG", @"type": @"日卡"},
            @{@"code": @"MON-2U7O1-DPTMT", @"type": @"月卡"}, @{@"code": @"MON-YBRLU-07X6W", @"type": @"月卡"}, @{@"code": @"MON-HB4MA-UU2RH", @"type": @"月卡"}, @{@"code": @"MON-60WG8-LZ195", @"type": @"月卡"}, @{@"code": @"MON-0RJ1P-I9TKF", @"type": @"月卡"}, @{@"code": @"MON-8BT5C-TMEXS", @"type": @"月卡"}, @{@"code": @"MON-LTTVX-7N02D", @"type": @"月卡"}, @{@"code": @"MON-NTYJ0-67WH0", @"type": @"月卡"}, @{@"code": @"MON-W3DTA-Z5IYO", @"type": @"月卡"}, @{@"code": @"MON-FI4EA-ADWV6", @"type": @"月卡"},
            @{@"code": @"MON-LBGZ3-C9BOZ", @"type": @"月卡"}, @{@"code": @"MON-ODQIF-QIYPC", @"type": @"月卡"}, @{@"code": @"MON-KFCD5-MY93W", @"type": @"月卡"}, @{@"code": @"MON-Y5TFP-KROWP", @"type": @"月卡"}, @{@"code": @"MON-QK96L-BWVBN", @"type": @"月卡"}, @{@"code": @"MON-W25EE-2P1CS", @"type": @"月卡"}, @{@"code": @"MON-L3OV8-ZEBVJ", @"type": @"月卡"}, @{@"code": @"MON-OIIXQ-X6YM1", @"type": @"月卡"}, @{@"code": @"MON-3Q3XJ-06EM0", @"type": @"月卡"}, @{@"code": @"MON-BKUVX-HEGAG", @"type": @"月卡"},
            @{@"code": @"MON-FK064-4W4G2", @"type": @"月卡"}, @{@"code": @"MON-F8949-BAOJB", @"type": @"月卡"}, @{@"code": @"MON-2RO9V-0R4AK", @"type": @"月卡"}, @{@"code": @"MON-YSN9Z-2KGJI", @"type": @"月卡"}, @{@"code": @"MON-5MYDJ-UTGYV", @"type": @"月卡"}, @{@"code": @"MON-7K1W7-IVXS5", @"type": @"月卡"}, @{@"code": @"MON-I861M-N0Q3X", @"type": @"月卡"}, @{@"code": @"MON-IDAPG-E0ZOG", @"type": @"月卡"}, @{@"code": @"MON-04KI6-08YKE", @"type": @"月卡"}, @{@"code": @"MON-FONLB-WD3RK", @"type": @"月卡"},
            @{@"code": @"MON-VB0YT-650PM", @"type": @"月卡"}, @{@"code": @"MON-LEVVI-ZHL51", @"type": @"月卡"}, @{@"code": @"MON-AH2CE-RJJQR", @"type": @"月卡"}, @{@"code": @"MON-FDPSW-PNQGC", @"type": @"月卡"}, @{@"code": @"MON-H3YZ5-4KWM6", @"type": @"月卡"}, @{@"code": @"MON-SA1U1-HEPZO", @"type": @"月卡"}, @{@"code": @"MON-I65LX-MWZ7B", @"type": @"月卡"}, @{@"code": @"MON-9GOT7-BOG0U", @"type": @"月卡"}, @{@"code": @"MON-EYUO7-97ZCI", @"type": @"月卡"}, @{@"code": @"MON-ZRSUE-Q1X8R", @"type": @"月卡"},
            @{@"code": @"MON-DRW6A-FBFIJ", @"type": @"月卡"}, @{@"code": @"MON-IELX9-CQVMB", @"type": @"月卡"}, @{@"code": @"MON-POWOM-XBWQ9", @"type": @"月卡"}, @{@"code": @"MON-ZKAU3-BF0MS", @"type": @"月卡"}, @{@"code": @"MON-FF5SO-M7TCR", @"type": @"月卡"}, @{@"code": @"MON-OK8LS-BRUW3", @"type": @"月卡"}, @{@"code": @"MON-YTFDE-C8LRD", @"type": @"月卡"}, @{@"code": @"MON-X0NDB-I0PYD", @"type": @"月卡"}, @{@"code": @"MON-ZLYDY-S13DS", @"type": @"月卡"}, @{@"code": @"MON-Q154Y-Q38V9", @"type": @"月卡"},
            @{@"code": @"MON-PX4NU-TSFY8", @"type": @"月卡"}, @{@"code": @"MON-CI1MP-1XHAF", @"type": @"月卡"}, @{@"code": @"MON-I3ZZG-1OGO4", @"type": @"月卡"}, @{@"code": @"MON-I6LMK-LLXFZ", @"type": @"月卡"}, @{@"code": @"MON-622K7-JZW1N", @"type": @"月卡"}, @{@"code": @"MON-UWKK8-MXWO4", @"type": @"月卡"}, @{@"code": @"MON-HRL8L-GPOIU", @"type": @"月卡"}, @{@"code": @"MON-A8XLL-R5544", @"type": @"月卡"}, @{@"code": @"MON-OPV7I-NHXOV", @"type": @"月卡"}, @{@"code": @"MON-4ZR7I-RDZ3W", @"type": @"月卡"},
            @{@"code": @"MON-9ZNB4-ZKZA7", @"type": @"月卡"}, @{@"code": @"MON-512G8-1OCH9", @"type": @"月卡"}, @{@"code": @"MON-BSROC-C2CO5", @"type": @"月卡"}, @{@"code": @"MON-9LU0P-T5HAV", @"type": @"月卡"}, @{@"code": @"MON-38H71-KSLKY", @"type": @"月卡"}, @{@"code": @"MON-AJEDM-QY2UA", @"type": @"月卡"}, @{@"code": @"MON-IAKQE-21LKT", @"type": @"月卡"}, @{@"code": @"MON-VJ5HM-XJJK8", @"type": @"月卡"}, @{@"code": @"MON-3CGCE-IUCAI", @"type": @"月卡"}, @{@"code": @"MON-QI0GM-FQDOT", @"type": @"月卡"},
            @{@"code": @"MON-EMZZD-KR2Q8", @"type": @"月卡"}, @{@"code": @"MON-PZ8O6-6TZDY", @"type": @"月卡"}, @{@"code": @"MON-A2LW0-BWRVT", @"type": @"月卡"}, @{@"code": @"MON-N0PVC-0ZW1B", @"type": @"月卡"}, @{@"code": @"MON-QL23F-EWFN5", @"type": @"月卡"}, @{@"code": @"MON-89FW5-0UL8K", @"type": @"月卡"}, @{@"code": @"MON-TKI2Z-2Z254", @"type": @"月卡"}, @{@"code": @"MON-I7GUF-GEQCZ", @"type": @"月卡"}, @{@"code": @"MON-G5PME-S664B", @"type": @"月卡"}, @{@"code": @"MON-3UM0C-ASPA5", @"type": @"月卡"},
            @{@"code": @"MON-3JWOD-Q1D0G", @"type": @"月卡"}, @{@"code": @"MON-13N96-FGSIM", @"type": @"月卡"}, @{@"code": @"MON-C1Q5I-P798Z", @"type": @"月卡"}, @{@"code": @"MON-X5FBB-9CVYE", @"type": @"月卡"}, @{@"code": @"MON-OY8JL-UAAIO", @"type": @"月卡"}, @{@"code": @"MON-LM0JW-7JBGY", @"type": @"月卡"}, @{@"code": @"MON-MXP2J-HPT40", @"type": @"月卡"}, @{@"code": @"MON-6BDX1-0TTYA", @"type": @"月卡"}, @{@"code": @"MON-NJFF2-MUDTI", @"type": @"月卡"}, @{@"code": @"MON-JWTE5-D79FJ", @"type": @"月卡"},
            @{@"code": @"MON-EPIPV-Q3D5L", @"type": @"月卡"}, @{@"code": @"MON-4LAJ5-81LL7", @"type": @"月卡"}, @{@"code": @"MON-KWU6N-T0VZW", @"type": @"月卡"}, @{@"code": @"MON-RAXJF-VRL7H", @"type": @"月卡"}, @{@"code": @"MON-VSSZK-573K1", @"type": @"月卡"}, @{@"code": @"MON-B8BXR-XQJMV", @"type": @"月卡"}, @{@"code": @"MON-6B3RM-4ZCRL", @"type": @"月卡"}, @{@"code": @"MON-GUX2P-P5Q2I", @"type": @"月卡"}, @{@"code": @"MON-51ZYD-M4QW0", @"type": @"月卡"}, @{@"code": @"MON-56JRD-OMXXB", @"type": @"月卡"},
            @{@"code": @"PER-BT79I-VOVSP", @"type": @"永久卡"}, @{@"code": @"PER-OS8AP-H6Z2O", @"type": @"永久卡"}, @{@"code": @"PER-GK1DD-3N5HA", @"type": @"永久卡"}, @{@"code": @"PER-TMNI4-N5IO3", @"type": @"永久卡"}, @{@"code": @"PER-SG4O6-EAQ57", @"type": @"永久卡"}, @{@"code": @"PER-N15CS-85WX3", @"type": @"永久卡"}, @{@"code": @"PER-T0SEK-688JN", @"type": @"永久卡"}, @{@"code": @"PER-WUGYA-3CC4M", @"type": @"永久卡"}, @{@"code": @"PER-IFU0K-2CQ9T", @"type": @"永久卡"}, @{@"code": @"PER-M98YO-B9R5X", @"type": @"永久卡"},
            @{@"code": @"PER-Y3436-GJR6J", @"type": @"永久卡"}, @{@"code": @"PER-1LU3W-AAH56", @"type": @"永久卡"}, @{@"code": @"PER-YQ7N5-WPFDQ", @"type": @"永久卡"}, @{@"code": @"PER-474XN-CZTF1", @"type": @"永久卡"}, @{@"code": @"PER-P75NS-ARX8L", @"type": @"永久卡"}, @{@"code": @"PER-9OUF8-XZYN0", @"type": @"永久卡"}, @{@"code": @"PER-IGWHC-8M7E2", @"type": @"永久卡"}, @{@"code": @"PER-8S124-D2WOW", @"type": @"永久卡"}, @{@"code": @"PER-M9Y7W-H7BMW", @"type": @"永久卡"}, @{@"code": @"PER-9H71L-ER68N", @"type": @"永久卡"},
            @{@"code": @"PER-5TH0C-9WQBK", @"type": @"永久卡"}, @{@"code": @"PER-WFF1Q-PUSUB", @"type": @"永久卡"}, @{@"code": @"PER-8ZUCL-30183", @"type": @"永久卡"}, @{@"code": @"PER-KM7XR-BM0EY", @"type": @"永久卡"}, @{@"code": @"PER-Z5S94-Q1WST", @"type": @"永久卡"}, @{@"code": @"PER-JQXJ1-ZK146", @"type": @"永久卡"}, @{@"code": @"PER-IH7ZS-JS83W", @"type": @"永久卡"}, @{@"code": @"PER-VL47I-E1PLB", @"type": @"永久卡"}, @{@"code": @"PER-JPKFI-5N8CR", @"type": @"永久卡"}, @{@"code": @"PER-51AOX-KSVRN", @"type": @"永久卡"},
            @{@"code": @"PER-N982Q-D869B", @"type": @"永久卡"}, @{@"code": @"PER-UH63O-8JWUV", @"type": @"永久卡"}, @{@"code": @"PER-YM7M3-MP6RJ", @"type": @"永久卡"}, @{@"code": @"PER-36SGJ-OANBE", @"type": @"永久卡"}, @{@"code": @"PER-OSO0K-UHQ6P", @"type": @"永久卡"}, @{@"code": @"PER-1IOIB-IKLBO", @"type": @"永久卡"}, @{@"code": @"PER-1IDQP-0HPAB", @"type": @"永久卡"}, @{@"code": @"PER-894KT-LB869", @"type": @"永久卡"}, @{@"code": @"PER-3BX9U-1L74O", @"type": @"永久卡"}, @{@"code": @"PER-9L0KC-XNNTR", @"type": @"永久卡"},
            @{@"code": @"PER-KIAB0-WJX6R", @"type": @"永久卡"}, @{@"code": @"PER-45N3O-FFCOK", @"type": @"永久卡"}, @{@"code": @"PER-1901D-PPDUY", @"type": @"永久卡"}, @{@"code": @"PER-X60W5-1E4BX", @"type": @"永久卡"}, @{@"code": @"PER-E2DAX-WFV17", @"type": @"永久卡"}, @{@"code": @"PER-5G7J1-LBL2Z", @"type": @"永久卡"}, @{@"code": @"PER-3J35Y-1O0GN", @"type": @"永久卡"}, @{@"code": @"PER-C5IQT-RAH6O", @"type": @"永久卡"}, @{@"code": @"PER-EJH0Q-2A5KH", @"type": @"永久卡"}, @{@"code": @"PER-PI276-USJKT", @"type": @"永久卡"},
            @{@"code": @"PER-75NH1-CK3PH", @"type": @"永久卡"}, @{@"code": @"PER-E6X4U-JVK3K", @"type": @"永久卡"}, @{@"code": @"PER-E5YON-4239X", @"type": @"永久卡"}, @{@"code": @"PER-DVRUN-9T90Q", @"type": @"永久卡"}, @{@"code": @"PER-LSYSV-3E1P3", @"type": @"永久卡"}, @{@"code": @"PER-4UIFL-OHNJ5", @"type": @"永久卡"}, @{@"code": @"PER-VDC31-5N9H2", @"type": @"永久卡"}, @{@"code": @"PER-FT0G7-4I5LN", @"type": @"永久卡"}, @{@"code": @"PER-ZHAH9-78TOD", @"type": @"永久卡"}, @{@"code": @"PER-YKGAG-UGV5R", @"type": @"永久卡"},
            @{@"code": @"PER-6MJGP-LT7RO", @"type": @"永久卡"}, @{@"code": @"PER-91LB9-USWLJ", @"type": @"永久卡"}, @{@"code": @"PER-JDY2I-48BEO", @"type": @"永久卡"}, @{@"code": @"PER-YPS5U-9ZT29", @"type": @"永久卡"}, @{@"code": @"PER-TKAWR-UPRYB", @"type": @"永久卡"}, @{@"code": @"PER-2AALX-4C54E", @"type": @"永久卡"}, @{@"code": @"PER-RPP1V-KSIMA", @"type": @"永久卡"}, @{@"code": @"PER-LEKO9-BNDDE", @"type": @"永久卡"}, @{@"code": @"PER-I4CDP-15JKF", @"type": @"永久卡"}, @{@"code": @"PER-0DLSM-UI5Y9", @"type": @"永久卡"},
            @{@"code": @"PER-4RKUC-0H2IC", @"type": @"永久卡"}, @{@"code": @"PER-CKE63-J9U0T", @"type": @"永久卡"}, @{@"code": @"PER-1JQ8G-PFOMH", @"type": @"永久卡"}, @{@"code": @"PER-UV5WK-3NA04", @"type": @"永久卡"}, @{@"code": @"PER-F0T7V-B27IF", @"type": @"永久卡"}, @{@"code": @"PER-VBUK3-TXMBG", @"type": @"永久卡"}, @{@"code": @"PER-PL9OA-M3KT7", @"type": @"永久卡"}, @{@"code": @"PER-ITT9Q-ZPDKQ", @"type": @"永久卡"}, @{@"code": @"PER-QGG72-7PIXQ", @"type": @"永久卡"}, @{@"code": @"PER-W3L6P-S9FDH", @"type": @"永久卡"},
            @{@"code": @"PER-ORPK4-95L2T", @"type": @"永久卡"}, @{@"code": @"PER-X0N69-6KD5I", @"type": @"永久卡"}, @{@"code": @"PER-ITG32-V1NH1", @"type": @"永久卡"}, @{@"code": @"PER-W2FZQ-JRDU9", @"type": @"永久卡"}, @{@"code": @"PER-E7VDY-COY5R", @"type": @"永久卡"}, @{@"code": @"PER-UKMBC-3RI8B", @"type": @"永久卡"}, @{@"code": @"PER-VFGHH-NGOLJ", @"type": @"永久卡"}, @{@"code": @"PER-336ED-MDC7B", @"type": @"永久卡"}, @{@"code": @"PER-Y73TA-MWECF", @"type": @"永久卡"}, @{@"code": @"PER-38SYY-XTWDU", @"type": @"永久卡"},
            @{@"code": @"PER-MFONE-CKUVY", @"type": @"永久卡"}, @{@"code": @"PER-4SV0K-86LP1", @"type": @"永久卡"}, @{@"code": @"PER-VU5VG-A4JFW", @"type": @"永久卡"}, @{@"code": @"PER-DHHD3-483BY", @"type": @"永久卡"}, @{@"code": @"PER-FNBMV-1E7U5", @"type": @"永久卡"}, @{@"code": @"PER-C5XKE-SRYBU", @"type": @"永久卡"}, @{@"code": @"PER-W0YUI-29B4A", @"type": @"永久卡"}, @{@"code": @"PER-YRK88-JHYFU", @"type": @"永久卡"}, @{@"code": @"PER-Q1GTE-P9NYC", @"type": @"永久卡"}, @{@"code": @"PER-DOF52-GD0WK", @"type": @"永久卡"}
        ];
    });
    return database;
}

@interface AuthManager : NSObject
+ (instancetype)sharedInstance;
- (void)checkAndLoad;
@end

@implementation AuthManager
+ (instancetype)sharedInstance {
    static AuthManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [[AuthManager alloc] init]; });
    return instance;
}
- (void)checkAndLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *activeCode = [defaults objectForKey:kKeyActiveCode];
    NSString *activeDevice = [defaults objectForKey:kKeyActiveDevice];
    NSTimeInterval activationTime = [defaults doubleForKey:kKeyActivationTime];
    NSString *codeType = [defaults objectForKey:kKeyCodeType];
    
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    BOOL isValid = NO;
    
    if (activeCode && [activeDevice isEqualToString:currentDevice]) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval elapsed = now - activationTime;
        if ([codeType isEqualToString:@"永久卡"]) isValid = YES;
        else if ([codeType isEqualToString:@"日卡"]) isValid = (elapsed < 24 * 3600);
        else if ([codeType isEqualToString:@"月卡"]) isValid = (elapsed < 30 * 24 * 3600);
    }
    
    if (isValid) {
        [self loadStellarDylib];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{ [self showAuthUI]; });
    }
}
- (void)loadStellarDylib {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *dylibPath = [bundlePath stringByAppendingPathComponent:@"Frameworks/stellaraffinity.dylib"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dylibPath]) { return; }
    dlopen([dylibPath UTF8String], RTLD_NOW);
}
- (void)showAuthUI {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (!rootVC) return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Stellar Affinity" message:@"请输入您的激活码以启动游戏" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) { textField.placeholder = @"粘贴或输入激活码"; }];
    UIAlertAction *activateAction = [UIAlertAction actionWithTitle:@"激活" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { [self verifyCode:alert.textFields.firstObject.text]; }];
    UIAlertAction *exitAction = [UIAlertAction actionWithTitle:@"退出游戏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { exit(0); }];
    [alert addAction:activateAction];
    [alert addAction:exitAction];
    [rootVC presentViewController:alert animated:YES completion:nil];
}
- (void)verifyCode:(NSString *)code {
    NSArray *codesArray = getAuthDatabase();
    BOOL codeFound = NO;
    NSString *cardType = nil;
    NSString *cleanCode = [[code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    for (NSDictionary *dict in codesArray) {
        if ([dict[@"code"] isEqualToString:cleanCode]) { codeFound = YES; cardType = dict[@"type"]; break; }
    }
    if (!codeFound) { [self showAlert:@"错误" message:@"激活码无效，请检查输入"]; return; }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedDevice = [defaults objectForKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if (savedDevice && ![savedDevice isEqualToString:currentDevice]) { [self showAlert:@"错误" message:@"该激活码已在其他设备绑定，无法跨设备使用"]; return; }
    
    [defaults setObject:cleanCode forKey:kKeyActiveCode];
    [defaults setObject:currentDevice forKey:kKeyActiveDevice];
    [defaults setObject:@([[NSDate date] timeIntervalSince1970]) forKey:kKeyActivationTime];
    [defaults setObject:cardType forKey:kKeyCodeType];
    [defaults setObject:currentDevice forKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    [defaults synchronize];
    [self loadStellarDylib];
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC dismissViewControllerAnimated:YES completion:^{ [self showAlert:@"成功" message:@"授权成功，祝您游戏愉快！"]; }];
}
- (void)showAlert:(NSString *)title message:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}
@end

__attribute__((constructor)) static void initPlugin() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AuthManager sharedInstance] checkAndLoad];
    });
}
