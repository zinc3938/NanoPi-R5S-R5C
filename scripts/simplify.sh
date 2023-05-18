#!/bin/bash
#=================================================
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

# 🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧🚧

# mt7921 mt7916
rm -rf package/kernel/mac80211
rm -rf package/kernel/rtl8821cu
rm -rf package/network/services/hostapd
svn export https://github.com/openwrt/openwrt/trunk/package/kernel/mac80211 package/kernel/mac80211
svn export https://github.com/openwrt/openwrt/trunk/package/network/services/hostapd package/network/services/hostapd
rm -rf package/kernel/mac80211/Makefile
cp -f $GITHUB_WORKSPACE/Makefile package/kernel/mac80211/Makefile

# Clone community packages
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../../customfeeds/luci/applications/luci-app-kodexplorer
rm -rf openwrt-package/verysync
rm -rf openwrt-package/luci-app-verysync

# Add luci-app-unblockneteasemusic
rm -rf ../../customfeeds/luci/applications/luci-app-unblockmusic
git clone --branch master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash

# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-dockerman
rm -rf ../../customfeeds/luci/collections/luci-lib-docker
rm -rf ../../customfeeds/luci/applications/luci-app-docker
rm -rf ../../customfeeds/luci/applications/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-theme
git clone https://github.com/DHDAXCW/theme
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

# Add luci-app-services-wolplus
svn export https://github.com/msylgj/OpenWrt_luci-app/trunk/luci-app-services-wolplus

# Add apk (Apk Packages Manager)
svn export https://github.com/openwrt/packages/trunk/utils/apk

# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
sed -i '/18.06/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 修改默认IP地址
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名字
sed -i 's/OpenWrt/R5S/g' package/base-files/files/bin/config_generate

# 修改版本号
# sed -i 's/R22.3.3/R22.3.3定制版/g' package/lean/default-settings/files/zzz-default-settings
# sed -i 's/OpenWrt/R5S/g' package/lean/default-settings/files/zzz-default-settings

# 系统信息内添加编译者信息
sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a\<tr><td width="33%"><%:Compiler author%><\/td><td>Siriling<\/td><\/tr><tr><td width="33%"><%:Resources link%><\/td><td><a target="_blank" style="padding-right: 20px;" href="https://github.com/Siriling/NanoPi-R5S-R5C">固件仓库<\/a><a target="_blank" style="padding-left: 20px;padding-right: 20px;" href="https://blog.siriling.com:1212/2023/03/18/openwrt-5g-modem">模组教程<\/a><\/td><\/tr>' package/lean/autocore/files/x86/index.htm
sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a\<tr><td width="33%"><%:Compiler author%><\/td><td>Siriling<\/td><\/tr><tr><td width="33%"><%:Resources link%><\/td><td><a target="_blank" style="padding-right: 20px;" href="https://github.com/Siriling/NanoPi-R5S-R5C">固件仓库<\/a><a target="_blank" style="padding-left: 20px;padding-right: 20px;" href="https://blog.siriling.com:1212/2023/03/18/openwrt-5g-modem">模组教程<\/a><\/td><\/tr>' package/lean/autocore/files/arm/index.htm

# 给添加的代码添加汉化
sed -i '$a\\nmsgid "Compiler author"\nmsgstr "编译作者"' feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i '$a\\nmsgid "Resources link"\nmsgstr "资源链接"' feeds/luci/modules/luci-base/po/zh-cn/base.po

# 修改默认背景
rm -rf customfeeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/images/bg1.jpg customfeeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# Test kernel 5.15
sed -i 's/5.4/6.1/g' ./target/linux/rockchip/Makefile
rm -rf target/linux/rockchip/image/armv8.mk
cp -f $GITHUB_WORKSPACE/armv8.mk target/linux/rockchip/image/armv8.mk
cp -f $GITHUB_WORKSPACE/999-fuck-rockchip-pcie.patch target/linux/rockchip/patches-6.1/999-fuck-rockchip-pcie.patch
