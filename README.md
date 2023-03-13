# 中文简体 | [English](https://github.com/DHDAXCW/NanoPi-R5S-2021/blob/main/EngLish.md)

# 云编译NanoPi-R5S NanoPi-R5C

# 说明

**👉使用本固件前，请严格遵守国家互联网使用相关法律规定,不要违反国家法律规定！👈**

## 固件分类
- 正式版（含超频）对折腾的，可以选择，电压一定要考虑。超频都是升压的，会造成不稳定的。比如跑cpu测试容易升压等。
- Docker版 含Docker插件，会导致udp转发失效 慎用哦，只要别开passwall的udp，啥都不影响使用！
- 稳定版 含有日常使用插件
- 此版本取消了精简版，改为稳定版

**注：不要用恢复备份，不保证某个插件是否正常运行，建议重新设置。**

# 源代码地址

- lede：https://github.com/DHDAXCW/lede-rockchip
- Luci：https://github.com/DHDAXCW/luci
- packages：https://github.com/DHDAXCW/packages

# 默认编译

- 用户名：root 密码：password  管理IP：192.168.10.1
- 下载地址： https://github.com/Siriling/NanoPi-R5S-R5C/releases
- 关于r5s刷机方法请参考dn2刷机 https://github.com/DHDAXCW/DoorNet-1-2/blob/mere/emmc.md
- 烧录软件内置提供：rk356x-MiniLoaderAll.bin
- Docker：正式版带docker，有超频，带有docker插件。（对passwall的udp要求很高，不要刷docker版本）
- 仅支持MT7921无线网卡
# 插件展示

 ![image](https://user-images.githubusercontent.com/74764072/183227361-e8bdb023-5514-437d-97e8-e13ca4285035.png)

# 鸣谢

特别感谢以下项目

- Openwrt 官方项目：

  <https://github.com/openwrt/openwrt>

- Lean 大的 Openwrt 项目：

  <https://github.com/coolsnowwolf/lede>

- immortalwrt 的 OpenWrt 项目：

  <https://github.com/immortalwrt/immortalwrt>

- P3TERX 大佬的 Actions-OpenWrt 项目：

  <https://github.com/P3TERX/Actions-OpenWrt>

- SuLingGG 大佬的 Actions 编译框架 项目：

  https://github.com/SuLingGG/OpenWrt-Rpi
