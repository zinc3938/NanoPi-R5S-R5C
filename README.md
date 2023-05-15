# 中文 | [English](https://github.com/DHDAXCW/NanoPi-R5S-2021/blob/main/EngLish.md)
# NanoPi-R5S NanoPi-R5C

# 目录

[一、简介](#一简介)

[二、源代码地址 ](#二源代码地址)

[三、固件说明](#三固件说明)

[四、资源链接](#四资源链接)

[五、插件展示](#五插件展示)

[六、鸣谢](#鸣谢)

# 一、简介

该项目从[DHDAXCW/NanoPi-R5S-R5C](https://github.com/DHDAXCW/NanoPi-R5S-R5C)进行定制，添加5G模块支持

# 二、源代码地址

- lede https://github.com/DHDAXCW/lede-rockchip
- Luci https://github.com/DHDAXCW/luci
- packages https://github.com/DHDAXCW/packages

# 三、固件说明

**该固件支持大多数5G模块，支持网卡MT7921系列和AW7916-NPD**

- 定制版：基于Docker版添加上5G模块的支持
- 正式版（含超频）：对折腾的，可以选择，电压一定要考虑。超频都是升压的，会造成不稳定的。比如跑cpu测试容易升压等。
- Docker版：含Docker插件，会导致udp转发失效 慎用哦，只要别开passwall的udp，啥都不影响使用！
- 稳定版：含有日常使用插件
- 乞丐版：最小化精简固件
- 下载地址： https://github.com/Siriling/NanoPi-R5S-R5C/releases

# 四、资源链接

- 关于r5s刷机方法请参考dn2刷机：[点击查看](https://github.com/DHDAXCW/DoorNet-1-2/blob/mere/emmc.md)
- USB烧录驱动程序：[点击查看](https://github.com/Siriling/NanoPi-R5S-R5C/tree/main/tools/%E9%A9%B1%E5%8A%A8%E7%A8%8B%E5%BA%8F)
- EMMC烧录软件：[点击查看](https://github.com/Siriling/NanoPi-R5S-R5C/tree/main/tools/%E7%83%A7%E5%BD%95%E8%BD%AF%E4%BB%B6)
- 5G模组拨号脚本：[点击查看](https://github.com/Siriling/NanoPi-R5S-R5C/tree/main/tools/5G%E6%8B%A8%E5%8F%B7%E8%84%9A%E6%9C%AC)

# 五、插件展示

![image](images/20.jpg)

# 六、鸣谢

Openwrt 官方项目：

<https://github.com/openwrt/openwrt>

Lean 大的 Openwrt 项目：

<https://github.com/coolsnowwolf/lede>

immortalwrt 的 OpenWrt 项目：

<https://github.com/immortalwrt/immortalwrt>

P3TERX 大佬的 Actions-OpenWrt 项目：

<https://github.com/P3TERX/Actions-OpenWrt>

SuLingGG 大佬的 Actions 编译框架 项目：

https://github.com/SuLingGG/OpenWrt-Rpi
